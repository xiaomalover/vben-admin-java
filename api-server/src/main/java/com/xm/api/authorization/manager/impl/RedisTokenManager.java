package com.xm.api.authorization.manager.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.SecureUtil;
import com.alibaba.fastjson.JSONObject;
import com.xm.api.authorization.constant.TokenConstant;
import com.xm.api.authorization.manager.TokenManager;
import com.xm.api.authorization.vo.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 通过Redis存储和验证token的实现类
 * @see TokenManager
 * @author xiaomalover <xiaomalover@gmail.com>
 */
@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Component
public class RedisTokenManager implements TokenManager {

    @Autowired
    RedisTemplate<String, String> redisTemplate;

    /**
     * 创建TOKEN
     * @param userId 指定用户的id
     * @param tokenType TOKEN的类型，是设备端还是控制端
     * @return TokenModel
     */
    @Override
    public Token createToken(String userId, int tokenType) {

        int tokenExpired = tokenType == TokenConstant.TOKEN_TYPE_CONTROL ? TokenConstant.CONTROL_TOKEN_EXPIRED :
                TokenConstant.TERMINAL_TOKEN_EXPIRED;

        //存TOKEN
        String token = SecureUtil.md5(UUID.randomUUID().toString());
        Token tokenModel = new Token(userId, token, tokenExpired);
        String tokenKey = this.getTokenKey(token, tokenType);
        redisTemplate.opsForValue().set(tokenKey, JSONObject.toJSONString(tokenModel));
        redisTemplate.expire(tokenKey,  TokenConstant.CONTROL_TOKEN_EXPIRED, TimeUnit.SECONDS);

        //存TOKEN记录
        this.handHash(userId, token, tokenType);

        return tokenModel;
    }

    /**
     * 刷新TOKEN
     * @param token token
     * @param tokenType TOKEN的类型，是设备端还是控制端
     */
    @Override
    public void refreshToken(String token, int tokenType) {
        String tokenKey = this.getTokenKey(token, tokenType);

        int tokenExpired = tokenType == TokenConstant.TOKEN_TYPE_CONTROL ? TokenConstant.CONTROL_TOKEN_EXPIRED :
                TokenConstant.TERMINAL_TOKEN_EXPIRED;

        String redisToken = redisTemplate.opsForValue().get(tokenKey);
        if (!ObjectUtils.isEmpty(redisToken)) {
            Token tokenModel = JSONObject.parseObject(redisToken, Token.class);
            tokenModel.setTtl(tokenExpired);
            redisTemplate.opsForValue().set(tokenKey, JSONObject.toJSONString(tokenModel));
            redisTemplate.expire(tokenKey,  tokenExpired, TimeUnit.SECONDS);
        }
    }

    /**
     * 通过token拿userId
     * @param token token
     * @param tokenType TOKEN的类型，是设备端还是控制端
     * @return 用户id
     */
    @Override
    public String getUserIdByToken(String token, int tokenType) {
        String tokenKey = this.getTokenKey(token, tokenType);
        String redisToken = redisTemplate.opsForValue().get(tokenKey);
        if (!ObjectUtils.isEmpty(redisToken)) {
            Token tokenModel = JSONObject.parseObject(redisToken, Token.class);
            return tokenModel.getUserId();
        }
        return null;
    }

    /**
     * 获取Token的存储键
     *
     * @param token     Token
     * @param tokenType TOKEN的类型，是设备端还是控制端
     * @return String
     */
    private String getTokenKey(String token, int tokenType) {
        return (
                tokenType == TokenConstant.TOKEN_TYPE_CONTROL ?
                        TokenConstant.CONTROL_TOKEN_KEY_PREFIX :
                        TokenConstant.TERMINAL_TOKEN_KEY_PREFIX
        ) + token;
    }

    /**
     * 处理TOKEN与用户ID的映射，以便在二次登录时清楚除旧的token
     * @param userId 用户id
     * @param token Token
     * @param tokenType TOKEN的类型，是设备端还是控制端
     */
    private void handHash(String userId, String token, int tokenType) {
        String hashKey = (
                tokenType == TokenConstant.TOKEN_TYPE_CONTROL ?
                TokenConstant.CONTROL_TOKEN_HASH_KEY_PREFIX :
                TokenConstant.TERMINAL_TOKEN_HASH_KEY_PREFIX
        ) + SecureUtil.md5(userId).substring(0, 2);

        Object exist = redisTemplate.opsForHash().get(hashKey, userId);

        if (ObjectUtil.isNotNull(exist)) {
            redisTemplate.delete(getTokenKey(exist.toString(), tokenType));
        }

        redisTemplate.opsForHash().put(hashKey, userId, token);
    }

}
