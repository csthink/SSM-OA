package com.csthink.oa.dao;

import com.csthink.oa.entity.ExpenseClaimItem;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expenseClaimItemDao")
public interface ExpenseClaimItemDao {

    /**
     * 保存报销单条目信息
     *
     * @param expenseClaimItem 报销单条目对象
     */
    void insert(ExpenseClaimItem expenseClaimItem);

    /**
     * 更新报销单条目信息
     *
     * @param expenseClaimItem 报销单条目对象
     */
    void update(ExpenseClaimItem expenseClaimItem);

    /**
     * 根据报销单条目编号删除条目
     *
     * @param id 报销单条目编号
     */
    void delete(Integer id);

    /**
     * 查询指定报销单编号的所有条目
     *
     * @param cid 报销单编号
     * @return 报销单条目集合
     */
    List<ExpenseClaimItem> selectByExpenseClaimId(Integer cid);
}
