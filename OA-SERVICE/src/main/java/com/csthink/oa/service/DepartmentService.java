package com.csthink.oa.service;

import com.csthink.oa.entity.Department;

import java.util.List;

public interface DepartmentService {

    /**
     * 添加部门
     *
     * @param department 部门对象
     */
    void add(Department department);

    /**
     * 删除部门
     *
     * @param id 部门编号
     * @return
     */
    void remove(Integer id);

    /**
     * 修改部门
     *
     * @param department 部门对象
     * @return
     */
    void edit(Department department);

    /**
     * 获取指定的部门信息
     *
     * @param id 部门编号
     * @return 部门对象
     */
    Department get(Integer id);

    /**
     * 获取所有的部门信息
     *
     * @return 包含所有部门信息的集合
     */
    List<Department> getAll();
}
