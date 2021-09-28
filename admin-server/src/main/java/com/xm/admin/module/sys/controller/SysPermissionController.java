package com.xm.admin.module.sys.controller;

import cn.hutool.core.util.ObjectUtil;
import com.xm.admin.common.annotation.SystemLog;
import com.xm.admin.common.utils.SecurityUtil;
import com.xm.admin.config.auth.security.RbacAuthorityService;
import com.xm.admin.config.auth.security.UserPrincipal;
import com.xm.admin.config.exception.BaseException;
import com.xm.admin.module.sys.entity.SysPermission;
import com.xm.admin.module.sys.payload.MenuAddEditRequest;
import com.xm.admin.module.sys.service.ISysPermissionService;
import com.xm.common.enums.ResultCodeEnums;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Result;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/**
 * <p>
 * 菜单权限表 前端控制器
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@RestController
@RequestMapping("/permission")
@CacheConfig(cacheNames = "permission")
public class SysPermissionController {

    private final ISysPermissionService permissionService;

    private final RbacAuthorityService rbacAuthorityService;

    private final StringRedisTemplate redisTemplate;

    public SysPermissionController(ISysPermissionService permissionService, RbacAuthorityService rbacAuthorityService, StringRedisTemplate redisTemplate) {
        this.permissionService = permissionService;
        this.rbacAuthorityService = rbacAuthorityService;
        this.redisTemplate = redisTemplate;
    }

    @GetMapping("/getMenuList")
    public Result<Object> getAllMenuList() {

        UserPrincipal user = SecurityUtil.getCurrentUser();
        List<Map<String, Object>> menuTree = permissionService.getUserPermission(Objects.requireNonNull(user).getId());
        return new ResultUtil<>().success(menuTree);
    }

    @GetMapping("getMenuTree")
    public Result<Object> getMenuTree(
            @RequestParam(required = false) String menuName,
            @RequestParam(required = false) Integer status,
            @RequestParam(required = false) Integer show
    ) {
        return new ResultUtil<>().success(permissionService.getAllPermission(menuName, status, show));
    }

    @GetMapping("/getPermCode")
    public Result<Object> getPermCode() {
        List<String> permissionCodes = Objects.requireNonNull(SecurityUtil.getCurrentUser()).getPermissionCodes();
        return new ResultUtil<>().success(permissionCodes);
    }

    @PostMapping("/add")
    @SystemLog(description = "添加菜单权限")
    @Transactional(rollbackFor = Exception.class)
    public Result<Object> add(@Valid @ModelAttribute MenuAddEditRequest menuAddEditRequest) {
        SysPermission permission = new SysPermission();
        permission.setType(menuAddEditRequest.getType());
        permission.setName(menuAddEditRequest.getMenuName());
        permission.setParentId(menuAddEditRequest.getParentMenu());
        permission.setSortOrder(menuAddEditRequest.getOrderNo());
        permission.setStatus(menuAddEditRequest.getStatus());
        permission.setIcon(menuAddEditRequest.getIcon());
        permission.setIsExternalLink(menuAddEditRequest.getIsExt());
        permission.setUrl(menuAddEditRequest.getRoutePath());
        permission.setIsDisplay(menuAddEditRequest.getShow());
        permission.setIsCache(menuAddEditRequest.getKeepalive());
        permission.setPermisionCode(menuAddEditRequest.getPermission());
        permission.setComponent(menuAddEditRequest.getComponent());
        permission.setCurrentActiveMenu(menuAddEditRequest.getCurrentActiveMenu());
        if (SysPermission.TYPE_BTN.equals(menuAddEditRequest.getType())) {
            permission.setMethod(menuAddEditRequest.getMethod());
        }

        if (permissionService.save(permission)) {

            String path = "";
            if (ObjectUtil.isNotNull(menuAddEditRequest.getParentMenu()) && menuAddEditRequest.getParentMenu() > 0) {
                SysPermission parent = permissionService.getById(menuAddEditRequest.getParentMenu());
                if (ObjectUtil.isNull(parent)) {
                    throw new BaseException(ResultCodeEnums.ERR, "父级菜单不存在");
                }
                path = parent.getPath();
            }

            path = path + (path.length() > 0 ? "," : "") + permission.getId();
            permission.setPath(path);
            if (!permissionService.updateById(permission)) {
                throw new BaseException(ResultCodeEnums.SAVE_DATA_ERROR);
            }

            //手动删除缓存
            this.clearPermissionCache();

            //更新需要检验的权限map
            rbacAuthorityService.loadResourceDefine();

            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @PostMapping("/edit")
    @SystemLog(description = "编辑菜单权限")
    @Transactional(rollbackFor = Exception.class)
    public Result<Object> edit(@Valid @ModelAttribute MenuAddEditRequest menuAddEditRequest) {
        SysPermission permission = permissionService.getById(menuAddEditRequest.getId());
        permission.setType(menuAddEditRequest.getType());
        permission.setName(menuAddEditRequest.getMenuName());
        permission.setParentId(menuAddEditRequest.getParentMenu());
        permission.setSortOrder(menuAddEditRequest.getOrderNo());
        permission.setStatus(menuAddEditRequest.getStatus());
        permission.setIcon(menuAddEditRequest.getIcon());
        permission.setIsExternalLink(menuAddEditRequest.getIsExt());
        permission.setUrl(menuAddEditRequest.getRoutePath());
        permission.setIsDisplay(menuAddEditRequest.getShow());
        permission.setIsCache(menuAddEditRequest.getKeepalive());
        permission.setPermisionCode(menuAddEditRequest.getPermission());
        permission.setComponent(menuAddEditRequest.getComponent());
        permission.setCurrentActiveMenu(menuAddEditRequest.getCurrentActiveMenu());
        if (SysPermission.TYPE_BTN.equals(menuAddEditRequest.getType())) {
            permission.setMethod(menuAddEditRequest.getMethod());
        }
        if (permissionService.updateById(permission)) {

            String path = "";
            if (menuAddEditRequest.getParentMenu() > 0) {
                SysPermission parent = permissionService.getById(menuAddEditRequest.getParentMenu());
                if (ObjectUtil.isNull(parent)) {
                    throw new BaseException(ResultCodeEnums.ERR, "父级不存在");
                }
                path = parent.getPath();
            }

            path = path + (path.length() > 0 ? "," : "") + permission.getId();
            permission.setPath(path);
            if (!permissionService.updateById(permission)) {
                throw new BaseException(ResultCodeEnums.SAVE_DATA_ERROR);
            }

            //手动删除缓存
            this.clearPermissionCache();

            //更新需要检验的权限map
            rbacAuthorityService.loadResourceDefine();

            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @DeleteMapping("/delete/{id}")
    @SystemLog(description = "删除菜单权限")
    public Result<Object> edit(@PathVariable String id) {
        if (permissionService.removeById(id)) {
            return new ResultUtil<>().success(true);
        }

        //手动删除缓存
        this.clearPermissionCache();

        //更新需要检验的权限map
        rbacAuthorityService.loadResourceDefine();

        return new ResultUtil<>().error();
    }

    private void clearPermissionCache()
    {
        redisTemplate.delete("permission::allPermissionCodes");
        Set<String> menuList = redisTemplate.keys("permission::adminMenuList:*");
        if (!ObjectUtils.isEmpty(menuList)) {
            redisTemplate.delete(menuList);
        }

        Set<String> userCodes = redisTemplate.keys("permission::userPermissionCodes:*");
        if (!ObjectUtils.isEmpty(userCodes)) {
            redisTemplate.delete(userCodes);
        }
    }
}
