package com.ztyj6.fs.model;

import java.math.BigDecimal;

import java.io.Serializable;

public class  Balance implements Serializable  {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private BigDecimal available;

    private BigDecimal frozen;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getAvailable() {
        return available;
    }

    public void setAvailable(BigDecimal available) {
        this.available = available;
    }

    public BigDecimal getFrozen() {
        return frozen;
    }

    public void setFrozen(BigDecimal frozen) {
        this.frozen = frozen;
    }
}