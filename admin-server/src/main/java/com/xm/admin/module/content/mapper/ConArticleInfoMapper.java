package com.xm.admin.module.content.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.content.entity.ConArticleInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xm.common.vo.ExtraVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * <p>
 * 文章表 Mapper 接口
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-09-26
 */
@Repository
public interface ConArticleInfoMapper extends BaseMapper<ConArticleInfo> {

    /**
     * 获取文章列表
     *
     * @param page        分页
     * @param articleInfo 搜索参数
     * @param extraVo     额外参数
     * @return 文章列表
     */
    IPage<Map<String, Object>> selectArticleList(IPage<Map<String, Object>> page, @Param("articleInfo") ConArticleInfo articleInfo, ExtraVo extraVo);

}
