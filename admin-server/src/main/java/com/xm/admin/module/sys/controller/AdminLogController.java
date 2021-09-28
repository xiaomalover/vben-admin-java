package com.xm.admin.module.sys.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.xm.admin.module.sys.entity.SysAdminLog;
import com.xm.admin.module.sys.service.ISysAdminLogService;
import com.xm.common.utils.CommonPageUtil;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.ExtraVo;
import com.xm.common.vo.Result;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2019-03-06
 */
@RestController
@RequestMapping("/log")
public class AdminLogController {

    private final ISysAdminLogService adminLogService;

    public AdminLogController(ISysAdminLogService adminLogService) {
        this.adminLogService = adminLogService;
    }

    @GetMapping("/page")
    public Result<Object> search(@RequestParam(required = false) String key, @ModelAttribute ExtraVo extraVo) {

        IPage<SysAdminLog> page = new CommonPageUtil<SysAdminLog>().initIPage(extraVo);

        QueryWrapper<SysAdminLog> adminLogQueryWrapper = new QueryWrapper<>();
        if (!ObjectUtils.isEmpty(key)) {
            adminLogQueryWrapper.and(
                wrapper -> wrapper.lambda().like(SysAdminLog::getRequestParam, key.trim())
                .or()
                .like(SysAdminLog::getName, key.trim())
            );
        }
        if (ObjectUtils.isNotNull(extraVo.getStartDate()) && extraVo.getStartDate() > 0) {
            adminLogQueryWrapper.lambda().gt(SysAdminLog::getCreatedAt, extraVo.getStartDate());
        }
        if (ObjectUtils.isNotNull(extraVo.getEndDate()) && extraVo.getEndDate() > 0) {
            adminLogQueryWrapper.lambda().lt(SysAdminLog::getCreatedAt, extraVo.getEndDate());
        }

        boolean isAsc = "asc".equals(extraVo.getOrder());
        if (!StrUtil.isEmpty(extraVo.getSort())) {
            adminLogQueryWrapper.orderBy(true, isAsc, StringUtils.camelToUnderline(extraVo.getSort()));
        } else {
            adminLogQueryWrapper.lambda().orderByDesc(SysAdminLog::getCreatedAt);
        }

        IPage<SysAdminLog> log = adminLogService.page(page, adminLogQueryWrapper);

        return new ResultUtil<>().success(log);
    }

    @DeleteMapping("/delByIds/{ids}")
    public Result<Object> delByIds(@PathVariable String[] ids) {

        for (String id : ids) {
            adminLogService.removeById(id);
        }
        return new ResultUtil<>().success(true);
    }

    @DeleteMapping("/delAll")
    public Result<Object> delAll() {
        QueryWrapper<SysAdminLog> queryWrapper = new QueryWrapper<>();
        queryWrapper.gt("id", 0);
        adminLogService.remove(queryWrapper);
        return new ResultUtil<>().success(true);
    }
}
