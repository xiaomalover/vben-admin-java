package com.xm.api.authorization.constant;

/**
 * Token相关常量
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 */
public class TokenConstant {

    /**
     * 控制端TOKEN
     */
    public final static int TOKEN_TYPE_CONTROL = 1;

    /**
     * 设备端TOKEN
     */
    public final static int TOKEN_TYPE_TERMINAL = 2;

    /**
     * 控制端TOKEN过期时间常量
     */
    public final static int CONTROL_TOKEN_EXPIRED = 15 * 3600;

    /**
     * 设备端TOKEN过过期时间常量
     */
    public final static int TERMINAL_TOKEN_EXPIRED = 15 * 3600;

    /**
     * 控制端用户Token前缀常量
     */
    public final static String CONTROL_TOKEN_KEY_PREFIX = "control_token_";

    /**
     * 设备端用户Token前缀常量
     */
    public final static String TERMINAL_TOKEN_KEY_PREFIX = "terminal_token_";

    /**
     * 控制端用户id与token映射缓存常量
     */
    public final static String CONTROL_TOKEN_HASH_KEY_PREFIX = "control_token_hash_";

    /**
     * 设备端用户id与token映射缓存常量
     */
    public final static String TERMINAL_TOKEN_HASH_KEY_PREFIX = "terminal_token_hash_";

    /**
     * 校验参数名常量
     */
    public final static String CONTROL_TOKEN_PARAM_NAME = "control_token";

    /**
     * 校验参数名常量
     */
    public final static String TERMINAL_TOKEN_PARAM_NAME = "terminal_token";
}
