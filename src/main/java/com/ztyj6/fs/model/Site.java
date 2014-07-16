package com.ztyj6.fs.model;

import java.util.Date;

public class Site {
  
    private Integer id;
    private String name;
    private String address;
    private Date createDate;
    private Integer userId;
    private String createPurpose;
    private String projectName;
    
    public Integer getId() {
        return id;
    }

   
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

   
    public String getAddress() {
        return address;
    }

    
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    
    public Date getCreateDate() {
        return createDate;
    }

    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    
    public Integer getUserId() {
        return userId;
    }

   
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

   
    public String getCreatePurpose() {
        return createPurpose;
    }

    
    public void setCreatePurpose(String createPurpose) {
        this.createPurpose = createPurpose == null ? null : createPurpose.trim();
    }

    
    public String getProjectName() {
        return projectName;
    }

    
    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }
}