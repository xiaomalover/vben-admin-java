package com.xm.admin.module.content.controller;

import com.xm.admin.module.content.entity.ConArticleCategory;
import com.xm.admin.module.content.payload.ArticleCategoryAddEditRequest;
import com.xm.admin.module.content.service.IConArticleCategoryService;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Result;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-09-26
 */
@RestController
@RequestMapping("/article/category")
public class ConArticleCategoryController {
    
    final IConArticleCategoryService articleCategoryService;

    public ConArticleCategoryController(IConArticleCategoryService articleCategoryService) {
        this.articleCategoryService = articleCategoryService;
    }


    @GetMapping("/getCategoryTree")
    public Result<Object> getDepartmentTree(
            @RequestParam(required = false) String categoryName,
            @RequestParam(required = false) Integer status
    ) {
        return new ResultUtil<>().success(articleCategoryService.getCategoryTree(categoryName
                , status));
    }

    @PostMapping("/add")
    public Result<Object> add(@Valid @ModelAttribute ArticleCategoryAddEditRequest articleCategoryAddEditRequest) {
        ConArticleCategory articleCategory = new ConArticleCategory();
        articleCategory.setName(articleCategoryAddEditRequest.getCategoryName());
        articleCategory.setParentId(articleCategoryAddEditRequest.getParentCategory());
        articleCategory.setSortOrder(articleCategoryAddEditRequest.getOrderNo());
        articleCategory.setDescription(articleCategoryAddEditRequest.getRemark());
        articleCategory.setStatus(articleCategoryAddEditRequest.getStatus());
        if (articleCategoryService.save(articleCategory)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @PostMapping("/edit")
    public Result<Object> edit(@Valid @ModelAttribute ArticleCategoryAddEditRequest articleCategoryAddEditRequest) {
        ConArticleCategory articleCategory = articleCategoryService.getById(articleCategoryAddEditRequest.getId());
        articleCategory.setName(articleCategoryAddEditRequest.getCategoryName());
        articleCategory.setParentId(articleCategoryAddEditRequest.getParentCategory());
        articleCategory.setSortOrder(articleCategoryAddEditRequest.getOrderNo());
        articleCategory.setDescription(articleCategoryAddEditRequest.getRemark());
        articleCategory.setStatus(articleCategoryAddEditRequest.getStatus());
        if (articleCategoryService.updateById(articleCategory)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @DeleteMapping("/delete/{id}")
    public Result<Object> edit(@PathVariable String id) {
        if (articleCategoryService.removeById(id)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }
}
