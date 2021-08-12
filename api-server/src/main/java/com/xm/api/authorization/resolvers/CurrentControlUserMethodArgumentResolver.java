package com.xm.api.authorization.resolvers;

import com.xm.api.authorization.annotation.CurrentControlUser;
import com.xm.api.authorization.manager.TokenManager;
import com.xm.api.authorization.constant.TokenConstant;
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
 * 增加方法注入，将含有CurrentUser注解的方法参数注入当前登录用户
 * @see CurrentControlUser
 * @author xiaomalover <xiaomalover@gmail.com>
 */
@SuppressWarnings("NullableProblems")
@Component
public class CurrentControlUserMethodArgumentResolver implements HandlerMethodArgumentResolver {

    @SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
    @Autowired
    TokenManager tokenManager;

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        //如果参数类型是User并且有CurrentUser注解则支持
        return parameter.getParameterType().isAssignableFrom(String.class) &&
                parameter.hasParameterAnnotation(CurrentControlUser.class);
    }

    @Override
    public Object resolveArgument(
        MethodParameter parameter,
        ModelAndViewContainer mavContainer,
        NativeWebRequest webRequest,
        WebDataBinderFactory binderFactory
    ) throws HttpServerErrorException {
        String token = webRequest.getHeader(TokenConstant.CONTROL_TOKEN_PARAM_NAME);
        if (!ObjectUtils.isEmpty(token)) {
            //续期token
            tokenManager.refreshToken(token, TokenConstant.TOKEN_TYPE_CONTROL);
            String userId = tokenManager.getUserIdByToken(token, TokenConstant.TOKEN_TYPE_CONTROL);
            if (userId != null) {
                return userId;
            }
        }
        throw new HttpServerErrorException(HttpStatus.UNAUTHORIZED);
    }
}
