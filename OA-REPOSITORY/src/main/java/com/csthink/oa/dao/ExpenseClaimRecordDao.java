package com.csthink.oa.dao;

import com.csthink.oa.entity.ExpenseClaimRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expenseClaimRecordDao")
public interface ExpenseClaimRecordDao {

    /**
     * 保存报销单处理记录
     *
     * @param expenseClaimRecord 报销单处理记录对象
     */
    void insert(ExpenseClaimRecord expenseClaimRecord);

    /**
     * 查询指定报销单编号的所有处理记录
     *
     * @param cid 报销单编号
     * @return 报销单处理记录集合
     */
    List<ExpenseClaimRecord> selectByExpenseClaimId(Integer cid);
}
