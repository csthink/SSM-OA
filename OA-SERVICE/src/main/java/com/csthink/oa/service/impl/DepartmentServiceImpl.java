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
    public int add(Department department) {
        department.setCreateTime(new Date());
        department.setUpdateTime(new Date());
        return departmentDao.insert(department);
    }

    @Override
    public int remove(Integer id) {
        return departmentDao.delete(id);
    }

    @Override
    public int edit(Department department) {
        department.setUpdateTime(new Date());
        return departmentDao.update(department);
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
