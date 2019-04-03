package com.csthink.oa.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class ExpenseClaim {

    private Integer id;

    private String cause;

    private Integer creator;

    private Integer nextDealEmp;

    private BigDecimal totalAmount;

    private String status;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date createTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date updateTime;

    private Employee creatorEmployee;

    private Employee dealEmployee;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Integer getNextDealEmp() {
        return nextDealEmp;
    }

    public void setNextDealEmp(Integer nextDealEmp) {
        this.nextDealEmp = nextDealEmp;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Employee getCreatorEmployee() {
        return creatorEmployee;
    }

    public void setCreatorEmployee(Employee creatorEmployee) {
        this.creatorEmployee = creatorEmployee;
    }

    public Employee getDealEmployee() {
        return dealEmployee;
    }

    public void setDealEmployee(Employee dealEmployee) {
        this.dealEmployee = dealEmployee;
    }

    @Override
    public String toString() {
        return "ExpenseClaim{" +
                "id=" + id +
                ", cause='" + cause + '\'' +
                ", creator=" + creator +
                ", nextDealEmp=" + nextDealEmp +
                ", totalAmount=" + totalAmount +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", creatorEmployee=" + creatorEmployee +
                ", dealEmployee=" + dealEmployee +
                '}';
    }
}
