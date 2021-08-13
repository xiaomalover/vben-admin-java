package com.xm.admin.module.sys.controller;

import cn.hutool.core.map.MapBuilder;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.sys.dto.AdminAddRequest;
import com.xm.admin.module.sys.dto.AdminEditRequest;
import com.xm.admin.module.sys.entity.SysAdmin;
import com.xm.admin.module.sys.service.ISysAdminService;
import com.xm.common.utils.CommonPageUtil;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.ExtraVo;
import com.xm.common.vo.Result;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 管理员表 前端控制器
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@RestController
@RequestMapping("/skeleton/admin")
public class SysAdminController {

    final
    ISysAdminService adminService;

    public SysAdminController(ISysAdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping("/userInfo")
    public Result<Object> userInfo() {

        UserDetails user = (org.springframework.security.core.userdetails.UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        SysAdmin u = adminService.findUserDetailInfo(user.getUsername());
        // 清除持久上下文环境 避免后面语句导致持久化
        u.setPassword(null);

        Map<String, Object> resultMap = new MapBuilder<String, Object>(new HashMap<>(8)).
                put("roles", new ArrayList<String>())
                .put("userId", u.getId())
                .put("username", u.getUsername())
                .put("realName", u.getNickname())
                .put("avatar", u.getAvatar())
                .put("desc", u.getDescription())
                .build();

        return new ResultUtil<>().success(resultMap);
    }

    @GetMapping("/logout")
    public Result<Object> logout() {
        return new ResultUtil<>().success();
    }

    @GetMapping("/getAccountList")
    public Result<Object> getAdminList(
            @ModelAttribute ExtraVo extraVo,
            @RequestParam(required = false) String account,
            @RequestParam(required = false) String nickname,
            @RequestParam(required = false) Integer deptId
    ) {
        IPage<SysAdmin> page = new CommonPageUtil<SysAdmin>().initIPage(extraVo);

        Map<String, Object> conditionMap = new HashMap<>(8);

        if (StrUtil.isNotBlank(account)) {
            conditionMap.put("account", account.trim());
        }

        if (ObjectUtil.isNotNull(deptId)) {
            conditionMap.put("deptId", deptId);
        }

        if (StrUtil.isNotBlank(nickname)) {
            conditionMap.put("nickname", nickname.trim());
        }

        IPage<SysAdmin> adminList = adminService.getAdminList(page, extraVo, conditionMap);

        return new ResultUtil<>().success(adminList);
    }

    @PostMapping("/add")
    public Result<Object> add(@Valid AdminAddRequest adminAddRequest) {
        //查询用户是否已存在
        QueryWrapper<SysAdmin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(SysAdmin::getUsername, adminAddRequest.getAccount());
        int exist = adminService.count(queryWrapper);
        if (exist > 0) {
            return new ResultUtil<>().error("用户已存在");
        }

        SysAdmin sysAdmin = new SysAdmin();
        sysAdmin.setUsername(adminAddRequest.getAccount());
        sysAdmin.setNickname(adminAddRequest.getNickname());
        sysAdmin.setEmail(adminAddRequest.getEmail());
        sysAdmin.setPassword(new BCryptPasswordEncoder().encode(adminAddRequest.getPwd()));
        sysAdmin.setDescription(adminAddRequest.getRemark());
        sysAdmin.setRoleId(adminAddRequest.getRole());
        sysAdmin.setDepartmentId(adminAddRequest.getDept());
        sysAdmin.setStatus(adminAddRequest.getStatus());
        if (adminService.save(sysAdmin)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @PostMapping("/edit")
    public Result<Object> edit(@Valid AdminEditRequest adminEditRequest) {
        SysAdmin sysAdmin = adminService.getById(adminEditRequest.getId());

        //查询用户是否已存在
        QueryWrapper<SysAdmin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(SysAdmin::getUsername, adminEditRequest.getAccount());
        SysAdmin exist = adminService.getOne(queryWrapper);
        if (ObjectUtil.isNotNull(exist) && !exist.getId().equals(adminEditRequest.getId())) {
            return new ResultUtil<>().error("用户已存在");
        }

        sysAdmin.setUsername(adminEditRequest.getAccount());
        sysAdmin.setNickname(adminEditRequest.getNickname());
        if (StrUtil.isNotBlank(adminEditRequest.getPwd())) {
            sysAdmin.setPassword(new BCryptPasswordEncoder().encode(adminEditRequest.getPwd()));
        }
        sysAdmin.setEmail(adminEditRequest.getEmail());
        sysAdmin.setDescription(adminEditRequest.getRemark());
        sysAdmin.setRoleId(adminEditRequest.getRole());
        sysAdmin.setDepartmentId(adminEditRequest.getDept());
        sysAdmin.setStatus(adminEditRequest.getStatus());

        if (adminService.updateById(sysAdmin)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @DeleteMapping("/delete/{id}")
    public Result<Object> edit(@PathVariable String id) {
        if (adminService.removeById(id)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }
}
