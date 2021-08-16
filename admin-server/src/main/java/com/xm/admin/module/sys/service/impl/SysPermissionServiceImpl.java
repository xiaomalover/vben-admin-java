package com.xm.admin.module.sys.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.xm.admin.module.sys.entity.SysPermission;
import com.xm.admin.module.sys.mapper.SysPermissionMapper;
import com.xm.admin.module.sys.service.ISysPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单权限表 服务实现类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Service
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionMapper, SysPermission> implements ISysPermissionService {

    private final SysPermissionMapper permissionMapper;

    public SysPermissionServiceImpl(SysPermissionMapper permissionMapper) {
        this.permissionMapper = permissionMapper;
    }

    @Override
    public List<Map<String, Object>> getPermissionTree(String menuName, Integer status) {

        List<Map<String, Object>> menuList = permissionMapper.selectAllPermissionListMap(menuName, status);

        List<Map<String, Object>> treeList = new ArrayList<>();
        // 循环查出的list，找到根节点（最大的父节点）的子节点
        for (Map<String, Object> map : menuList) {
            // 我们这里最大的根节点ID是-1，所以首先找pid为-1的子，然后调用我们的递归算法
            if ("0".equals(map.get("parentMenu").toString())) {
                List<Map<String, Object>> childrenList = addChild(map, menuList);
                if (ObjectUtil.isNotNull(childrenList) && !childrenList.isEmpty()) {
                    map.put("children", childrenList);
                }
                treeList.add(map);
            }
        }
        return treeList;
    }

    public List<Map<String, Object>> addChild(Map<String, Object> parentMap, List<Map<String, Object>> list) {
        List<Map<String, Object>> childList = new ArrayList<>();
        for (Map<String, Object> childMap : list) {
            //如果子节点的pid等于父节点的ID，则说明是父子关系
            if (
                    ObjectUtil.isNotNull(childMap.get("parentMenu")) &&
                    ObjectUtil.isNotNull(parentMap.get("id")) &&
                    childMap.get("parentMenu").toString().equals(parentMap.get("id").toString())
            ) {
                // 是父子关系，则将其放入子list字面
                childList.add(childMap);
                // 继续调用递归算法，将当前作为父节点，继续找他的子节点，反复执行。
                addChild(childMap, list);
            }
        }

        if (!childList.isEmpty()) {
            // 为每一个父节点增加子树（List形式，没有则为空的list）
            parentMap.put("children", childList);
        }

        // 当遍历完成，返回调用的父节点的所有子节点
        return childList;
    }
}
