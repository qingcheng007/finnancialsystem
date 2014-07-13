package com.ztyj6.fs.model;

public class AuditState {
    private Integer id;

    private Boolean operator;

    private Boolean prover;

    private Boolean auditor1;

    private Boolean auditor2;

    private Boolean dearer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getOperator() {
        return operator;
    }

    public void setOperator(Boolean operator) {
        this.operator = operator;
    }

    public Boolean getProver() {
        return prover;
    }

    public void setProver(Boolean prover) {
        this.prover = prover;
    }

    public Boolean getAuditor1() {
        return auditor1;
    }

    public void setAuditor1(Boolean auditor1) {
        this.auditor1 = auditor1;
    }

    public Boolean getAuditor2() {
        return auditor2;
    }

    public void setAuditor2(Boolean auditor2) {
        this.auditor2 = auditor2;
    }

    public Boolean getDearer() {
        return dearer;
    }

    public void setDearer(Boolean dearer) {
        this.dearer = dearer;
    }
}