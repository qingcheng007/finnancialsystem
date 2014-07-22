package com.ztyj6.fs.model;

public class SiteUserPost {
	private int siteId;
	private String siteName;
	private int userId;
	private String userName;
	private String realName;
	private String phone;
	private String email;
	private int balanceId;
	private String postName;

	public SiteUserPost() {
		super();
	}

	public SiteUserPost(int siteId, String siteName, int userId,
			String userName, String realName, String phone, String email,
			int balanceId, String postName) {
		super();
		this.siteId = siteId;
		this.siteName = siteName;
		this.userId = userId;
		this.userName = userName;
		this.realName = realName;
		this.phone = phone;
		this.email = email;
		this.balanceId = balanceId;
		this.postName = postName;
	}

	public int getSiteId() {
		return siteId;
	}

	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getBalanceId() {
		return balanceId;
	}

	public void setBalanceId(int balanceId) {
		this.balanceId = balanceId;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

}
