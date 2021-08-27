package com.xm.admin.common.constant;

/**
 * @author xiaomalover <xiaomalover@gmail.com>
 */
public interface SecurityConstant {

    /**
     * JWT 在 Redis 中保存的key前缀
     */
    String REDIS_JWT_KEY_PREFIX = "security:jwt:";

    /**
     * 匿名用户 用户名
     */
    String ANONYMOUS_NAME = "匿名用户";
}
