package com.xm.admin.module.sys.payload;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Data
public class AccountEditRequest implements Serializable {

    private static final long serialVersionUID = 8648914193037396878L;

    @NotEmpty(message = "请输入手机号")
    @Pattern(regexp="^1[3456789]\\d{9}$",message="手机号格式不正确")
    private String mobile;

    @NotEmpty(message = "请输入邮箱")
    @Pattern(regexp="^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+$", message="邮箱格式不正确")
    private String email;

    @NotEmpty(message = "请输入昵称")
    private String nickname;

    private String description;

    private String avatar;
}
