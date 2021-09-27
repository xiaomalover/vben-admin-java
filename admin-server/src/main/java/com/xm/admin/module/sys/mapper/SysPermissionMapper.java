package com.xm.admin.module.sys.mapper;

import com.xm.admin.module.sys.entity.SysPermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单权限表 Mapper 接口
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Repository
public interface SysPermissionMapper extends BaseMapper<SysPermission> {

    /**
     * 获取菜单（权限）树
     *
     * @param menuName 菜单名
     * @param status   状态
     * @param show   展示状态
     * @return 菜单（权限）树
     */
    List<Map<String, Object>> selectAllPermissionListMap(String menuName, Integer status, Integer show);

    /**
     * 获取菜单树
     *
     * @param userId 用户ID
     * @return 菜单树
     */
    List<Map<String, Object>> selectUserPermissionListMap(Integer userId);

    /**
     * 通过用户id获取
     *
     * @param userId 用户主键
     * @return 权限列表
     */
    List<SysPermission> findPermissionCodeByUserId(@Param("userId") Integer userId);
}
