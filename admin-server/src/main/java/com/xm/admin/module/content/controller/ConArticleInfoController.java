package com.xm.admin.module.content.controller;

import cn.hutool.core.map.MapBuilder;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.xm.admin.module.content.entity.ConArticleInfo;
import com.xm.admin.module.content.service.IConArticleInfoService;
import com.xm.common.utils.CommonPageUtil;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.ExtraVo;
import com.xm.common.vo.Result;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 文章表 前端控制器
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-09-26
 */
@RestController
@RequestMapping("/article")
public class ConArticleInfoController {

    private final IConArticleInfoService articleInfoService;

    public ConArticleInfoController(IConArticleInfoService articleInfoService) {
        this.articleInfoService = articleInfoService;
    }

    @GetMapping("/getByCondition")
    public Result<Object> getByCondition(
            @ModelAttribute ConArticleInfo articleInfo,
            @ModelAttribute ExtraVo extraVo
    ) {
        IPage<Map<String, Object>> page = new CommonPageUtil<Map<String, Object>>().initIPage(extraVo);
        IPage<Map<String, Object>> articleInfoList = articleInfoService.getArticleList(page, articleInfo, extraVo);
        articleInfoList.getRecords().forEach(x -> x.put("thumb", new String[]{x.get("thumb").toString()}));
        return new ResultUtil<>().success(articleInfoList);
    }

    @GetMapping("/detail/{id}")
    public Result<Object> getArticle(@PathVariable String id) {
        ConArticleInfo articleInfo = articleInfoService.getById(id);
        Map<String, Object> result = new MapBuilder<>(new HashMap<String, Object>(8))
                .put("id", articleInfo.getId())
                .put("status", articleInfo.getStatus())
                .put("title", articleInfo.getTitle())
                .put("categoryId", articleInfo.getCategoryId())
                .put("thumb", new String[]{articleInfo.getThumb()})
                .put("summary", articleInfo.getSummary())
                .put("content", articleInfo.getContent())
                .build();
        return new ResultUtil<>().success(result);
    }

    @DeleteMapping("/delete/{ids}")
    public Result<Object> delAllByIds(@PathVariable String[] ids) {
        for (String id : ids) {
            articleInfoService.removeById(id);
        }
        return new ResultUtil<>().success(true);
    }

    @PostMapping("/add")
    public Result<Object> add(@ModelAttribute ConArticleInfo articleInfo) {
        if (articleInfoService.save(articleInfo)) {
            return new ResultUtil<>().success(true);
        } else {
            return new ResultUtil<>().error("添加文章失败");
        }
    }

    @PostMapping("/edit")
    public Result<Object> edit(@ModelAttribute ConArticleInfo articleInfo) {
        if (articleInfoService.updateById(articleInfo)) {
            return new ResultUtil<>().success(true);
        } else {
            return new ResultUtil<>().error("编辑文章失败");
        }
    }

}
