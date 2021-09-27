package com.xm.admin.module.content.payload;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class ArticleCategoryAddEditRequest implements Serializable {

    private static final long serialVersionUID = 120759823816854783L;
    private Integer id;

    @NotEmpty(message = "请输入分类名称")
    private String categoryName;

    private Integer parentCategory;

    private BigDecimal orderNo;

    private Integer status;

    private String remark;
}
