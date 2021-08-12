package com.xm.admin.module.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.sys.entity.SysAdmin;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xm.common.vo.ExtraVo;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 管理员表 服务类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
public interface ISysAdminService extends IService<SysAdmin> {

    /**
     * 获取用户详情
     * @param username 用户名
     * @return 用户详细信息
     */
    SysAdmin findUserDetailInfo(String username);

    /**
     * 获取管理页列表
     *
     * @param     page      分业相关
     * @param     extraVo   附加参数
     * @param     conditionMap  搜索条件
     * @return 管理页列表
     */
    IPage<SysAdmin> getAdminList(IPage<SysAdmin> page, ExtraVo extraVo, Map<String, Object>conditionMap);

}
