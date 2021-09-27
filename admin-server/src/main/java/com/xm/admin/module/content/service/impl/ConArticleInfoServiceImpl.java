package com.xm.admin.module.content.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.content.entity.ConArticleInfo;
import com.xm.admin.module.content.mapper.ConArticleInfoMapper;
import com.xm.admin.module.content.service.IConArticleInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xm.common.vo.ExtraVo;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 文章表 服务实现类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-09-26
 */
@Service
public class ConArticleInfoServiceImpl extends ServiceImpl<ConArticleInfoMapper, ConArticleInfo> implements IConArticleInfoService {

    final ConArticleInfoMapper articleInfoMapper;

    public ConArticleInfoServiceImpl(ConArticleInfoMapper articleInfoMapper) {
        this.articleInfoMapper = articleInfoMapper;
    }

    @Override
    public IPage<Map<String, Object>> getArticleList(IPage<Map<String, Object>> page, ConArticleInfo articleInfo, ExtraVo extraVo) {
        return articleInfoMapper.selectArticleList(page, articleInfo, extraVo);
    }
}
