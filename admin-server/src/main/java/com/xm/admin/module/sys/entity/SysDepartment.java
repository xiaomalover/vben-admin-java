package com.xm.admin.module.sys.entity;

import java.math.BigDecimal;
import com.xm.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class SysDepartment extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /**
     * 上级部门
     */
    private Integer parentId;

    /**
     * 部门名称
     */
    private String name;

    /**
     * 描述
     */
    private String description;

    /**
     * 排序
     */
    private BigDecimal sortOrder;

    /**
     * 状态(0无效;1有效)
     */
    private Integer status;

}
