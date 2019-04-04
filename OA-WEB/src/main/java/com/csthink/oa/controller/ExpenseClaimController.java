package com.csthink.oa.controller;

import com.csthink.oa.dto.ExpenseClaimInfo;
import com.csthink.oa.entity.Employee;
import com.csthink.oa.global.ExpenseClaimConstant;
import com.csthink.oa.service.ExpenseClaimService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller("expenseClaimController")
@RequestMapping("/expense_claim")
public class ExpenseClaimController {

    @Resource(name = "expenseClaimService")
    private ExpenseClaimService expenseClaimService;

    @RequestMapping("/toAdd")
    public String toAdd(Map<String, Object> map) {
        map.put("items", ExpenseClaimConstant.getExpenseType());
        map.put("info", new ExpenseClaimInfo());

        return "expense_claim/toAdd";
    }

    @RequestMapping("/add")
    public String add(HttpSession session, ExpenseClaimInfo info) {
        Employee employee = (Employee) session.getAttribute("employee");
        info.getExpenseClaim().setCreator(employee.getId());
        expenseClaimService.save(info.getExpenseClaim(), info.getItems());
        return "redirect:detail?id=" + info.getExpenseClaim().getId();
    }

    @RequestMapping("/detail")
    public String detail(Integer id, Map<String, Object> map) {
        map.put("expenseClaim", expenseClaimService.getExpenseClaim(id));
        map.put("items", expenseClaimService.getItems(id));
        map.put("records", expenseClaimService.getRecords(id));

        return "expense_claim/detail";
    }
}
