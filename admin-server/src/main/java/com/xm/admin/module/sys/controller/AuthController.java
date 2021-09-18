package com.xm.admin.module.sys.controller;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.xm.admin.common.utils.JwtUtil;
import com.xm.admin.config.auth.security.MySecurityException;
import com.xm.admin.module.sys.payload.LoginRequest;
import com.xm.common.enums.ResultCodeEnums;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * <p>
 * 认证 Controller，包括用户注册，用户登录请求
 * </p>
 */
@Slf4j
@RestController
@RequestMapping("/auth")
public class AuthController {

    private final StringRedisTemplate redisTemplate;

    private final AuthenticationManager authenticationManager;

    private final JwtUtil jwtUtil;

    public AuthController(AuthenticationManager authenticationManager, JwtUtil jwtUtil, StringRedisTemplate redisTemplate) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
        this.redisTemplate = redisTemplate;
    }

    /**
     * 登录
     */
    @PostMapping("/login")
    public Result<Object> login(@Valid @ModelAttribute LoginRequest loginRequest) {

        if (!checkCaptcha(loginRequest.getCaptchaId(), loginRequest.getCaptcha())) {
            return new ResultUtil<>().error("验证码错误");
        }

        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String jwt = jwtUtil.createJWT(authentication, loginRequest.getRememberMe());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("token", "Bearer " + jwt);
        return new ResultUtil<>().success(jsonObject);
    }

    @PostMapping("/logout")
    public Result<Object> logout(HttpServletRequest request) {
        try {
            // 设置JWT过期
            jwtUtil.invalidateJWT(request);
        } catch (MySecurityException e) {
            throw new MySecurityException(ResultCodeEnums.UNAUTHORIZED);
        }
        return new ResultUtil<>().success(ResultCodeEnums.LOGOUT);
    }


    private boolean checkCaptcha(String captchaId, String captcha) {

        if (StrUtil.isEmpty(captchaId) || StrUtil.isEmpty(captcha)) {
            return false;
        }

        //从缓存中获取验证码
        String right = redisTemplate.opsForValue().get(captchaId);
        if (StrUtil.isEmpty(right)) {
            return false;
        }
        return captcha.toLowerCase().equals(right.toLowerCase());
    }
}
