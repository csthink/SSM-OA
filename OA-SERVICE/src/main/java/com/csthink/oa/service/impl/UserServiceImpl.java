package com.csthink.oa.service.impl;

import com.csthink.oa.dao.EmployeeDao;
import com.csthink.oa.entity.Employee;
import com.csthink.oa.service.UserService;
import com.csthink.oa.service.utils.CommonUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource(name = "employeeDao")
    private EmployeeDao employeeDao;

    @Override
    public Employee login(Integer id, String password) {
        Employee employee = employeeDao.selectById(id);

        try {
            if (employee != null && CommonUtils.checkPassword(password, employee.getPassword())) {
                return employee;
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void changePassword(Employee employee) {
        try {
            employee.setPassword(CommonUtils.encryptByMD5(employee.getPassword()));
            employee.setUpdateTime(new Date());
            employeeDao.update(employee);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public boolean checkPassword(String inputPassword, Employee employee) {
        try {
            return CommonUtils.checkPassword(inputPassword, employee.getPassword());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return false;
    }
}
