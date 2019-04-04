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

    /**
     * 填写报销单
     * @param map
     * @return
     */
    @RequestMapping("/toAdd")
    public String toAdd(Map<String, Object> map) {
        map.put("items", ExpenseClaimConstant.getExpenseType());
        map.put("info", new ExpenseClaimInfo()); // info 为键传递到页面的modelAttribute

        return "expense_claim/add";
    }

    /**
     * 处理报销单保存
     * @param session
     * @param info dto
     * @return
     */
    @RequestMapping("/add")
    public String add(HttpSession session, ExpenseClaimInfo info) {
        Employee employee = (Employee) session.getAttribute("employee");
        info.getExpenseClaim().setCreator(employee.getId());
        expenseClaimService.save(info.getExpenseClaim(), info.getItems());
        return "redirect:detail?id=" + info.getExpenseClaim().getId();
    }

    /**
     * 报销单详情
     * @param id 报销单编号
     * @param map
     * @return
     */
    @RequestMapping("/detail")
    public String detail(Integer id, Map<String, Object> map) {
        map.put("expenseClaim", expenseClaimService.getExpenseClaim(id));
        map.put("items", expenseClaimService.getItems(id));
        map.put("records", expenseClaimService.getRecords(id));

        return "expense_claim/detail";
    }

    /**
     * 获取个人报销单
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("/creator")
    public String creator(HttpSession session, Map<String, Object> map) {
        Employee employee = (Employee) session.getAttribute("employee");
        map.put("list", expenseClaimService.getExpenseClaimForCreator(employee.getId()));
        return "expense_claim/creator";
    }

    /**
     * 获取待处理报销单
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("/dealer")
    public String dealer(HttpSession session, Map<String, Object> map) {
        Employee employee = (Employee) session.getAttribute("employee");
        map.put("list", expenseClaimService.getExpenseClaimForDealer(employee.getId()));
        return "expense_claim/dealer";
    }

    /**
     * 修改报销单
     * @param id 报销单编号
     * @param map
     * @return
     */
    @RequestMapping("/to_edit")
    public String toEdit(Integer id, Map<String, Object> map) {
        map.put("items", ExpenseClaimConstant.getExpenseType());
        ExpenseClaimInfo expenseClaimInfo = new ExpenseClaimInfo();
        expenseClaimInfo.setExpenseClaim(expenseClaimService.getExpenseClaim(id));
        expenseClaimInfo.setItems(expenseClaimService.getItems(id));
        map.put("info", expenseClaimInfo);

        return "expense_claim/edit";
    }

    /**
     * 处理修改报销单
     * @param session
     * @param info
     * @return
     */
    @RequestMapping("/edit")
    public String update(HttpSession session, ExpenseClaimInfo info) {
        Employee employee = (Employee) session.getAttribute("employee");
        info.getExpenseClaim().setCreator(employee.getId());
        expenseClaimService.update(info.getExpenseClaim(), info.getItems());
        return "redirect:dealer";
    }

    /**
     * 提交报销单
     * @param id 报销单编号
     * @return
     */
    @RequestMapping("/submit")
    public String submit(Integer id) {
        expenseClaimService.submit(id);
        return "redirect:dealer";
    }

}
