package com.xm.admin.module.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xm.admin.module.sys.entity.SysDepartment;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
public interface ISysDepartmentService extends IService<SysDepartment> {

    /**
     * 获取部门树
     *
     * @param deptName 部门名
     * @param status   状态
     * @return 部分树
     */
    List<Map<String, Object>> getDepartmentTree(String deptName, Integer status);
}
