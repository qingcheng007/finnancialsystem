package com.ztyj6.fs.model;

import java.math.BigDecimal;
import java.util.Date;

public class Invoice {
    private Date createDate;

    private Date occurDate;

    private String content;

    private BigDecimal money;

    private BigDecimal penalty;

    private String description;

    private String projectName;

    private String photoUrl;

    private String remark;
    
    private InvoiceDetails invoiceDetails;
    
    private InvoiceType invoiceType;
    
    private AuditState auditState;
    
    private String operatorName;
    
    private String proverName;
    
    private String auditor1Name;
    
    private String auditor2Name;
    
    private String dearerName;
    private Integer auditStateId;

    private Integer auditor1Id;

    private Integer auditor2Id;

    private Integer dearerId;

    private Integer id;

    private Integer invoiceDetailsId;

    private Integer invoiceTypeId;

    private Integer operatorId;

    private Integer proverId;

    public Integer getAuditStateId() {
        return auditStateId;
    }

    public void setAuditstateId(Integer auditStateId) {
        this.auditStateId = auditStateId;
    }

    public Integer getAuditor1Id() {
        return auditor1Id;
    }

    public void setAuditor1Id(Integer auditor1Id) {
        this.auditor1Id = auditor1Id;
    }

    public Integer getAuditor2Id() {
        return auditor2Id;
    }

    public void setAuditor2Id(Integer auditor2Id) {
        this.auditor2Id = auditor2Id;
    }

    public Integer getDearerId() {
        return dearerId;
    }

    public void setDearerId(Integer dearerId) {
        this.dearerId = dearerId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInvoiceDetailsId() {
        return invoiceDetailsId;
    }

    public void setInvoiceDetailsId(Integer invoiceDetailsId) {
        this.invoiceDetailsId = invoiceDetailsId;
    }

    public Integer getInvoiceTypeId() {
        return invoiceTypeId;
    }

    public void setInvoiceTypeId(Integer invoiceTypeId) {
        this.invoiceTypeId = invoiceTypeId;
    }

    public Integer getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    public Integer getProverId() {
        return proverId;
    }

    public void setProverId(Integer proverId) {
        this.proverId = proverId;
    }
 

    public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public String getProverName() {
		return proverName;
	}

	public void setProverName(String proverName) {
		this.proverName = proverName;
	}

	public String getAuditor1Name() {
		return auditor1Name;
	}

	public void setAuditor1Name(String auditor1Name) {
		this.auditor1Name = auditor1Name;
	}

	public String getAuditor2Name() {
		return auditor2Name;
	}

	public void setAuditor2Name(String auditor2Name) {
		this.auditor2Name = auditor2Name;
	}

	public String getDearerName() {
		return dearerName;
	}

	public void setDearerName(String dearerName) {
		this.dearerName = dearerName;
	}

	public AuditState getAuditState() {
		return auditState;
	}

	public void setAuditState(AuditState auditState) {
		this.auditState = auditState;
	}

	public InvoiceDetails getInvoiceDetails() {
		return invoiceDetails;
	}

	public void setInvoiceDetails(InvoiceDetails invoiceDetails) {
		this.invoiceDetails = invoiceDetails;
	}

	public InvoiceType getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(InvoiceType invoiceType) {
		this.invoiceType = invoiceType;
	}

	

	public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getOccurDate() {
        return occurDate;
    }

    public void setOccurDate(Date occurDate) {
        this.occurDate = occurDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getPenalty() {
        return penalty;
    }

    public void setPenalty(BigDecimal penalty) {
        this.penalty = penalty;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl == null ? null : photoUrl.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}