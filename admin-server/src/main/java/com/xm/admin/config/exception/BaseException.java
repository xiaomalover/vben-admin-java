package com.xm.admin.config.exception;

import com.xm.common.enums.ResultCodeEnums;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 异常基类
 * </p>
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class BaseException extends RuntimeException {
    private Integer code;
    private String message;
    private Object data;

    public BaseException(ResultCodeEnums resultCode) {
        super(resultCode.getMessage());
        this.code = resultCode.getCode();
        this.message = resultCode.getMessage();
    }

    public BaseException(ResultCodeEnums resultCode, Object data) {
        this(resultCode);
        this.data = data;
    }

    public BaseException(Integer code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }

    public BaseException(Integer code, String message, Object data) {
        this(code, message);
        this.data = data;
    }
}
