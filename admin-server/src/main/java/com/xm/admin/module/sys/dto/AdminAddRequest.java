package com.xm.admin.module.sys.dto;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Data
public class AdminAddRequest implements Serializable {

    private static final long serialVersionUID = 8648914193037396878L;

    @NotEmpty(message = "请输入用户名")
    private String account;

    @NotEmpty(message = "请输入昵称")
    private String nickname;

    @NotEmpty(message = "请输入密码")
    @Pattern(regexp="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$", message="密码必须6-18位字母和数字组合")
    private String pwd;

    @NotEmpty(message = "请输入邮箱")
    @Pattern(regexp="^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+$", message="邮箱格式不正确")
    private String email;

    @NotNull(message = "请选择部门")
    private Integer dept;

    @NotNull(message = "请选择角色")
    private Integer role;

    private Integer status;

    private String remark;
}
