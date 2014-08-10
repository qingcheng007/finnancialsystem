package com.ztyj6.fs.dao;

import org.apache.ibatis.annotations.Param;

import com.ztyj6.fs.model.Balance;

public interface BalanceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Balance record);

    int insertSelective(Balance record);

    Balance selectByPrimaryKey(Integer id);
   
    int selectByMaxId();

    int updateByPrimaryKeySelective(Balance record);

    int updateByPrimaryKey(Balance record);
    
    Balance selectBalanceByUserId(@Param("id") Integer id);
}