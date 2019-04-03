package com.csthink.oa.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ExpenseClaimRecord {

    private Integer id;

    private Integer expenseClaimId;

    private Integer dealEmp;

    private String dealType;

    private String dealResult;

    private String remark;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date dealTime;

    private Employee dealEmployee;

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

    public Integer getDealEmp() {
        return dealEmp;
    }

    public void setDealEmp(Integer dealEmp) {
        this.dealEmp = dealEmp;
    }

    public String getDealType() {
        return dealType;
    }

    public void setDealType(String dealType) {
        this.dealType = dealType;
    }

    public String getDealResult() {
        return dealResult;
    }

    public void setDealResult(String dealResult) {
        this.dealResult = dealResult;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    public Employee getDealEmployee() {
        return dealEmployee;
    }

    public void setDealEmployee(Employee dealEmployee) {
        this.dealEmployee = dealEmployee;
    }

    @Override
    public String toString() {
        return "ExpenseClaimRecord{" +
                "id=" + id +
                ", expenseClaimId=" + expenseClaimId +
                ", dealEmp=" + dealEmp +
                ", dealType='" + dealType + '\'' +
                ", dealResult='" + dealResult + '\'' +
                ", remark='" + remark + '\'' +
                ", dealTime=" + dealTime +
                ", dealEmployee=" + dealEmployee +
                '}';
    }
}
