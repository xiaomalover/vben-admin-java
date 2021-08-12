package com.xm.admin.module.sys.entity;

import com.xm.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 角色权限关联表
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class SysRolePermission extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /**
     * 权限ID
     */
    private Integer permissionId;

    /**
     * 角色ID
     */
    private Integer roleId;

}
