package com.csthink.oa.service;

import com.csthink.oa.entity.ExpenseClaim;
import com.csthink.oa.entity.ExpenseClaimItem;
import com.csthink.oa.entity.ExpenseClaimRecord;

import java.util.List;

public interface ExpenseClaimService {

    /**
     * 新创建报销单-保存报销单
     *
     * @param expenseClaim 报销单对象
     * @param items 报销单条目集合
     */
    void save(ExpenseClaim expenseClaim, List<ExpenseClaimItem> items);

    /**
     * 查询报销单
     *
     * @param id 报销单编号
     * @return 报销单对象
     */
    ExpenseClaim getExpenseClaim(Integer id);

    /**
     * 查询报销单所有条目
     *
     * @param cid 报销单编号
     * @return 报销单关联的所有的条目集合
     */
    List<ExpenseClaimItem> getItems(Integer cid);

    /**
     * 查询报销单的处理记录
     *
     * @param cid  报销单编号
     * @return 处理集合集合
     */
    List<ExpenseClaimRecord> getRecords(Integer cid);

    /**
     * 查询创建者自己创建的报销单
     *
     * @param eid 员工编号
     * @return 报销单集合
     */
    List<ExpenseClaim> getExpenseClaimForCreator(Integer eid);

    /**
     * 查询处理者需要处理的报销单
     *
     * @param eid 员工编号
     * @return 报销单集合
     */
    List<ExpenseClaim> getExpenseClaimForDealer(Integer eid);

    /**
     * 修改报销单
     *
     * @param expenseClaim 报销单对象
     * @param items 报销单条目对象
     */
    void update(ExpenseClaim expenseClaim, List<ExpenseClaimItem> items);

    /**
     * 提交报销单
     *
     * @param cid 报销单编号
     */
    void submit(Integer cid);

    /**
     * 处理报销单
     *
     * @param expenseClaimRecord 报销单记录对象
     */
    void deal(ExpenseClaimRecord expenseClaimRecord);

}
