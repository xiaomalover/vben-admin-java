package com.xm.admin.common.utils;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.xm.admin.config.exception.BaseException;
import com.xm.common.enums.ResultCodeEnums;
import com.xm.common.utils.ResultUtil;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * <p>
 * Response 通用工具类
 * </p>
 *
 */
@Slf4j
public class ResponseUtil {

    /**
     * 往 response 写出 json
     *
     * @param response 响应
     * @param resultCodeEnums   状态
     * @param data     返回数据
     */
    public static void renderJson(HttpServletResponse response, ResultCodeEnums resultCodeEnums, Object data) {
        try {
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "*");
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(200);

            //  将JSON转为String的时候，忽略null值的时候转成的String存在错误

            String result;
            if (resultCodeEnums == ResultCodeEnums.SUCCESS) {
                result = JSONUtil.toJsonStr(new JSONObject(new ResultUtil<>().success(data), false));
            } else {
                result = JSONUtil.toJsonStr(new JSONObject(new ResultUtil<>().error(resultCodeEnums), false));
            }

            response.getWriter().write(result);
        } catch (IOException e) {
            log.error("Response写出JSON异常，", e);
        }
    }

    /**
     * 往 response 写出 json
     *
     * @param response  响应
     * @param exception 异常
     */
    public static void renderJson(HttpServletResponse response, BaseException exception) {
        try {
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "*");
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(200);

            String result = JSONUtil.toJsonStr(new JSONObject(new ResultUtil<>().error(exception.getCode(), exception.getMessage(), exception.getData()), false));
            response.getWriter().write(result);
        } catch (IOException e) {
            log.error("Response写出JSON异常，", e);
        }
    }
}
