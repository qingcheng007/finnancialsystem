package com.ztyj6.fs.model.page;

import java.util.Date;

import com.ztyj6.fs.utils.SqlUtil;

public class PageFilter {
	private int page;// 当前�?
	private int rows;// 每页显示记录�?
	private String sort;// 排序字段
	private String order = "asc";// asc/desc
	private String keyword;
	private Date startTime;
	private Date endTime;

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
