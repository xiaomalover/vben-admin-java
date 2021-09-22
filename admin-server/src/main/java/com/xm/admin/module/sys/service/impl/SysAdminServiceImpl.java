package com.xm.admin.module.sys.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.xm.admin.module.sys.entity.SysAdmin;
import com.xm.admin.module.sys.entity.SysDepartment;
import com.xm.admin.module.sys.entity.SysPermission;
import com.xm.admin.module.sys.entity.SysRole;
import com.xm.admin.module.sys.mapper.SysAdminMapper;
import com.xm.admin.module.sys.mapper.SysRoleMapper;
import com.xm.admin.module.sys.service.ISysAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xm.admin.module.sys.service.ISysDepartmentService;
import com.xm.admin.module.sys.service.ISysPermissionService;
import com.xm.common.enums.CommonStatus;
import com.xm.common.vo.ExtraVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Service
public class SysAdminServiceImpl extends ServiceImpl<SysAdminMapper, SysAdmin> implements ISysAdminService {

    private final SysAdminMapper adminMapper;

    private final ISysDepartmentService departmentService;

    private final SysRoleMapper roleMapper;

    private final ISysPermissionService permissionService;

    public SysAdminServiceImpl(SysAdminMapper adminMapper, ISysDepartmentService departmentService, SysRoleMapper roleMapper, ISysPermissionService permissionService) {
        this.adminMapper = adminMapper;
        this.departmentService = departmentService;
        this.roleMapper = roleMapper;
        this.permissionService = permissionService;
    }

    @Override
    public SysAdmin findUserDetailInfo(String username) {

        QueryWrapper<SysAdmin> adminQueryWrapper = new QueryWrapper<>();
        adminQueryWrapper.eq("username", username);
        adminQueryWrapper.eq("status", CommonStatus.STATUS_ENABLED.getStatus());

        SysAdmin admin = getOne(adminQueryWrapper);

        if (!ObjectUtils.isEmpty(admin)) {
            // 关联部门
            if (ObjectUtil.isNotNull(admin.getDepartmentId())) {
                SysDepartment department = departmentService.getById(admin.getDepartmentId());
                admin.setDepartmentTitle(department.getName());
            }

            // 关联角色
            SysRole roleList = roleMapper.selectById(admin.getId());
            if (!ObjectUtils.isEmpty(roleList)) {
                admin.setRole(roleList);
            }

            // 关联权限菜单
            List<SysPermission> permissionList = permissionService.getUserPermissionCodes(admin.getId());
            admin.setPermissions(permissionList);
            return admin;
        }
        return null;
    }

    @Override
    public IPage<SysAdmin> getAdminList(IPage<SysAdmin> page, ExtraVo extraVo, Map<String, Object> conditionMap) {
        return adminMapper.selectAdminList(page, extraVo, conditionMap);
    }
}
