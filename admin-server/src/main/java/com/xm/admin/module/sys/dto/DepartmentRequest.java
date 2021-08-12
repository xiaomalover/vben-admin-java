package com.xm.admin.module.sys.dto;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class DepartmentRequest implements Serializable {

    private static final long serialVersionUID = 5943426068162487167L;

    private Integer id;

    @NotEmpty(message = "请输入部门名称")
    private String deptName;

    private Integer parentId;

    private BigDecimal SortOrder;

    private Integer status;

    private String description;
}
