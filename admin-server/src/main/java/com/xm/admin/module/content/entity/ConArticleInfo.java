package com.xm.admin.module.content.entity;

import com.xm.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 文章表
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-09-26
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class ConArticleInfo extends BaseEntity{

    private static final long serialVersionUID = 1L;

    /**
     * 文章分类ID
     */
    private String categoryId;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 文章封面图
     */
    private String thumb;

    /**
     * 文章简介
     */
    private String summary;

    /**
     * 文章内容
     */
    private String content;

    /**
     * 作者
     */
    private String author;

    /**
     * 状态(0无效;1有效)
     */
    private Integer status;
}
