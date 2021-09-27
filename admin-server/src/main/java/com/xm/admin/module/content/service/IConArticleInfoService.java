package com.xm.admin.module.content.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.content.entity.ConArticleInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xm.common.vo.ExtraVo;

import java.util.Map;

/**
 * <p>
 * 文章表 服务类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-09-26
 */
public interface IConArticleInfoService extends IService<ConArticleInfo> {

    /**
     * 获取文章列表
     *
     * @param page        分页
     * @param articleInfo 搜索参数
     * @param extraVo     额外参数
     * @return 文章列表
     */
    IPage<Map<String, Object>> getArticleList(IPage<Map<String, Object>> page, ConArticleInfo articleInfo, ExtraVo extraVo);

}
