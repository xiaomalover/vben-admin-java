package com.xm.admin.module.sys.payload;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class MenuAddEditRequest implements Serializable {

    private static final long serialVersionUID = 5943426068162487167L;

    private Integer id;

    @NotNull(message = "类型不能为空")
    private Integer type;

    @NotEmpty(message = "请输入名称")
    private String menuName;

    private Integer parentMenu;

    private BigDecimal orderNo;

    private Integer status;

    private String icon;

    private Integer isExt;

    private String routePath;

    private Integer show;

    private String method;

    private String component;

    private Integer keepalive;

    private String permission;

    private String currentActiveMenu;
}
