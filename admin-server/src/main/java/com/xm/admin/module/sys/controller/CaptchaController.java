package com.xm.admin.module.sys.controller;

import cn.hutool.core.util.StrUtil;
import com.xm.common.utils.CaptchaUtil;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Captcha;
import com.xm.common.vo.Result;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author xiaomalover <xiaomalover@gmail.com>
 */
@RequestMapping("/captcha")
@RestController
public class CaptchaController {

    private final StringRedisTemplate redisTemplate;

    public CaptchaController(StringRedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @GetMapping("/getCaptcha")
    public Result<Object> getCaptcha() {

        //生成验证码，并缓存
        String captchaId = UUID.randomUUID().toString().replace("-", "");
        String code = new CaptchaUtil().randomStr(4);
        redisTemplate.opsForValue().set(captchaId, code, 3L, TimeUnit.MINUTES);

        //验证码生成图片
        CaptchaUtil vCode = new CaptchaUtil(108, 40, 4, 10, code);
        String codeBae64 = vCode.getBase64Captcha();

        if (StrUtil.isBlank(codeBae64)) {
            return new ResultUtil<>().error("获取验证码失败");
        }

        Captcha captcha = new Captcha();
        captcha.setCaptchaId(captchaId);
        captcha.setImgBase64(codeBae64);

        return new ResultUtil<>().success(captcha);
    }
}
