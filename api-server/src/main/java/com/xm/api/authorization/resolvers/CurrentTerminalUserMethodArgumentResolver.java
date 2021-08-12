package com.xm.api.authorization.resolvers;

import com.xm.api.authorization.annotation.CurrentTerminalUser;
import com.xm.api.authorization.constant.TokenConstant;
import com.xm.api.authorization.manager.TokenManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * 增加方法注入，将含有CurrentTerminalUser注解的方法参数注入当前登录用户
 * @see CurrentTerminalUser
 * @author xiaomalover <xiaomalover@gmail.com>
 */
@SuppressWarnings("NullableProblems")
@Component
public class CurrentTerminalUserMethodArgumentResolver implements HandlerMethodArgumentResolver {

    @SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
    @Autowired
    TokenManager tokenManager;

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        //如果参数类型是User并且有CurrentUser注解则支持
        return parameter.getParameterType().isAssignableFrom(String.class) &&
                parameter.hasParameterAnnotation(CurrentTerminalUser.class);
    }

    @Override
    public Object resolveArgument(
        MethodParameter parameter,
        ModelAndViewContainer mavContainer,
        NativeWebRequest webRequest,
        WebDataBinderFactory binderFactory
    ) throws HttpServerErrorException {
        String token = webRequest.getHeader(TokenConstant.TERMINAL_TOKEN_PARAM_NAME);
        if (!ObjectUtils.isEmpty(token)) {
            //续期token
            tokenManager.refreshToken(token, TokenConstant.TOKEN_TYPE_TERMINAL);
            String userId = tokenManager.getUserIdByToken(token, TokenConstant.TOKEN_TYPE_TERMINAL);
            if (userId != null) {
                return userId;
            }
        }
        throw new HttpServerErrorException(HttpStatus.UNAUTHORIZED);
    }
}
