package com.xm.admin.module.sys.entity;

import java.math.BigDecimal;
import com.xm.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 菜单权限表
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class SysPermission extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /** 类型 - 目录 */
    public static final Integer TYPE_DIR = 0;

    /** 类型 - 菜单 */
    public static final Integer TYPE_MENU = 1;

    /** 类型 - 按钮 */
    public static final Integer TYPE_BTN = 2;

    /**
     * 类型：0目录;1菜单;按钮
     */
    private Integer type;

    /**
     * 名称
     */
    private String name;
    
    /**
     * 父类ID
     */
    private Integer parentId;

    /**
     * 关系路径
     */
    private String path;

    /**
     * 请求方式
     */
    private String method;

    /**
     * 排序
     */
    private BigDecimal sortOrder;

    /**
     * 图标
     */
    private String icon;

    /**
     * 路由地址
     */
    private String url;

    /**
     * 组件路径
     */
    private String component;

    /**
     * 权限标识
     */
    private String permisionCode;

    /**
     * 状态(0无效;1有效)
     */
    private Integer status;

    /**
     * 是否显示
     */
    private Integer isDisplay;

    /**
     * 是否外链
     */
    private Integer isExternalLink;

    /**
     * 是否缓存
     */
    private Integer isCache;

}
