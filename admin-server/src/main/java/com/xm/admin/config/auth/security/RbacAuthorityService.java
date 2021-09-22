package com.xm.admin.config.auth.security;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.xm.admin.module.sys.entity.SysPermission;
import com.xm.admin.module.sys.service.ISysPermissionService;
import com.xm.common.enums.ResultCodeEnums;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.condition.RequestMethodsRequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 动态路由认证
 * </p>
 *
 */
@Component
public class RbacAuthorityService {

    private Map<String, Collection<ConfigAttribute>> map = null;

    private final RequestMappingHandlerMapping mapping;

    private final ISysPermissionService sysPermissionService;

    public RbacAuthorityService(RequestMappingHandlerMapping mapping, ISysPermissionService sysPermissionService) {
        this.mapping = mapping;
        this.sysPermissionService = sysPermissionService;
    }

    /**
     * 加载权限表中所所有的按钮权限
     */
    public void loadResourceDefine() {
        map = new HashMap<>(16);
        Collection<ConfigAttribute> configAttributes;
        ConfigAttribute cfg;
        // 获取启用的权限操作请求
        List<SysPermission> permissions = sysPermissionService.getAllPermissionCodes();
        for (SysPermission permission : permissions) {
            if (StrUtil.isNotBlank(permission.getName()) && StrUtil.isNotBlank(permission.getUrl())) {
                configAttributes = new ArrayList<>();
                cfg = new SecurityConfig(permission.getName());
                //作为MyAccessDecisionManager类的decide的第三个参数
                configAttributes.add(cfg);
                //用权限的path作为map的key，用ConfigAttribute的集合作为value
                map.put(permission.getUrl(), configAttributes);
            }
        }
    }

    public boolean hasPermission(HttpServletRequest request, Authentication authentication) {
        checkRequest(request);

        Object userInfo = authentication.getPrincipal();
        boolean hasPermission = false;

        if (userInfo instanceof UserDetails) {
            UserPrincipal principal = (UserPrincipal) userInfo;
            Integer userId = principal.getId();

            // 获取启用的权限操作请求
            List<SysPermission> permissions = sysPermissionService.getUserPermissionCodes(userId);

            //获取资源，前后端分离，所以过滤页面权限，只保留按钮权限
            List<SysPermission> btnPerms = permissions.stream()
                // 过滤 URL 为空
                .filter(permission -> StrUtil.isNotBlank(permission.getUrl()))
                // 过滤 METHOD 为空
                .filter(permission -> StrUtil.isNotBlank(permission.getMethod())).collect(Collectors.toList());

            //判断请求url在不在权限列表中不在
            if (ObjectUtil.isNull(map)) {
                loadResourceDefine();
            }
            if (!needCheck(request.getRequestURI().replace(request.getContextPath(), ""))) {
                return true;
            }

            for (SysPermission btnPerm : btnPerms) {
                AntPathRequestMatcher antPathMethodMatcher = new AntPathRequestMatcher(btnPerm.getUrl(), btnPerm.getMethod());
                if (antPathMethodMatcher.matches(request)) {
                    hasPermission = true;
                    break;
                }
            }

            return hasPermission;
        } else {
            return false;
        }
    }

    public boolean needCheck(String  url) throws IllegalArgumentException {

        if (map == null) {
            loadResourceDefine();
        }

        //Object中包含用户请求request
        PathMatcher pathMatcher = new AntPathMatcher();
        for (String resURL : map.keySet()) {
            if (StrUtil.isNotBlank(resURL) && pathMatcher.match(resURL, url)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 校验请求是否存在
     *
     * @param request 请求
     */
    private void checkRequest(HttpServletRequest request) {
        // 获取当前 request 的方法
        String currentMethod = request.getMethod();
        Multimap<String, String> urlMapping = allUrlMapping();

        for (String uri : urlMapping.keySet()) {
            // 通过 AntPathRequestMatcher 匹配 url
            // 可以通过 2 种方式创建 AntPathRequestMatcher
            // 1：new AntPathRequestMatcher(uri,method) 这种方式可以直接判断方法是否匹配，因为这里我们把 方法不匹配 自定义抛出，所以，我们使用第2种方式创建
            // 2：new AntPathRequestMatcher(uri) 这种方式不校验请求方法，只校验请求路径
            AntPathRequestMatcher antPathMatcher = new AntPathRequestMatcher(uri);
            if (antPathMatcher.matches(request)) {
                if (!urlMapping.get(uri).contains(currentMethod)) {
                    throw new MySecurityException(ResultCodeEnums.HTTP_BAD_METHOD);
                } else {
                    return;
                }
            }
        }

        throw new MySecurityException(ResultCodeEnums.REQUEST_NOT_FOUND);
    }

    /**
     * 获取 所有URL Mapping，返回格式为{"/test":["GET","POST"],"/sys":["GET","DELETE"]}
     *
     * @return {@link ArrayListMultimap} 格式的 URL Mapping
     */
    private Multimap<String, String> allUrlMapping() {
        Multimap<String, String> urlMapping = ArrayListMultimap.create();

        // 获取url与类和方法的对应信息
        Map<RequestMappingInfo, HandlerMethod> handlerMethods = mapping.getHandlerMethods();

        handlerMethods.forEach((k, v) -> {
            // 获取当前 key 下的获取所有URL
            Set<String> url = Objects.requireNonNull(k.getPatternsCondition()).getPatterns();
            RequestMethodsRequestCondition method = k.getMethodsCondition();

            // 为每个URL添加所有的请求方法
            url.forEach(s -> urlMapping.putAll(s, method.getMethods().stream().map(Enum::toString).collect(Collectors.toList())));
        });

        return urlMapping;
    }
}
