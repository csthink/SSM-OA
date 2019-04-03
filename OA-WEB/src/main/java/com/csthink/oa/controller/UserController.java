package com.csthink.oa.controller;

import com.csthink.oa.entity.Employee;
import com.csthink.oa.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

    @Resource(name = "userService")
    private UserService userService;

    @GetMapping("/toLogin")
    public String toLogin() {
        return "user/toLogin";
    }

    @PostMapping("/login")
    public String login(HttpSession session, @RequestParam String id, @RequestParam String password) {
        if (null != id && !"".equals(id.trim()) && null != password && !"".equals(password.trim())) {
            Employee employee = userService.login(Integer.parseInt(id), password);
            if (employee != null) {
                session.setAttribute("employee", employee);
                return "redirect:profile";
            }
        }

        return "redirect:toLogin";
    }

    @GetMapping("/profile")
    public String userProfile() {
        return "user/profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        Enumeration em = session.getAttributeNames();
        while (em.hasMoreElements()) {
            session.removeAttribute(em.nextElement().toString());
        }
        return "redirect:toLogin";
    }

    @GetMapping("/toChangePassword")
    public String toChangePassword() {
        return "user/toChangePassword";
    }

    @PostMapping("/changePassword")
    public String changePassword(HttpSession session, @RequestParam String oldPassword, @RequestParam String newPassword1, @RequestParam String newPassword2) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (userService.checkPassword(oldPassword, employee)) {
            if (newPassword1.equals(newPassword2)) {
                employee.setPassword(newPassword1);
                userService.changePassword(employee);
                return "redirect:profile";
            }
        }

        return "redirect:toChangePassword";
    }
}
