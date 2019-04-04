package com.csthink.oa.service.impl;

import com.csthink.oa.dao.DepartmentDao;
import com.csthink.oa.entity.Department;
import com.csthink.oa.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Resource(name = "departmentDao")
    private DepartmentDao departmentDao;

    @Override
    public void add(Department department) {
        department.setCreateTime(new Date());
        department.setUpdateTime(new Date());
        departmentDao.insert(department);
    }

    @Override
    public void remove(Integer id) {
        departmentDao.delete(id);
    }

    @Override
    public void edit(Department department) {
        department.setUpdateTime(new Date());
        departmentDao.update(department);
    }

    @Override
    public Department get(Integer id) {
        return departmentDao.selectById(id);
    }

    @Override
    public List<Department> getAll() {
        return departmentDao.selectAll();
    }
}
