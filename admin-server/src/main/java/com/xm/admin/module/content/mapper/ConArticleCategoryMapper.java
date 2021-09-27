package com.xm.admin.module.content.mapper;

import com.xm.admin.module.content.entity.ConArticleCategory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-09-26
 */
public interface ConArticleCategoryMapper extends BaseMapper<ConArticleCategory> {

    /**
     * 获取分类树
     *
     * @param categoryName 分类名
     * @param status   状态
     * @return 分类分树
     */
    List<Map<String, Object>> selectAllCategoryListMap(String categoryName, Integer status);
}
