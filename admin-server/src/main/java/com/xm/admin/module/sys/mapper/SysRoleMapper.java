package com.xm.admin.module.sys.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.sys.entity.SysRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xm.common.vo.ExtraVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Repository
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 获取角色列表
     *
     * @param     page      分业相关
     * @param     extraVo   附加参数
     * @param     conditionMap  搜索条件
     * @return 角色列表
     */
    IPage<SysRole> selectRoleList(IPage<SysRole> page, @Param("extraVo") ExtraVo extraVo, @Param("conditionMap") Map<String, Object> conditionMap);

    /**
     * 获取所有角色列表
     *
     * @return 角色列表
     */
    List<SysRole> selectAllRoleList();
}
