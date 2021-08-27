package com.xm.admin.module.sys.payload;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class DepartmentAddEditRequest implements Serializable {

    private static final long serialVersionUID = 5943426068162487167L;

    private Integer id;

    @NotEmpty(message = "请输入部门名称")
    private String deptName;

    private Integer parentDept;

    private BigDecimal orderNo;

    private Integer status;

    private String remark;
}
