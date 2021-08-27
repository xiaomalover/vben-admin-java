package com.xm.admin.config.auth;

import com.xm.admin.common.utils.ResponseUtil;
import com.xm.common.enums.ResultCodeEnums;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.access.AccessDeniedHandler;

/**
 * <p>
 * Security 结果处理配置
 * </p>
 *
 */
@Configuration
public class SecurityHandlerConfig {

    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
        return (request, response, accessDeniedException) -> ResponseUtil.renderJson(response, ResultCodeEnums.ACCESS_DENIED, null);
    }
}
