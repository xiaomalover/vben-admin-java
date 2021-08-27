package com.xm.admin.module.sys.controller;

import com.xm.admin.module.sys.payload.DepartmentAddEditRequest;
import com.xm.admin.module.sys.entity.SysDepartment;
import com.xm.admin.module.sys.service.ISysDepartmentService;
import com.xm.common.utils.ResultUtil;
import com.xm.common.vo.Result;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author xiaomalover <xiaomalover@gmail.com>
 * @since 2021-08-08
 */
@RestController
@RequestMapping("/department")
public class SysDepartmentController {

    final
    ISysDepartmentService departmentService;

    public SysDepartmentController(ISysDepartmentService departmentService) {
        this.departmentService = departmentService;
    }


    @GetMapping("/getDepartmentTree")
    public Result<Object> getDepartmentTree(
            @RequestParam(required = false) String deptName,
            @RequestParam(required = false) Integer status
    ) {
        return new ResultUtil<>().success(departmentService.getDepartmentTree(deptName, status));
    }

    @PostMapping("/add")
    public Result<Object> add(@Valid @ModelAttribute DepartmentAddEditRequest departmentAddEditRequest) {
        SysDepartment sysDepartment = new SysDepartment();
        sysDepartment.setName(departmentAddEditRequest.getDeptName());
        sysDepartment.setParentId(departmentAddEditRequest.getParentDept());
        sysDepartment.setSortOrder(departmentAddEditRequest.getOrderNo());
        sysDepartment.setDescription(departmentAddEditRequest.getRemark());
        sysDepartment.setStatus(departmentAddEditRequest.getStatus());
        if (departmentService.save(sysDepartment)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @PostMapping("/edit")
    public Result<Object> edit(@Valid @ModelAttribute DepartmentAddEditRequest departmentAddEditRequest) {
        SysDepartment sysDepartment = departmentService.getById(departmentAddEditRequest.getId());
        sysDepartment.setName(departmentAddEditRequest.getDeptName());
        sysDepartment.setParentId(departmentAddEditRequest.getParentDept());
        sysDepartment.setSortOrder(departmentAddEditRequest.getOrderNo());
        sysDepartment.setDescription(departmentAddEditRequest.getRemark());
        sysDepartment.setStatus(departmentAddEditRequest.getStatus());
        if (departmentService.updateById(sysDepartment)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }

    @DeleteMapping("/delete/{id}")
    public Result<Object> edit(@PathVariable String id) {
        if (departmentService.removeById(id)) {
            return new ResultUtil<>().success(true);
        }

        return new ResultUtil<>().error();
    }
}
