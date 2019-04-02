package com.csthink.oa.service.impl;

import com.csthink.oa.dao.EmployeeDao;
import com.csthink.oa.entity.Employee;
import com.csthink.oa.service.EmployeeService;
import com.csthink.oa.service.utils.CommonUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Resource(name = "employeeDao")
    private EmployeeDao employeeDao;

    @Override
    public int add(Employee employee) {
        employee.setCreateTime(new Date());
        employee.setUpdateTime(new Date());
        try {
            // 设置用户的初始密码为 111111
            employee.setPassword(CommonUtils.encryptByMD5("111111"));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return employeeDao.insert(employee);
    }

    @Override
    public int remove(Integer id) {
        return employeeDao.delete(id);
    }

    @Override
    public int edit(Employee employee) {
        employee.setUpdateTime(new Date());
        return employeeDao.update(employee);
    }

    @Override
    public Employee get(Integer id) {
        return employeeDao.selectById(id);
    }

    @Override
    public List<Employee> getAll() {
        return employeeDao.selectAll();
    }
}
