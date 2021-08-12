package com.xm.api.enums;

/**
 * 短信验证码枚举
 */
public enum VerifyCodeEnum {

    TYPE_REGISTER(1, "注册验证码", ""),
    TYPE_CHANGE_PASSWORD(2, "修改密码", "")
    ;

    /**
     * 类型
     */
    private int type;

    /**
     * 类型描述
     */
    private String description;

    /**
     * 短信模板
     */
    private String template;

    VerifyCodeEnum(int type, String description, String template) {
        this.type = type;
        this.description = description;
        this.template = template;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }
}
