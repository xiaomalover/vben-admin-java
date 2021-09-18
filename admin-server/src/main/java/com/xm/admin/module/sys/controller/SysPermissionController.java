package com.xm.admin.module.sys.controller;

import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSONObject;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
public class SysPermissionController {

    private final ISysPermissionService permissionService;

    private final RbacAuthorityService rbacAuthorityService;

    public SysPermissionController(ISysPermissionService permissionService, RbacAuthorityService rbacAuthorityService) {
        this.permissionService = permissionService;
        this.rbacAuthorityService = rbacAuthorityService;
    }

    @GetMapping("/getMenuList")
    public Result<Object> getAllMenuList() {

        UserPrincipal user = SecurityUtil.getCurrentUser();
        List<Map<String, Object>> menuTree = permissionService.getMenuTree(Objects.requireNonNull(user).getId());
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

            //更新需要检验的权限map
            rbacAuthorityService.loadResourceDefine();

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

            //更新需要检验的权限map
            rbacAuthorityService.loadResourceDefine();

            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @DeleteMapping("/delete/{id}")
    public Result<Object> edit(@PathVariable String id) {
        if (permissionService.removeById(id)) {
            return new ResultUtil<>().success(true);
        }

        //更新需要检验的权限map
        rbacAuthorityService.loadResourceDefine();

        return new ResultUtil<>().error();
    }
}
