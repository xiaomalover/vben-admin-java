package com.xm.admin.config.auth;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.json.JSONUtil;
import com.xm.admin.config.exception.BaseException;
import com.xm.common.enums.ResultCodeEnums;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.validation.ConstraintViolationException;

/**
 * <p>
 * 全局统一异常处理
 * </p>
 *
 */
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Result<Object> handlerException(Exception e) {
        if (e instanceof NoHandlerFoundException) {
            log.error("【全局异常拦截】NoHandlerFoundException: 请求方法 {}, 请求路径 {}", ((NoHandlerFoundException) e).getRequestURL(), ((NoHandlerFoundException) e).getHttpMethod());
            return new ResultUtil<>().error(ResultCodeEnums.REQUEST_NOT_FOUND);
        } else if (e instanceof HttpRequestMethodNotSupportedException) {
            log.error("【全局异常拦截】HttpRequestMethodNotSupportedException: 当前请求方式 {}, 支持请求方式 {}", ((HttpRequestMethodNotSupportedException) e).getMethod(), JSONUtil.toJsonStr(((HttpRequestMethodNotSupportedException) e).getSupportedHttpMethods()));
            return new ResultUtil<>().error(ResultCodeEnums.HTTP_BAD_METHOD);
        } else if (e instanceof MethodArgumentNotValidException) {
            log.error("【全局异常拦截】MethodArgumentNotValidException", e);
            return new ResultUtil<>().error(ResultCodeEnums.BAD_REQUEST.getCode(), ((MethodArgumentNotValidException) e).getBindingResult().getAllErrors().get(0).getDefaultMessage());
        } else if (e instanceof ConstraintViolationException) {
            log.error("【全局异常拦截】ConstraintViolationException", e);
            return new ResultUtil<>().error(ResultCodeEnums.BAD_REQUEST.getCode(), CollUtil.getFirst(((ConstraintViolationException) e).getConstraintViolations()).getMessage());
        } else if (e instanceof MethodArgumentTypeMismatchException) {
            log.error("【全局异常拦截】MethodArgumentTypeMismatchException: 参数名 {}, 异常信息 {}", ((MethodArgumentTypeMismatchException) e).getName(), ((MethodArgumentTypeMismatchException) e).getMessage());
            return new ResultUtil<>().error(ResultCodeEnums.PARAM_NOT_MATCH);
        } else if (e instanceof HttpMessageNotReadableException) {
            log.error("【全局异常拦截】HttpMessageNotReadableException: 错误信息 {}", ((HttpMessageNotReadableException) e).getMessage());
            return new ResultUtil<>().error(ResultCodeEnums.PARAM_NOT_NULL);
        } else if (e instanceof BadCredentialsException) {
            log.error("【全局异常拦截】BadCredentialsException: 错误信息 {}", e.getMessage());
            return new ResultUtil<>().error(ResultCodeEnums.USERNAME_PASSWORD_ERROR);
        } else if (e instanceof DisabledException) {
            log.error("【全局异常拦截】BadCredentialsException: 错误信息 {}", e.getMessage());
            return new ResultUtil<>().error(ResultCodeEnums.USER_DISABLED);
        } else if (e instanceof BaseException) {
            log.error("【全局异常拦截】DataManagerException: 状态码 {}, 异常信息 {}", ((BaseException) e).getCode(), e.getMessage());
            return new ResultUtil<>().error(ResultCodeEnums.ERR.getCode(), e.getMessage());
        }

        log.error("【全局异常拦截】: 异常信息 {} ", e.getMessage());
        return new ResultUtil<>().error(ResultCodeEnums.ERR);
    }
}
