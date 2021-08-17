package com.xm.admin.module.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.sys.entity.SysRole;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xm.common.vo.ExtraVo;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
public interface ISysRoleService extends IService<SysRole> {

    /**
     * 获取角色列表
     *
     * @param     page      分业相关
     * @param     extraVo   附加参数
     * @param     conditionMap  搜索条件
     * @return 角色列表
     */
    IPage<Map<String, Object>> getRoleList(IPage<Map<String, Object>> page, ExtraVo extraVo, Map<String, Object> conditionMap);

    /**
     * 获取所有角色列表
     *
     * @return 角色列表
     */
    List<Map<String, Object>> getAllRoleList();
}
