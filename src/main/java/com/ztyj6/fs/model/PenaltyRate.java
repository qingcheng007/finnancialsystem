package com.ztyj6.fs.model;

import java.math.BigDecimal;
import java.util.Date;

public class PenaltyRate {
    private Integer id;

    private BigDecimal rate;

    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}