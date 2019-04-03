package com.csthink.oa.dao;

import com.csthink.oa.entity.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("departmentDao")
public interface DepartmentDao {

    /**
     * 保存部门信息
     *
     * @param department 部门对象
     */
    void insert(Department department);

    /**
     * 更新部门信息
     *
     * @param department 部门对象
     */
    void update(Department department);

    /**
     * 删除部门信息
     *
     * @param id 部门编号
     */
    void delete(Integer id);

    /**
     * 根据部门编号获取部门信息
     *
     * @param id 部门编号
     * @return 部门对象
     */
    Department selectById(Integer id);

    /**
     * 获取所有的部门集合
     *
     * @return 部门集合
     */
    List<Department> selectAll();
}
