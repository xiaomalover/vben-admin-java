package com.xm.admin.config.auth.security;

import cn.hutool.core.util.ObjectUtil;
import com.xm.admin.module.sys.entity.SysAdmin;
import com.xm.admin.module.sys.entity.SysPermission;
import com.xm.admin.module.sys.entity.SysRole;
import com.xm.admin.module.sys.mapper.SysAdminMapper;
import com.xm.admin.module.sys.service.ISysPermissionService;
import com.xm.admin.module.sys.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 自定义UserDetails查询
 * </p>
 *
 */
@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final SysAdminMapper adminMapper;

    private final ISysRoleService roleService;

    private final ISysPermissionService permissionService;

    @Autowired
    public CustomUserDetailsService(SysAdminMapper adminMapper, ISysRoleService roleService, ISysPermissionService permissionService) {
        this.adminMapper = adminMapper;
        this.roleService = roleService;
        this.permissionService = permissionService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysAdmin user = adminMapper.loadUserByUsername(username);
        if (ObjectUtil.isNull(user)) {
            throw new UsernameNotFoundException("未找到用户信息 : " + username);
        }

        List<SysPermission> permissions = new ArrayList<>();
        String roleName = "";
        SysRole role = roleService.getById(user.getRoleId());
        if (ObjectUtil.isNotNull(role)) {
            roleName = role.getName();
            permissions = permissionService.getUserPermissionCodes(user.getId());
        }

        List<String> permissionCodes = permissions.stream().map(SysPermission::getPermisionCode).collect(Collectors.toList());

        return UserPrincipal.create(user, roleName, permissions, permissionCodes);
    }
}
