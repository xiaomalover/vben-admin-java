package com.xm.admin.config.exception;

import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author xiaomalover <xiaomalover@gmail.com>
 */
@SuppressWarnings("ALL")
@Slf4j
@RestControllerAdvice
public class RestCtrlExceptionHandler {

    @ExceptionHandler(SkeletonException.class)
    @ResponseStatus(value = HttpStatus.OK)
    public Result<Object> handleXCloudException(SkeletonException e) {

        String errorMsg = "Skeleton exception";
        if (e != null) {
            errorMsg = e.getMsg();
            log.error(e.toString());
        }
        return new ResultUtil<>().error(500, errorMsg);
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.OK)
    public Result<Object> handleException(Exception e) {

        String errorMsg = "Exception";
        if (e != null) {
            errorMsg = e.getMessage();
            log.error(e.toString());
        }
        return new ResultUtil<>().error(500, errorMsg);
    }

    /**
     * 参数异常处理
     *
     * @param e 参数校验异常
     * @return 结果
     */
    @ExceptionHandler(BindException.class)
    @ResponseStatus(HttpStatus.OK)
    public Result error(BindException e) {
        // 拿到异常信息
        List<ObjectError> allErrors = e.getAllErrors().stream()
                .sorted((x1, x2) -> x1.getDefaultMessage().compareTo(x2.getDefaultMessage()))
                .collect(Collectors.toList());
        // 拼接, 返回前端
        String errMessage = getErrMessage(allErrors);
        return new ResultUtil<>().error(errMessage);
    }

    /**
     * 获取异常信息, 拼成String
     *
     * @param errors 错误消息集合
     * @return  错误消息字符串
     */
    private String getErrMessage(List<ObjectError> errors) {
        StringBuilder errorMsg = new StringBuilder();
        errors.forEach((err) -> {
            if (errorMsg.length() > 0) {
                errorMsg.append(";");
            }
            errorMsg.append(err.getDefaultMessage());
        });
        return errorMsg.toString();
    }
}
