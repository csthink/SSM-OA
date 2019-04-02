package com.csthink.oa.global;

import java.util.ArrayList;
import java.util.List;

/**
 * 报销单常量类
 */
public class ExpenseClaimConstant {

    /**
     * 职位描述
     */
    public static final String POST_STAFF = "员工";
    public static final String POST_FM = "部门经理";
    public static final String POST_GM = "总经理";
    public static final String POST_CASHIER = "财务";

    /**
     * 获取职位名称列表
     *
     * @return List
     */
    public static List<String> getPosts() {
        List<String> list = new ArrayList<>();
        list.add(POST_STAFF);
        list.add(POST_FM);
        list.add(POST_GM);
        list.add(POST_CASHIER);

        return list;
    }

    /**
     * 费用类型
     */
    public static final String EXPENSE_TYPE_TRAFFIC = "交通";
    public static final String EXPENSE_TYPE_FOOD = "餐饮";
    public static final String EXPENSE_TYPE_HOTEL = "住宿";
    public static final String EXPENSE_TYPE_WORK = "办公";

    /**
     * 报销的费用类型
     *
     * @return List
     */
    public static List<String> getExpenseType() {
        List<String> list = new ArrayList<>();
        list.add(EXPENSE_TYPE_TRAFFIC);
        list.add(EXPENSE_TYPE_FOOD);
        list.add(EXPENSE_TYPE_HOTEL);
        list.add(EXPENSE_TYPE_WORK);

        return list;
    }

    /**
     * 报销单状态
     */
    public static final String EXPENSE_CLAIM_CREATED = "新创建";
    public static final String EXPENSE_CLAIM_SUBMIT = "已提交";
    public static final String EXPENSE_CLAIM_APPROVED = "已审核";
    public static final String EXPENSE_CLAIM_BACK = "已打回";
    public static final String EXPENSE_CLAIM_TERMINATED = "已终止";
    public static final String EXPENSE_CLAIM_RECHECK = "待复审";
    public static final String EXPENSE_CLAIM_PAID = "已打款";

    // 审核额度
    public static final double AUDIT_LIMIT = 5000.00;

    /**
     * 报销单处理方式
     */
    public static final String DEAL_CREATE = "创建";
    public static final String DEAL_SUBMIT = "提交";
    public static final String DEAL_UPDATE = "修改";
    public static final String DEAL_BACK = "打回";
    public static final String DEAL_REJECT = "拒绝 ";
    public static final String DEAL_PASS = "通过";
    public static final String DEAL_PAID = "打款";
}
