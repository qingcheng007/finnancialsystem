package com.ztyj6.fs.model;

public class AuditState {
    private Integer id;

    private Integer operator;

    private Integer prover;

    private Integer auditor1;

    private Integer auditor2;

    private Integer dearer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOperator() {
        return operator;
    }

    public void setOperator(Integer operator) {
        this.operator = operator;
    }

    public Integer getProver() {
        return prover;
    }

    public void setProver(Integer prover) {
        this.prover = prover;
    }

    public Integer getAuditor1() {
        return auditor1;
    }

    public void setAuditor1(Integer auditor1) {
        this.auditor1 = auditor1;
    }

    public Integer getAuditor2() {
        return auditor2;
    }

    public void setAuditor2(Integer auditor2) {
        this.auditor2 = auditor2;
    }

    public Integer getDearer() {
        return dearer;
    }

    public void setDearer(Integer dearer) {
        this.dearer = dearer;
    }
}