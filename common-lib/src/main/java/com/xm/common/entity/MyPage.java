package com.xm.common.entity;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * 将返回列名 records 改为 items
 * @param <T>
 */
public class MyPage<T> extends Page<T> {

    private static final long serialVersionUID = -6935023462215347018L;

    public List<T> getItems() {
        return super.getRecords();
    }

    public List<T> getRecords() {
        return null;
    }
}
