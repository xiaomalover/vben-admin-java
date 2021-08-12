package com.xm.api.authorization.manager;

import com.xm.api.authorization.vo.Token;

/**
 * 对Token进行操作的接口
 * @author xiaomalover <xiaomalover@gmail.com>
 */
public interface TokenManager {

    /**
     * 创建一个token关联上指定用户
     * @param userId 指定用户的id
     * @param tokenType TOKEN的类型，是设备端还是控制端
     * @return 生成的token
     */
    Token createToken(String userId, int tokenType);

    /**
     * 刷新token
     * @param token token
     * @param tokenType TOKEN的类型，是设备端还是控制端
     */
    void refreshToken(String token, int tokenType);

    /**
     * 通过token拿userId
     * @param token token
     * @param tokenType TOKEN的类型，是设备端还是控制端
     * @return 用户id
     */
    String getUserIdByToken(String token, int tokenType);
}
