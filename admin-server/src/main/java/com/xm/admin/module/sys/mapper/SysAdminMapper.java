package com.xm.admin.module.sys.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.sys.entity.SysAdmin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xm.common.vo.ExtraVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * <p>
 * 管理员表 Mapper 接口
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Repository
public interface SysAdminMapper extends BaseMapper<SysAdmin> {

    /**
     * 获取管理页列表
     *
     * @param     page      分业相关
     * @param     extraVo   附加参数
     * @param     conditionMap  搜索条件
     * @return 管理页列表
     */
    IPage<SysAdmin> selectAdminList(IPage<SysAdmin> page, @Param("extraVo") ExtraVo extraVo, @Param("conditionMap") Map<String, Object> conditionMap);
}
