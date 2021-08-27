package com.xm.admin.config.auth;

import com.xm.admin.config.exception.BaseException;
import com.xm.common.enums.ResultCodeEnums;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 全局异常
 * </p>
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class MySecurityException extends BaseException {
    public MySecurityException(ResultCodeEnums resultCode) {
        super(resultCode);
    }

    public MySecurityException(ResultCodeEnums resultCode, Object data) {
        super(resultCode, data);
    }

    public MySecurityException(Integer code, String message) {
        super(code, message);
    }

    public MySecurityException(Integer code, String message, Object data) {
        super(code, message, data);
    }
}
