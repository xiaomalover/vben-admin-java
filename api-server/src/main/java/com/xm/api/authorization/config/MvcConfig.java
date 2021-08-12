package com.xm.api.authorization.config;

import com.xm.api.authorization.resolvers.CurrentControlUserMethodArgumentResolver;
import com.xm.api.authorization.resolvers.CurrentTerminalUserMethodArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import java.util.List;

/**
 * 配置类，增加自定义拦截器和解析器
 * @see CurrentControlUserMethodArgumentResolver
 * @author xiaomalover <xiaomalover@gmail.com>
 */
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Configuration
public class MvcConfig extends WebMvcConfigurationSupport {

    @Autowired
    private CurrentControlUserMethodArgumentResolver currentControlUserMethodArgumentResolver;

    @Autowired
    private CurrentTerminalUserMethodArgumentResolver currentTerminalUserMethodArgumentResolver;

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(currentControlUserMethodArgumentResolver);
        argumentResolvers.add(currentTerminalUserMethodArgumentResolver);
    }
}
