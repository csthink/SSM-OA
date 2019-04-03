package com.csthink.oa.service;

import com.csthink.oa.entity.Employee;

public interface UserService {

    Employee login(Integer id, String password);

    void changePassword(Employee employee);

    boolean checkPassword(String inputPassword, Employee employee);
}
