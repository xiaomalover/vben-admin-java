package com.xm.admin.module.sys.payload;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * @author fil <fil@gmail.com>
 */
@Data
public class ModifyPasswordRequest implements Serializable {

    private static final long serialVersionUID = -7506638385507428250L;

    @NotEmpty(message = "请输入原密码")
    private String oldPassword;

    @NotEmpty(message = "请输入新密码")
    @Pattern(regexp="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$", message="密码必须6-18位字母和数字组合")
    private String password;
}
