package com.xm.admin.module.sys.service;

import com.xm.admin.module.sys.entity.SysAdmin;
import com.baomidou.mybatisplus.extension.service.IService;

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

}
