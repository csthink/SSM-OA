package com.csthink.oa.service.impl;

import com.csthink.oa.dao.EmployeeDao;
import com.csthink.oa.dao.ExpenseClaimDao;
import com.csthink.oa.dao.ExpenseClaimItemDao;
import com.csthink.oa.dao.ExpenseClaimRecordDao;
import com.csthink.oa.entity.Employee;
import com.csthink.oa.entity.ExpenseClaim;
import com.csthink.oa.entity.ExpenseClaimItem;
import com.csthink.oa.entity.ExpenseClaimRecord;
import com.csthink.oa.global.ExpenseClaimConstant;
import com.csthink.oa.service.ExpenseClaimService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service("expenseClaimService")
public class ExpenseClaimServiceImpl implements ExpenseClaimService {

    @Resource(name = "expenseClaimDao")
    private ExpenseClaimDao expenseClaimDao;

    @Resource(name = "expenseClaimItemDao")
    private ExpenseClaimItemDao expenseClaimItemDao;

    @Resource(name = "expenseClaimRecordDao")
    private ExpenseClaimRecordDao expenseClaimRecordDao;

    @Resource(name = "employeeDao")
    private EmployeeDao employeeDao;

    @Override
    public void save(ExpenseClaim expenseClaim, List<ExpenseClaimItem> items) {
        // 新创建的报销单，下一个处理人是自己，自己可以修改或提交报销单
        expenseClaim.setNextDealEmp(expenseClaim.getCreator());
        // 新创建的报销单，状态是"新创建"
        expenseClaim.setStatus(ExpenseClaimConstant.EXPENSE_CLAIM_CREATED);
        expenseClaim.setCreateTime(new Date());
        expenseClaim.setUpdateTime(new Date());
        // 保存报销单
        expenseClaimDao.insert(expenseClaim);

        // 我们在Mybatis的声明式事务中开启了会自动使用事务，这里不用另做事务的处理
        // 这里报销单条目信息比较少，暂时使用循环
        for (ExpenseClaimItem item : items) {
            // 报销单编号从上一步的报销单保存后取出
            item.setExpenseClaimId(expenseClaim.getId());
            // 保存报销单条目
            expenseClaimItemDao.insert(item);
        }
    }

    @Override
    public ExpenseClaim getExpenseClaim(Integer id) {
        return expenseClaimDao.selectById(id);
    }

    @Override
    public List<ExpenseClaimItem> getItems(Integer cid) {
        return expenseClaimItemDao.selectByExpenseClaimId(cid);
    }

    @Override
    public List<ExpenseClaimRecord> getRecords(Integer cid) {
        return expenseClaimRecordDao.selectByExpenseClaimId(cid);
    }

    @Override
    public List<ExpenseClaim> getExpenseClaimForCreator(Integer eid) {
        return expenseClaimDao.selectByCreator(eid);
    }

    @Override
    public List<ExpenseClaim> getExpenseClaimForDealer(Integer eid) {
        return expenseClaimDao.selectByDealer(eid);
    }

    @Override
    public void update(ExpenseClaim expenseClaim, List<ExpenseClaimItem> items) {
        // 修改报销单，下一个处理人是自己，自己可以修改或提交报销单
        expenseClaim.setNextDealEmp(expenseClaim.getCreator());
        // 修改报销单，状态是"新创建"
        expenseClaim.setStatus(ExpenseClaimConstant.EXPENSE_CLAIM_CREATED);
        expenseClaim.setUpdateTime(new Date());
        // 更新报销单
        expenseClaimDao.update(expenseClaim);

        // 更新报销单条目
        /*
            1. 获取DB中已保存的所有条目集合
            2. 删除DB中不需要保存的条目信息
                将DB中已保存的条目和用户本次提交的条目对比
                > 若DB中已保存的条目不在本次提交的条目中，则删除DB中已保存的条目
            3. 更新或新增用户提交的条目信息
                本次提交的条目中，根据是否存在条目编号，判断是否是已保存的条目还是新创建的条目
                > 已保存的条目，则更新条目操作
                > 不存在的条目即为新创建的条目，则新增条目操作
         */

        // 1. 获取DB中已保存的所有条目集合
        List<ExpenseClaimItem> itemsFromDB = expenseClaimItemDao.selectByExpenseClaimId(expenseClaim.getId());

        // 2. 删除DB中不需要保存的条目信息
        // 方式一: 循环遍历，删除
        for (ExpenseClaimItem itemFromDB : itemsFromDB) {
            boolean isHave = false;

            for (ExpenseClaimItem item : items) {
                if (item.getId().equals(itemFromDB.getId())) {
                    isHave = true;
                    break;
                }
            }
            // DB中保存的条目但不在本次用户提交的条目中
            if (!isHave) {
                expenseClaimItemDao.delete(itemFromDB.getId());
            }
        }
        // 方式二：获取两个集合的差集，in方式删除

        // 3. 更新或新增用户提交的条目信息
        for (ExpenseClaimItem item : items) {
            if (item.getId() != null) {
                expenseClaimItemDao.update(item);
            } else {
                item.setExpenseClaimId(expenseClaim.getId());
                expenseClaimItemDao.insert(item);
            }
        }

    }

    @Override
    public void submit(Integer cid) {
        /*
         1. 更新报销单记录
            + 报销单的下一个处理人: 应该是该员工所在部门的部门经理的员工编号
                > 根据报销单编号，获取报销单记录
                > 根据报销单记录，获取报销单关联的员工对象(是哪位员工创建的)
                > 员工表中查询出该员工的部门经理
            + 报销单的状态修改为: 已提交

         2. 添加报销单处理记录
         */

        // 1. 更新报销单记录
        ExpenseClaim expenseClaim = expenseClaimDao.selectById(cid); // 根据报销单编号，获取报销单记录
        Employee employee = employeeDao.selectById(expenseClaim.getCreator()); // 根据报销单记录，获取报销单关联的员工对象
        Integer dealerId = employeeDao.selectByDeptIdAndPost(employee.getDeptId(), ExpenseClaimConstant.POST_FM).get(0).getId(); // 员工表中查询出该员工的部门经理
        expenseClaim.setNextDealEmp(dealerId);
        expenseClaim.setStatus(ExpenseClaimConstant.EXPENSE_CLAIM_SUBMIT);
        expenseClaimDao.update(expenseClaim);

        // 2. 添加报销单处理记录
        ExpenseClaimRecord expenseClaimRecord = new ExpenseClaimRecord();
        expenseClaimRecord.setExpenseClaimId(cid);
        expenseClaimRecord.setDealEmp(employee.getId());
        expenseClaimRecord.setDealType(ExpenseClaimConstant.DEAL_SUBMIT);
        expenseClaimRecord.setDealResult(ExpenseClaimConstant.EXPENSE_CLAIM_SUBMIT);
        expenseClaimRecord.setRemark("");
        expenseClaimRecord.setDealTime(new Date());
        expenseClaimRecordDao.insert(expenseClaimRecord);
    }

    @Override
    public void deal(ExpenseClaimRecord expenseClaimRecord) {
        /*
            根据处理方式的不同，实现不同的业务逻辑
            处理方式: 通过、打回、拒绝、付款
            更新报销单记录
            保存报销单处理记录
         */
        String dealType = expenseClaimRecord.getDealType(); // 获取处理方式
        ExpenseClaim expenseClaim = expenseClaimDao.selectById(expenseClaimRecord.getExpenseClaimId()); // 获取报销单对象
        Employee employee = employeeDao.selectById(expenseClaimRecord.getDealEmp()); // 获取处理人员工对象

        switch (dealType) {
            case ExpenseClaimConstant.DEAL_PASS: // 通过
                // 判断报销单金额是否在部门经理允许处理的范围
                if (expenseClaim.getTotalAmount().compareTo(BigDecimal.valueOf(ExpenseClaimConstant.AUDIT_LIMIT)) <= 0
                        && employee.getPost().equals(ExpenseClaimConstant.POST_FM)) {
                    // 部门经理可处理的范围
                    expenseClaim.setStatus(ExpenseClaimConstant.EXPENSE_CLAIM_APPROVED); // 报销单状态:已审核
                    expenseClaim.setNextDealEmp(employeeDao.selectByDeptIdAndPost(employee.getDeptId(), ExpenseClaimConstant.POST_CASHIER).get(0).getId()); // 下一个处理人是员工所在部门的财务

                    expenseClaimRecord.setDealResult(ExpenseClaimConstant.EXPENSE_CLAIM_APPROVED); // 报销单记录结果:已审核
                } else {
                    // 需要总经理复审
                    expenseClaim.setStatus(ExpenseClaimConstant.EXPENSE_CLAIM_RECHECK); // 报销单状态:待复审
                    expenseClaim.setNextDealEmp(employeeDao.selectByDeptIdAndPost(employee.getDeptId(), ExpenseClaimConstant.POST_GM).get(0).getId()); // 下一个处理人是员工所在部门的总经理

                    expenseClaimRecord.setDealResult(ExpenseClaimConstant.EXPENSE_CLAIM_RECHECK); // 报销单记录结果:待复审
                }
                break;
            case ExpenseClaimConstant.DEAL_BACK: // 打回
                expenseClaim.setStatus(ExpenseClaimConstant.EXPENSE_CLAIM_BACK); // 报销单状态: 已打回
                expenseClaim.setNextDealEmp(expenseClaim.getCreator()); // 报销单下一个处理人: 报销单创建员工
                //expenseClaim.setNextDealEmp(employee.getId());

                expenseClaimRecord.setDealResult(ExpenseClaimConstant.EXPENSE_CLAIM_BACK); // 报销单记录结果: 已打回
                break;
            case ExpenseClaimConstant.DEAL_REJECT: // 拒绝
                expenseClaim.setStatus(ExpenseClaimConstant.EXPENSE_CLAIM_TERMINATED); // 报销单状态: 已终止
                expenseClaim.setNextDealEmp(0); // 0 表示没有处理人，这里已被拒绝，就没有处理人了
                expenseClaimRecord.setDealResult(ExpenseClaimConstant.EXPENSE_CLAIM_TERMINATED); // 报销单记录结果: 已终止
                break;
            case ExpenseClaimConstant.DEAL_PAID: // 付款
                expenseClaim.setStatus(ExpenseClaimConstant.EXPENSE_CLAIM_PAID); // 报销单状态: 已打款
                expenseClaim.setNextDealEmp(0); // 0 表示没有处理人，这里已被拒绝，就没有处理人了
                expenseClaimRecord.setDealResult(ExpenseClaimConstant.EXPENSE_CLAIM_PAID); // 报销单记录结果: 已打款
                break;
            default:
                break;
        }

        expenseClaimRecord.setDealTime(new Date());
        expenseClaimDao.update(expenseClaim);
        expenseClaimRecordDao.insert(expenseClaimRecord);
    }
}
