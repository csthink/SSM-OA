package com.csthink.oa.dao;

import com.csthink.oa.entity.ExpenseClaim;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("expenseClaimDao")
public interface ExpenseClaimDao {

    /**
     * 保存报销单信息
     *
     * @param expenseClaim 报销单对象
     */
    void insert(ExpenseClaim expenseClaim);

    /**
     * 更新报销单信息
     *
     * @param expenseClaim 报销单对象
     */
    void update(ExpenseClaim expenseClaim);

    /**
     * 删除报销单信息
     *
     * @param id 报销单编号
     */
    void delete(Integer id);

    /**
     * 根据报销单编号获取报销单对象
     *
     * @param id 报销单编号
     * @return 报销单对象
     */
    ExpenseClaim selectById(Integer id);

    /**
     * 根据创建者id 查询报销单
     *
     * @param eid 员工编号
     * @return 报销单集合
     */
    List<ExpenseClaim> selectByCreator(Integer eid);

    /**
     * 根据处理者id 查询报销单
     *
     * @param eid 员工编号
     * @return 报销单集合
     */
    List<ExpenseClaim> selectByDealer(Integer eid);
}
