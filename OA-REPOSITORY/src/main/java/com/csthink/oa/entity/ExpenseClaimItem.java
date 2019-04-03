package com.csthink.oa.entity;

import java.math.BigDecimal;

public class ExpenseClaimItem {

    private Integer id;

    private Integer expenseClaimId;

    private String expenseType;

    private BigDecimal amount;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getExpenseClaimId() {
        return expenseClaimId;
    }

    public void setExpenseClaimId(Integer expenseClaimId) {
        this.expenseClaimId = expenseClaimId;
    }

    public String getExpenseType() {
        return expenseType;
    }

    public void setExpenseType(String expenseType) {
        this.expenseType = expenseType;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "ExpenseClaimItem{" +
                "id=" + id +
                ", expenseClaimId=" + expenseClaimId +
                ", expenseType='" + expenseType + '\'' +
                ", amount=" + amount +
                ", remark='" + remark + '\'' +
                '}';
    }
}
