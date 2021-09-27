package com.xm.admin.module.content.service;

import com.xm.admin.module.content.entity.ConArticleCategory;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-09-26
 */
public interface IConArticleCategoryService extends IService<ConArticleCategory> {
    /**
     * 获取分类树
     *
     * @param categoryName 分类名
     * @param status   状态
     * @return 分类分树
     */
    List<Map<String, Object>> getCategoryTree(String categoryName, Integer status);
}
