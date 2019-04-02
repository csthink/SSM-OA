package com.csthink.oa.controller;

import com.csthink.oa.entity.Department;
import com.csthink.oa.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller("departmentController")
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
     private DepartmentService departmentService;

    @RequestMapping("/list")
    public String list(Map<String, Object> map) {
        map.put("list", departmentService.getAll());
        return "department/list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(Map<String, Object> map) {
        map.put("department", new Department());
        return "department/add";
    }

    @RequestMapping("/add")
    public String add(Department department) {
        departmentService.add(department);
        return "redirect:list";
    }

    @RequestMapping(value = "/toEdit", params = "id")
    public String toEdit(Integer id, Map<String, Object> map) {
        map.put("department", departmentService.get(id));
        return "department/edit";
    }

    @RequestMapping("/edit")
    public String edit(Department department) {
        departmentService.edit(department);
        return "redirect:list";
    }

    @RequestMapping(value = "/remove", params = "id")
    public String remove(Integer id) {
        departmentService.remove(id);
        return "redirect:list";
    }
}
