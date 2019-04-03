package com.csthink.oa.dao;

import com.csthink.oa.entity.ExpenseClaim;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expenseClaimDao")
public interface ExpenseClaimDao {

    int insert(ExpenseClaim expenseClaim);

    int update(ExpenseClaim expenseClaim);

    int delete(Integer id);

    ExpenseClaim selectById(Integer id);

    /**
     * 根据创建者id 查询保险单
     *
     * @param cid 员工编号
     * @return
     */
    List<ExpenseClaim> selectByCreator(Integer cid);

    /**
     * 根据处理者id 查询报销单
     *
     * @param did 员工编号
     * @return
     */
    List<ExpenseClaim> selectByDealer(Integer did);
}
