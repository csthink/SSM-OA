package com.csthink.oa.service;

import com.csthink.oa.entity.Employee;

import java.util.List;

public interface EmployeeService {

    /**
     * 添加员工
     *
     * @param employee 员工对象
     */
    void add(Employee employee);

    /**
     * 删除员工
     *
     * @param id 员工编号
     */
    void remove(Integer id);

    /**
     * 修改员工
     *
     * @param employee 员工对象
     */
    void edit(Employee employee);

    /**
     * 获取指定的员工信息
     *
     * @param id 员工编号
     * @return 员工对象
     */
    Employee get(Integer id);

    /**
     * 获取所有的员工信息
     *
     * @return 包含所有员工信息的集合
     */
    List<Employee> getAll();
}
