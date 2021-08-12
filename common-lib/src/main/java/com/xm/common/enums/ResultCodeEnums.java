package com.xm.common.enums;

/**
 * 通用状态枚举
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 */
public enum ResultCodeEnums {
    /**
     * 成功状态 - 成功
     */
    SUCCESS(0, "success"),

    /**
     * 错误状态 - 错误
     */
    ERR(1, "error"),

    /**
     * 错误状态 - 错误
     */
    SAVE_DATA_ERROR(8888, "数据保存出错！");

    /**
     * 返回码
     */
    private int code;

    /**
     * 返回描述
     */
    private String msg;

    ResultCodeEnums(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
