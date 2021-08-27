package com.xm.admin.module.sys.payload;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.List;

@Data
public class RoleAddEditRequest implements Serializable {

    private static final long serialVersionUID = 5943426068162487167L;

    private Integer id;

    @NotEmpty(message = "请输入角色名")
    private String roleName;

    @NotEmpty(message = "请输入角色值")
    private String roleValue;

    private String remark;

    private Integer status;

    private List<Integer> menu;
}
