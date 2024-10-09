
package com.users;

public class Bill {
    private String custId;
    private String monthYear;
    private double amount;
    private String paidStatus;

    public Bill(String custId, String monthYear, double amount, String paidStatus) {
        this.custId = custId;
        this.monthYear = monthYear;
        this.amount = amount;
        this.paidStatus = paidStatus;
    }

    // Getters
    public String getCustId() { return custId; }
    public String getMonthYear() { return monthYear; }
    public double getAmount() { return amount; }
    public String getPaidStatus() { return paidStatus; }
}
