package com.ztyj6.fs.dao;

import com.ztyj6.fs.model.AuditState;

public interface AuditStateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AuditState record);

    int insertSelective(AuditState record);

    AuditState selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AuditState record);

    int updateByPrimaryKey(AuditState record);
}