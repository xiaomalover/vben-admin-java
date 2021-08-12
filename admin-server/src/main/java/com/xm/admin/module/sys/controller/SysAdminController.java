package com.xm.admin.module.sys.controller;

import cn.hutool.core.map.MapBuilder;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
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
            @RequestParam(required = false) String nickname
    ) {
        IPage<SysAdmin> page = new CommonPageUtil<SysAdmin>().initIPage(extraVo);

        Map<String, Object> conditionMap = new HashMap<>(8);

        if (StrUtil.isNotBlank(account)) {
            conditionMap.put("account", account.trim());
        }

        if (StrUtil.isNotBlank(nickname)) {
            conditionMap.put("username", nickname.trim());
        }

        IPage<SysAdmin> userAssetsLogList = adminService.getAdminList(page, extraVo, conditionMap);

        return new ResultUtil<>().success(userAssetsLogList);
    }

    /*@GetMapping("/getAccountList")
    public Result<Object> getAccountList() {
        Object jsonObject = JSONObject.parse("{\n" +
                "  \"items\": [\n" +
                "    {\n" +
                "      \"id\": \"0\",\n" +
                "      \"account\": \"Melissa\",\n" +
                "      \"email\": \"v.xkuwjbi@qmts.sa\",\n" +
                "      \"nickname\": \"吕超\",\n" +
                "      \"role\": \"Donald\",\n" +
                "      \"createTime\": \"2004-06-13 08:21:31\",\n" +
                "      \"remark\": \"物才着二小而产是流方它\",\n" +
                "      \"status\": \"0\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"1\",\n" +
                "      \"account\": \"Brenda\",\n" +
                "      \"email\": \"f.uyur@jxrvom.tp\",\n" +
                "      \"nickname\": \"谢秀英\",\n" +
                "      \"role\": \"Donna\",\n" +
                "      \"createTime\": \"1997-12-28 18:30:41\",\n" +
                "      \"remark\": \"世再验联连办拉记无农变克影成\",\n" +
                "      \"status\": \"0\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"2\",\n" +
                "      \"account\": \"Charles\",\n" +
                "      \"email\": \"w.iuhvhef@aaiahcrju.va\",\n" +
                "      \"nickname\": \"汪秀英\",\n" +
                "      \"role\": \"Patricia\",\n" +
                "      \"createTime\": \"1992-12-23 16:24:05\",\n" +
                "      \"remark\": \"参公变联消下这系金京经三当议较产具律\",\n" +
                "      \"status\": \"0\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"3\",\n" +
                "      \"account\": \"Sharon\",\n" +
                "      \"email\": \"f.ufgi@uvkfuw.com.cn\",\n" +
                "      \"nickname\": \"崔艳\",\n" +
                "      \"role\": \"David\",\n" +
                "      \"createTime\": \"1970-10-09 15:04:59\",\n" +
                "      \"remark\": \"需山用织将真需器员结至易入都十务行等指\",\n" +
                "      \"status\": \"1\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"4\",\n" +
                "      \"account\": \"Brian\",\n" +
                "      \"email\": \"a.khkbfbnds@fdiwxqmjl.st\",\n" +
                "      \"nickname\": \"蔡强\",\n" +
                "      \"role\": \"Eric\",\n" +
                "      \"createTime\": \"2006-09-14 06:44:47\",\n" +
                "      \"remark\": \"派转干话干近委听可一难照将北\",\n" +
                "      \"status\": \"1\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"5\",\n" +
                "      \"account\": \"Sarah\",\n" +
                "      \"email\": \"d.thhcvftx@nxngh.ar\",\n" +
                "      \"nickname\": \"郝平\",\n" +
                "      \"role\": \"Joseph\",\n" +
                "      \"createTime\": \"2014-09-27 07:58:58\",\n" +
                "      \"remark\": \"音派那学比和法圆山间院地有门非段\",\n" +
                "      \"status\": \"0\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"6\",\n" +
                "      \"account\": \"Scott\",\n" +
                "      \"email\": \"h.hdrvuy@igpmz.tn\",\n" +
                "      \"nickname\": \"谭艳\",\n" +
                "      \"role\": \"David\",\n" +
                "      \"createTime\": \"1981-06-17 13:17:23\",\n" +
                "      \"remark\": \"成干小院间解运打干所圆\",\n" +
                "      \"status\": \"0\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"7\",\n" +
                "      \"account\": \"Susan\",\n" +
                "      \"email\": \"b.mvus@blnr.pn\",\n" +
                "      \"nickname\": \"朱勇\",\n" +
                "      \"role\": \"Susan\",\n" +
                "      \"createTime\": \"2001-04-19 14:39:34\",\n" +
                "      \"remark\": \"国对才单组十安样进由却周\",\n" +
                "      \"status\": \"1\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"8\",\n" +
                "      \"account\": \"Angela\",\n" +
                "      \"email\": \"j.wdt@mibp.sz\",\n" +
                "      \"nickname\": \"谭磊\",\n" +
                "      \"role\": \"Sharon\",\n" +
                "      \"createTime\": \"1994-01-04 13:31:27\",\n" +
                "      \"remark\": \"太出做想务委节置被真复力科你加气\",\n" +
                "      \"status\": \"1\"\n" +
                "    },\n" +
                "    {\n" +
                "      \"id\": \"9\",\n" +
                "      \"account\": \"Anna\",\n" +
                "      \"email\": \"j.robncuwehk@hjcbocii.es\",\n" +
                "      \"nickname\": \"李丽\",\n" +
                "      \"role\": \"Richard\",\n" +
                "      \"createTime\": \"1977-06-03 02:35:05\",\n" +
                "      \"remark\": \"活他日无话结与制能社半南院号劳\",\n" +
                "      \"status\": \"1\"\n" +
                "    }\n" +
                "  ],\n" +
                "  \"total\": 20\n" +
                "}");
        return new ResultUtil<>().success(jsonObject);
    }*/

    @PostMapping("/add")
    public Result<Object> add(@Valid @ModelAttribute AdminAddRequest adminAddRequest) {
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
        sysAdmin.setPassword(new BCryptPasswordEncoder().encode(adminAddRequest.getPassword()));
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
    public Result<Object> edit(@Valid @ModelAttribute AdminEditRequest adminEditRequest) {
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
        if (StrUtil.isNotBlank(adminEditRequest.getPassword())) {
            sysAdmin.setPassword(new BCryptPasswordEncoder().encode(adminEditRequest.getPassword()));
        }
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
