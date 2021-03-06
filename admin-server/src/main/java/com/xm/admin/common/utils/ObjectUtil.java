package com.xm.admin.common.utils;

import cn.hutool.core.util.StrUtil;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.Map;

/**
 * 对象工具类
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 */
public class ObjectUtil {

    public static String mapToString(Map<String, String[]> paramMap) {

        if (paramMap == null) {
            return "";
        }
        Map<String, Object> params = new HashMap<>(16);
        for (Map.Entry<String, String[]> param : paramMap.entrySet()) {

            String key = param.getKey();
            String paramValue = (param.getValue() != null && param.getValue().length > 0 ? param.getValue()[0] : "");
            String obj;
            if (StrUtil.endWithIgnoreCase(param.getKey(), "password") || StrUtil.endWithIgnoreCase(param.getKey(), "pwd")) {
                obj = "******";
            } else {
                obj = paramValue;
            }
            params.put(key, obj);
        }
        return new Gson().toJson(params);
    }
}
