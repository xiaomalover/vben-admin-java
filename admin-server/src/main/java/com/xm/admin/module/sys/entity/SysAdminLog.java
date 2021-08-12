package com.xm.admin.module.sys.entity;

import com.xm.admin.common.utils.ObjectUtil;
import com.xm.common.entity.BaseLogEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Map;

/**
 * <p>
 * 请求日志
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class SysAdminLog extends BaseLogEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 请求处理时长
     */
    private Integer costTime;

    /**
     * 请求ip地址
     */
    private String ip;

    /**
     * 请求ip信息
     */
    private String ipInfo;

    /**
     * 日志名称
     */
    private String name;

    /**
     * 请求参数
     */
    private String requestParam;

    /**
     * 请求类型
     */
    private String requestType;

    /**
     * 请求地址
     */
    private String requestUrl;

    /**
     * 操作人
     */
    private String username;

    /**
     * 转换请求参数为Json
     *
     * @param paramMap 参数
     */
    public void setMapToParams(Map<String, String[]> paramMap) {
        this.requestParam = ObjectUtil.mapToString(paramMap);
    }
}
