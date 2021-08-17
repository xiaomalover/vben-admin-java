package com.xm.admin.module.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.sys.entity.SysRole;
import com.xm.admin.module.sys.mapper.SysRoleMapper;
import com.xm.admin.module.sys.service.ISysRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xm.common.vo.ExtraVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements ISysRoleService {

    private final SysRoleMapper roleMapper;

    public SysRoleServiceImpl(SysRoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }

    @Override
    public IPage<Map<String, Object>> getRoleList(IPage<Map<String, Object>> page, ExtraVo extraVo, Map<String, Object> conditionMap) {
        return roleMapper.selectRoleList(page, extraVo, conditionMap);
    }

    @Override
    public List<Map<String, Object>> getAllRoleList() {
        return roleMapper.selectAllRoleList();
    }
}
