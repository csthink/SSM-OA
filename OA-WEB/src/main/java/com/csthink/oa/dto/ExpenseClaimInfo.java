package com.csthink.oa.dto;

import com.csthink.oa.entity.ExpenseClaim;
import com.csthink.oa.entity.ExpenseClaimItem;

import java.util.List;


public class ExpenseClaimInfo {

    private ExpenseClaim expenseClaim;

    private List<ExpenseClaimItem> items;

    public ExpenseClaim getExpenseClaim() {
        return expenseClaim;
    }

    public void setExpenseClaim(ExpenseClaim expenseClaim) {
        this.expenseClaim = expenseClaim;
    }

    public List<ExpenseClaimItem> getItems() {
        return items;
    }

    public void setItems(List<ExpenseClaimItem> items) {
        this.items = items;
    }
}
