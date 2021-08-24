package com.xm.admin.module.sys.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xm.admin.module.sys.dto.MenuAddEditRequest;
import com.xm.admin.module.sys.entity.SysAdmin;
import com.xm.admin.module.sys.entity.SysPermission;
import com.xm.admin.module.sys.service.ISysAdminService;
import com.xm.admin.module.sys.service.ISysPermissionService;
import com.xm.common.enums.ResultCodeEnums;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Result;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单权限表 前端控制器
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@RestController
@RequestMapping("/skeleton/permission")
public class SysPermissionController {

    private final ISysPermissionService permissionService;

    private final ISysAdminService sysAdminService;

    public SysPermissionController(ISysPermissionService permissionService, ISysAdminService sysAdminService) {
        this.permissionService = permissionService;
        this.sysAdminService = sysAdminService;
    }

    @GetMapping("/getMenuList")
    public Result<Object> getAllMenuList() {

        String username = "";
        //获取当前用户ID
        if (!ObjectUtils.isEmpty(SecurityContextHolder.getContext())) {
            if (!ObjectUtils.isEmpty(SecurityContextHolder.getContext().getAuthentication())) {
                if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
                    UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                    if (ObjectUtil.isNotNull(user)) {
                        username = user.getUsername();
                    }
                }
            }
        }
        if (StrUtil.isBlank(username)) {
            return new ResultUtil<>().success("用户未登录");
        }

        //查找用户ID
        QueryWrapper<SysAdmin> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        SysAdmin admin = sysAdminService.getOne(queryWrapper);
        if (ObjectUtil.isNull(admin)) {
            return new ResultUtil<>().success("无效用户");
        }
        List<Map<String, Object>> menuTree = permissionService.getMenuTree(admin.getId());
        return new ResultUtil<>().success(menuTree);
    }

    @GetMapping("/getMenuListDemo")
    public Result<Object> getAllMenuListDemo() {
        Object object = JSONObject.parse(
                "[\n" +
                        "        {\n" +
                        "            \"path\": \"/dashboard\",\n" +
                        "            \"name\": \"Dashboard\",\n" +
                        "            \"component\": \"/dashboard/analysis/index\",\n" +
                       // "            \"redirect\": \"/dashboard/analysis\",\n" +
                        "            \"meta\": {\n" +
                        "                \"title\": \"routes.dashboard.dashboard\",\n" +
                        "                \"hideChildrenInMenu\": true,\n" +
                        "                \"icon\": \"bx:bx-home\"\n" +
                        "            },\n" +
                        "            \"children\": [\n" +
                        "                {\n" +
                        "                    \"path\": \"analysis\",\n" +
                        "                    \"name\": \"Analysis\",\n" +
                        "                    \"component\": \"/dashboard/analysis/index\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"hideMenu\": true,\n" +
                        "                        \"hideBreadcrumb\": true,\n" +
                        "                        \"title\": \"routes.dashboard.analysis\",\n" +
                        "                        \"currentActiveMenu\": \"/dashboard\",\n" +
                        "                        \"icon\": \"bx:bx-home\"\n" +
                        "                    }\n" +
                        "                },\n" +
                        "                {\n" +
                        "                    \"path\": \"workbench\",\n" +
                        "                    \"name\": \"Workbench\",\n" +
                        "                    \"component\": \"/dashboard/workbench/index\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"hideMenu\": true,\n" +
                        "                        \"hideBreadcrumb\": true,\n" +
                        "                        \"title\": \"routes.dashboard.workbench\",\n" +
                        "                        \"currentActiveMenu\": \"/dashboard\",\n" +
                        "                        \"icon\": \"bx:bx-home\"\n" +
                        "                    }\n" +
                        "                }\n" +
                        "            ]\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"path\": \"/permission\",\n" +
                        "            \"name\": \"Permission\",\n" +
                        "            \"component\": \"LAYOUT\",\n" +
                        "            \"redirect\": \"/permission/front/page\",\n" +
                        "            \"meta\": {\n" +
                        "                \"icon\": \"carbon:user-role\",\n" +
                        "                \"title\": \"routes.demo.permission.permission\"\n" +
                        "            },\n" +
                        "            \"children\": [\n" +
                        "                {\n" +
                        "                    \"path\": \"back\",\n" +
                        "                    \"name\": \"PermissionBackDemo\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"routes.demo.permission.back\"\n" +
                        "                    },\n" +
                        "                    \"children\": [\n" +
                        "                        {\n" +
                        "                            \"path\": \"page\",\n" +
                        "                            \"name\": \"BackAuthPage\",\n" +
                        "                            \"component\": \"/demo/permission/back/index\",\n" +
                        "                            \"meta\": {\n" +
                        "                                \"title\": \"routes.demo.permission.backPage\"\n" +
                        "                            }\n" +
                        "                        },\n" +
                        "                        {\n" +
                        "                            \"path\": \"btn\",\n" +
                        "                            \"name\": \"BackAuthBtn\",\n" +
                        "                            \"component\": \"/demo/permission/back/Btn\",\n" +
                        "                            \"meta\": {\n" +
                        "                                \"title\": \"routes.demo.permission.backBtn\"\n" +
                        "                            }\n" +
                        "                        }\n" +
                        "                    ]\n" +
                        "                }\n" +
                        "            ]\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"path\": \"/level\",\n" +
                        "            \"name\": \"Level\",\n" +
                        "            \"component\": \"LAYOUT\",\n" +
                        "            \"redirect\": \"/level/menu1/menu1-1\",\n" +
                        "            \"meta\": {\n" +
                        "                \"icon\": \"carbon:user-role\",\n" +
                        "                \"title\": \"routes.demo.level.level\"\n" +
                        "            },\n" +
                        "            \"children\": [\n" +
                        "                {\n" +
                        "                    \"path\": \"menu1\",\n" +
                        "                    \"name\": \"Menu1Demo\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"Menu1\"\n" +
                        "                    },\n" +
                        "                    \"children\": [\n" +
                        "                        {\n" +
                        "                            \"path\": \"menu1-1\",\n" +
                        "                            \"name\": \"Menu11Demo\",\n" +
                        "                            \"meta\": {\n" +
                        "                                \"title\": \"Menu1-1\"\n" +
                        "                            },\n" +
                        "                            \"children\": [\n" +
                        "                                {\n" +
                        "                                    \"path\": \"menu1-1-1\",\n" +
                        "                                    \"name\": \"Menu111Demo\",\n" +
                        "                                    \"component\": \"/demo/level/Menu111\",\n" +
                        "                                    \"meta\": {\n" +
                        "                                        \"title\": \"Menu111\"\n" +
                        "                                    }\n" +
                        "                                }\n" +
                        "                            ]\n" +
                        "                        },\n" +
                        "                        {\n" +
                        "                            \"path\": \"menu1-2\",\n" +
                        "                            \"name\": \"Menu12Demo\",\n" +
                        "                            \"component\": \"/demo/level/Menu12\",\n" +
                        "                            \"meta\": {\n" +
                        "                                \"title\": \"Menu1-2\"\n" +
                        "                            }\n" +
                        "                        }\n" +
                        "                    ]\n" +
                        "                },\n" +
                        "                {\n" +
                        "                    \"path\": \"menu2\",\n" +
                        "                    \"name\": \"Menu2Demo\",\n" +
                        "                    \"component\": \"/demo/level/Menu2\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"Menu2\"\n" +
                        "                    }\n" +
                        "                }\n" +
                        "            ]\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"path\": \"/system\",\n" +
                        "            \"name\": \"System\",\n" +
                        "            \"component\": \"LAYOUT\",\n" +
                        "            \"redirect\": \"/system/account\",\n" +
                        "            \"meta\": {\n" +
                        "                \"icon\": \"ion:settings-outline\",\n" +
                        "                \"title\": \"routes.demo.system.moduleName\"\n" +
                        "            },\n" +
                        "            \"children\": [\n" +
                        "                {\n" +
                        "                    \"path\": \"account\",\n" +
                        "                    \"name\": \"AccountManagement\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"routes.demo.system.account\",\n" +
                        "                        \"ignoreKeepAlive\": true\n" +
                        "                    },\n" +
                        "                    \"component\": \"/demo/system/account/index\"\n" +
                        "                },\n" +
                        "                {\n" +
                        "                    \"path\": \"account_detail/:id\",\n" +
                        "                    \"name\": \"AccountDetail\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"hideMenu\": true,\n" +
                        "                        \"title\": \"routes.demo.system.account_detail\",\n" +
                        "                        \"ignoreKeepAlive\": true,\n" +
                        "                        \"showMenu\": false,\n" +
                        "                        \"currentActiveMenu\": \"/system/account\"\n" +
                        "                    },\n" +
                        "                    \"component\": \"/demo/system/account/AccountDetail\"\n" +
                        "                },\n" +
                        "                {\n" +
                        "                    \"path\": \"role\",\n" +
                        "                    \"name\": \"RoleManagement\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"routes.demo.system.role\",\n" +
                        "                        \"ignoreKeepAlive\": true\n" +
                        "                    },\n" +
                        "                    \"component\": \"/demo/system/role/index\"\n" +
                        "                },\n" +
                        "                {\n" +
                        "                    \"path\": \"menu\",\n" +
                        "                    \"name\": \"MenuManagement\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"routes.demo.system.menu\",\n" +
                        "                        \"ignoreKeepAlive\": true\n" +
                        "                    },\n" +
                        "                    \"component\": \"/demo/system/menu/index\"\n" +
                        "                },\n" +
                        "                {\n" +
                        "                    \"path\": \"dept\",\n" +
                        "                    \"name\": \"DeptManagement\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"routes.demo.system.dept\",\n" +
                        "                        \"ignoreKeepAlive\": true\n" +
                        "                    },\n" +
                        "                    \"component\": \"/demo/system/dept/index\"\n" +
                        "                },\n" +
                        "                {\n" +
                        "                    \"path\": \"changePassword\",\n" +
                        "                    \"name\": \"ChangePassword\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"routes.demo.system.password\",\n" +
                        "                        \"ignoreKeepAlive\": true\n" +
                        "                    },\n" +
                        "                    \"component\": \"/demo/system/password/index\"\n" +
                        "                }\n" +
                        "            ]\n" +
                        "        },\n" +
                        "        {\n" +
                        "            \"path\": \"/link\",\n" +
                        "            \"name\": \"Link\",\n" +
                        "            \"component\": \"LAYOUT\",\n" +
                        "            \"meta\": {\n" +
                        "                \"icon\": \"ion:tv-outline\",\n" +
                        "                \"title\": \"routes.demo.iframe.frame\"\n" +
                        "            },\n" +
                        "            \"children\": [\n" +
                        "                {\n" +
                        "                    \"path\": \"doc\",\n" +
                        "                    \"name\": \"Doc\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"routes.demo.iframe.doc\",\n" +
                        "                        \"frameSrc\": \"https://vvbin.cn/doc-next/\"\n" +
                        "                    }\n" +
                        "                },\n" +
                        "                {\n" +
                        "                    \"path\": \"https://vvbin.cn/doc-next/\",\n" +
                        "                    \"name\": \"DocExternal\",\n" +
                        "                    \"component\": \"LAYOUT\",\n" +
                        "                    \"meta\": {\n" +
                        "                        \"title\": \"routes.demo.iframe.docExternal\"\n" +
                        "                    }\n" +
                        "                }\n" +
                        "            ]\n" +
                        "        }\n" +
                        "    ]");

        return new ResultUtil<>().success(object);
    }

    @GetMapping("getMenuTree")
    public Result<Object> getMenuTree(
            @RequestParam(required = false) String menuName,
            @RequestParam(required = false) Integer status
    ) {
        return new ResultUtil<>().success(permissionService.getPermissionTree(menuName, status));
    }

    @GetMapping("/getPermCode")
    public Result<Object> getPermCode() {
        Object result = JSONObject.parse("[\"1000\", \"3000\", \"5000\"]");
        return new ResultUtil<>().success(result);
    }

    @PostMapping("/add")
    @Transactional(rollbackFor = Exception.class)
    public Result<Object> add(@Valid @ModelAttribute MenuAddEditRequest menuAddEditRequest) throws Exception {
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

        if (permissionService.save(permission)) {

            String path = "";
            if (menuAddEditRequest.getParentMenu() > 0) {
                SysPermission parent = permissionService.getById(menuAddEditRequest.getParentMenu());
                if (ObjectUtil.isNull(parent)) {
                    throw new Exception("父级菜单不存在");
                }
                path = parent.getPath();
            }

            path = path + (path.length() > 0 ? "," : "") + permission.getId();
            permission.setPath(path);
            if (!permissionService.updateById(permission)) {
                throw new Exception(ResultCodeEnums.SAVE_DATA_ERROR.getMsg());
            }

            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @PostMapping("/edit")
    @Transactional(rollbackFor = Exception.class)
    public Result<Object> edit(@Valid @ModelAttribute MenuAddEditRequest menuAddEditRequest) throws Exception {
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
        if (permissionService.updateById(permission)) {

            String path = "";
            if (menuAddEditRequest.getParentMenu() > 0) {
                SysPermission parent = permissionService.getById(menuAddEditRequest.getParentMenu());
                if (ObjectUtil.isNull(parent)) {
                    throw new Exception("父级菜单不存在");
                }
                path = parent.getPath();
            }

            path = path + (path.length() > 0 ? "," : "") + permission.getId();
            permission.setPath(path);
            if (!permissionService.updateById(permission)) {
                throw new Exception(ResultCodeEnums.SAVE_DATA_ERROR.getMsg());
            }

            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @DeleteMapping("/delete/{id}")
    public Result<Object> edit(@PathVariable String id) {
        if (permissionService.removeById(id)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }
}
