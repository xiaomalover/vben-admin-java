package com.xm.admin.config.auth.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * <p>
 * 自定义配置
 * </p>
 *
 */
@Configuration
@ConfigurationProperties(prefix = "auth.config")
@Data
public class AuthConfig {
    /**
     * 不需要拦截的地址
     */
    private IgnoreConfig ignores;
}
