package com.xm.admin.module.sys.payload;

import lombok.Data;
import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 解锁请求参数
 * </p>
 *
 */
@Data
public class UnlockRequest {

    /**
     * 用户名或邮箱或手机号
     */
    @NotBlank(message = "用户名不能为空")
    private String username;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    private String password;
}
