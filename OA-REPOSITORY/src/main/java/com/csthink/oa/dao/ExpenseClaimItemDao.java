package com.csthink.oa.dao;

import com.csthink.oa.entity.ExpenseClaimItem;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expenseClaimItemDao")
public interface ExpenseClaimItemDao {

    int insert(ExpenseClaimItem expenseClaimItem);

    int update(ExpenseClaimItem expenseClaimItem);

    int delete(Integer id);

    /**
     * 查询指定报销单编号的所有条目
     *
     * @param cid
     * @return
     */
    List<ExpenseClaimItem> selectByExpenseClaimId(Integer cid);
}
