package com.csthink.oa.dao;

import com.csthink.oa.entity.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("employeeDao")
public interface EmployeeDao {

    /**
     * 保存员工信息
     *
     * @param employee 员工对象
     */
    void insert(Employee employee);

    /**
     * 更新员工信息
     *
     * @param employee 员工对象
     */
    void update(Employee employee);

    /**
     * 根据员工编号删除员工信息
     *
     * @param id 员工编号
     */
    void delete(Integer id);

    /**
     * 根据员工编号获取员工信息
     *
     * @param id 员工编号
     * @return 员工对象
     */
    Employee selectById(Integer id);

    /**
     * 获取全部的员工集合
     *
     * @return 员工集合
     */
    List<Employee> selectAll();

    /**
     * 根据部门编号和职务查询出所有的员工
     *
     * @param deptId 部门编号
     * @param post 职务
     * @return 员工集合
     */
    List<Employee> selectByDeptIdAndPost(Integer deptId, String post);
}
