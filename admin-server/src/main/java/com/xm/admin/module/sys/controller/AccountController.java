package com.xm.admin.module.sys.controller;

import cn.hutool.core.map.MapBuilder;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xm.admin.common.utils.SecurityUtil;
import com.xm.admin.config.auth.security.UserPrincipal;
import com.xm.admin.module.sys.entity.SysAdmin;
import com.xm.admin.module.sys.payload.AccountEditRequest;
import com.xm.admin.module.sys.payload.ModifyPasswordRequest;
import com.xm.admin.module.sys.service.ISysAdminService;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 认证 Controller，包括用户注册，用户登录请求
 * </p>
 */
@Slf4j
@RestController
@RequestMapping("/account")
public class AccountController {

    final ISysAdminService adminService;

    public AccountController(
            ISysAdminService adminService
    ) {
        this.adminService = adminService;
    }

    /**
     * 获取基本信息
     */
    @GetMapping("/info")
    public Result<Object> info() {
        UserPrincipal user = SecurityUtil.getCurrentUser();
        if (ObjectUtil.isNull(user)) {
            return new ResultUtil<>().error("请先登录");
        }

        SysAdmin admin = adminService.getById(user.getId());

        Map<String, Object> resultMap = new MapBuilder<String, Object>(new HashMap<>(8))
                .put("username", admin.getUsername())
                .put("mobile", admin.getMobile())
                .put("email", admin.getEmail())
                .put("nickname", admin.getNickname())
                .put("avatar", admin.getAvatar())
                .put("description", admin.getDescription())
                .build();

        return new ResultUtil<>().success(resultMap);
    }

    /**
     * 修改基本信息
     */
    @PostMapping("/edit")
    public Result<Object> edit(@Valid @ModelAttribute AccountEditRequest accountEditRequest) {
        UserPrincipal user = SecurityUtil.getCurrentUser();
        if (ObjectUtil.isNull(user)) {
            return new ResultUtil<>().error("请先登录");
        }

        QueryWrapper<SysAdmin> emailQueryWrapper = new QueryWrapper<>();
        emailQueryWrapper.lambda().eq(SysAdmin::getEmail, accountEditRequest.getEmail());
        emailQueryWrapper.lambda().ne(SysAdmin::getId, user.getId());
        if (ObjectUtil.isNotNull(adminService.getOne(emailQueryWrapper))) {
            return new ResultUtil<>().error("邮箱已被占用");
        }

        QueryWrapper<SysAdmin> mobileQueryWrapper = new QueryWrapper<>();
        mobileQueryWrapper.lambda().eq(SysAdmin::getMobile, accountEditRequest.getMobile());
        mobileQueryWrapper.lambda().ne(SysAdmin::getId, user.getId());
        if (ObjectUtil.isNotNull(adminService.getOne(mobileQueryWrapper))) {
            return new ResultUtil<>().error("手机号已被占用");
        }

        SysAdmin admin = adminService.getById(user.getId());
        admin.setEmail(accountEditRequest.getEmail());
        admin.setMobile(accountEditRequest.getMobile());
        admin.setNickname(accountEditRequest.getNickname());
        admin.setDescription(accountEditRequest.getDescription());
        if (StrUtil.isNotBlank(accountEditRequest.getAvatar())) {
            admin.setAvatar(accountEditRequest.getAvatar());
        }

        if (adminService.updateById(admin)) {
            return new ResultUtil<>().success();
        } else {
            return new ResultUtil<>().error();
        }
    }

    /**
     * 修改密码
     */
    @PostMapping("/changePassword")
    public Result<Object> changePassword(@Valid @ModelAttribute ModifyPasswordRequest modifyPasswordRequest) {

        UserPrincipal user = SecurityUtil.getCurrentUser();
        if (ObjectUtil.isNull(user)) {
            return new ResultUtil<>().error("请先登录");
        }

        SysAdmin old = adminService.getById(user.getId());

        if (!new BCryptPasswordEncoder().matches(modifyPasswordRequest.getOldPassword(), old.getPassword())) {
            return new ResultUtil<>().error("旧密码不正确");
        }

        String newEncryptPass = new BCryptPasswordEncoder().encode(modifyPasswordRequest.getPassword());
        old.setPassword(newEncryptPass);
        boolean sec = adminService.updateById(old);
        if (!sec) {
            return new ResultUtil<>().error("修改失败");
        }

        return new ResultUtil<>().success();
    }
}
