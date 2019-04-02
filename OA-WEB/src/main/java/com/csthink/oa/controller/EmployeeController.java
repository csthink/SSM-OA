package com.csthink.oa.controller;

import com.csthink.oa.entity.Employee;
import com.csthink.oa.global.ExpenseClaimConstant;
import com.csthink.oa.service.DepartmentService;
import com.csthink.oa.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

@Controller("employeeController")
@RequestMapping("/employee")
public class EmployeeController {

    @Resource(name = "employeeService")
     private EmployeeService employeeService;

    @Resource(name = "departmentService")
    private DepartmentService departmentService;

    @RequestMapping("/list")
    public String list(Map<String, Object> map) {
        map.put("list", employeeService.getAll());
        return "employee/list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Map<String, Object> map) {
        map.put("employee", new Employee());
        map.put("departmentList", departmentService.getAll());
        map.put("postList", ExpenseClaimConstant.getPosts());
        return "employee/add";
    }

    @RequestMapping("/add")
    public String add(Employee employee) {
        employeeService.add(employee);
        return "redirect:list";
    }

    @RequestMapping(value = "/toEdit", params = "id")
    public String toEdit(Integer id, Map<String, Object> map) {
        map.put("employee", employeeService.get(id));
        map.put("departmentList", departmentService.getAll());
        map.put("postList", ExpenseClaimConstant.getPosts());
        return "employee/edit";
    }

    @RequestMapping("/edit")
    public String edit(Employee employee) {
        employeeService.edit(employee);
        return "redirect:list";
    }

    @RequestMapping(value = "/remove", params = "id")
    public String remove(Integer id) {
        employeeService.remove(id);
        return "redirect:list";
    }
}
