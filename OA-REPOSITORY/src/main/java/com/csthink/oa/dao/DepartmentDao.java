package com.csthink.oa.dao;

import com.csthink.oa.entity.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("departmentDao")
public interface DepartmentDao {

    int insert(Department department);

    int update(Department department);

    int delete(Integer id);

    Department selectById(Integer id);

    List<Department> selectAll();
}
