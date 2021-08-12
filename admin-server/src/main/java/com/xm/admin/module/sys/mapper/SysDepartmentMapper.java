package com.xm.admin.module.sys.mapper;

import com.xm.admin.module.sys.entity.SysDepartment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Repository
public interface SysDepartmentMapper extends BaseMapper<SysDepartment> {

    /**
     * 获取所有的部分信息
     * @param deptName 部门名
     * @param status 状态
     * @return 部门信息
     */
    List<Map<String, Object>> selectAllDepartmentListMap(@Param("deptName") String deptName, @Param("status") Integer status);
}
