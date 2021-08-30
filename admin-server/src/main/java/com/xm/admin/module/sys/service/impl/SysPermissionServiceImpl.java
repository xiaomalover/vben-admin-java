package com.xm.admin.module.sys.service.impl;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.xm.admin.module.sys.entity.SysPermission;
import com.xm.admin.module.sys.mapper.SysPermissionMapper;
import com.xm.admin.module.sys.service.ISysPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
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
        return formatTree(menuList);
    }

    @Override
    public List<Map<String, Object>> getMenuTree(Integer userId) {

        List<Map<String, Object>> menuList = permissionMapper.selectUserPermissionListMap(userId);

        //格式化成后端菜单需要的格式
        List<Map<String, Object>> customList = new ArrayList<>();
        menuList.forEach(x -> {
            Map<String, Object> customMap = new HashMap<>();
            customMap.put("path", x.get("routePath"));
            customMap.put("component",
                    (ObjectUtil.isNotNull(x.get("component")) && StrUtil.isNotBlank(x.get("component").toString()))
                            ? x.get("component") : "LAYOUT"
            );
            customMap.put("id", x.get("id"));
            customMap.put("parentMenu", x.get("parentMenu"));
            customMap.put("name", x.get("menuName"));
            /*if (
                    ObjectUtil.isNotNull(x.get("type"))
                    && Convert.toInt(x.get("type")) != 2
                    && ObjectUtil.isNotNull((x.get("routePath")))
                    && StrUtil.isNotBlank(x.get("routePath").toString())
            ) {
                customMap.put("redirect", x.get("routePath"));
            }*/
            Map<String, Object> customMeta = new HashMap<>();
            customMeta.put("title", x.get("menuName"));
            if (ObjectUtil.isNotNull(x.get("icon")) && StrUtil.isNotBlank(x.get("icon").toString())) {
                customMeta.put("icon", x.get("icon"));
            }
            if (ObjectUtil.isNotNull(x.get("show")) && Convert.toInt(x.get("show")) == 0) {
                customMeta.put("hideMenu", true);
            }
            customMap.put("meta", customMeta);
            customList.add(customMap);
        });

        return formatTree(customList);
    }

    private List<Map<String, Object>> formatTree(List<Map<String, Object>> treeList)
    {
        List<Map<String, Object>> formatTreeList = new ArrayList<>();
        // 循环查出的list，找到根节点（最大的父节点）的子节点
        for (Map<String, Object> map : treeList) {
            // 我们这里最大的根节点ID是-1，所以首先找pid为-1的子，然后调用我们的递归算法
            if ("0".equals(map.get("parentMenu").toString())) {
                List<Map<String, Object>> childrenList = addChild(map, treeList);
                if (ObjectUtil.isNotNull(childrenList) && !childrenList.isEmpty()) {
                    map.put("children", childrenList);
                }
                formatTreeList.add(map);
            }
        }
        return formatTreeList;
    }

    private List<Map<String, Object>> addChild(Map<String, Object> parentMap, List<Map<String, Object>> list) {
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
