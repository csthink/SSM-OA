package com.csthink.oa.dao;

import com.csthink.oa.entity.ExpenseClaimRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expenseClaimRecordDao")
public interface ExpenseClaimRecordDao {

    int insert(ExpenseClaimRecord expenseClaimRecord);

    /**
     * 查询指定报销单编号的处理记录
     *
     * @param cid
     * @return
     */
    List<ExpenseClaimRecord> selectByExpenseClaimId(Integer cid);
}
