package com.xm.admin.module.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.sys.entity.SysAdmin;
import com.xm.admin.module.sys.mapper.SysAdminMapper;
import com.xm.admin.module.sys.service.ISysAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xm.common.enums.CommonStatus;
import com.xm.common.vo.ExtraVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@Service
public class SysAdminServiceImpl extends ServiceImpl<SysAdminMapper, SysAdmin> implements ISysAdminService {

    private final SysAdminMapper adminMapper;

    public SysAdminServiceImpl(SysAdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public SysAdmin findUserDetailInfo(String username) {

        QueryWrapper<SysAdmin> adminQueryWrapper = new QueryWrapper<>();
        adminQueryWrapper.eq("username", username);
        adminQueryWrapper.eq("status", CommonStatus.STATUS_ENABLED.getStatus());
        return getOne(adminQueryWrapper);
    }

    @Override
    public IPage<SysAdmin> getAdminList(IPage<SysAdmin> page, ExtraVo extraVo, Map<String, Object> conditionMap) {
        return adminMapper.selectAdminList(page, extraVo, conditionMap);
    }
}
