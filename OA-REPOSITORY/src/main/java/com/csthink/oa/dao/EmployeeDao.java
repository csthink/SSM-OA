package com.csthink.oa.dao;

import com.csthink.oa.entity.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("employeeDao")
public interface EmployeeDao {

    int insert(Employee employee);

    int update(Employee employee);

    int delete(Integer id);

    Employee selectById(Integer id);

    List<Employee> selectAll();
}
