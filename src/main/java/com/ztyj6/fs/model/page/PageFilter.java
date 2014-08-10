package com.ztyj6.fs.model.page;

import java.util.Date;

import com.ztyj6.fs.utils.SqlUtil;

public class PageFilter {
	private int page;// 当前�?
	private int rows;// 每页显示记录�?
	private String sort;// 排序字段
	private String order = "asc";// asc/desc
	private String keyword;
	private String content;
	private String projectName;
	private String proverState;
	private String auditor1State;
	private String auditor2State;
	private String dearerState;
	private int invoiceType;
	private Date startTime;
	private Date endTime;
	
	public String getProverState() {
		return proverState;
	}

	public void setProverState(String proverState) {
		this.proverState = proverState;
	}

	public String getAuditor1State() {
		return auditor1State;
	}

	public void setAuditor1State(String auditor1State) {
		this.auditor1State = auditor1State;
	}


	public int getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(int invoiceType) {
		this.invoiceType = invoiceType;
	}


	public String getAuditor2State() {
		return auditor2State;
	}

	public void setAuditor2State(String auditor2State) {
		this.auditor2State = auditor2State;
	}

	public String getDearerState() {
		return dearerState;
	}

	public void setDearerState(String dearerState) {
		this.dearerState = dearerState;
	}



	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = SqlUtil.likeEscapeH(keyword);
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
}
