package com.xm.admin.module.sys.service;

import com.xm.admin.module.sys.entity.SysPermission;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单权限表 服务类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
public interface ISysPermissionService extends IService<SysPermission> {

    /**
     * 获取菜单（权限）树
     *
     * @param menuName 菜单名
     * @param status   状态
     * @return 菜单（权限）树
     */
    List<Map<String, Object>> getPermissionTree(String menuName, Integer status);

    /**
     * 获取菜单树
     * @return 菜单树
     */
    List<Map<String, Object>> getMenuTree();
}
