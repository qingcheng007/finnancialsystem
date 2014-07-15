package com.ztyj6.fs.dao;

import com.ztyj6.fs.model.InvoiceDetails;

public interface InvoiceDetailsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(InvoiceDetails record);

    int insertSelective(InvoiceDetails record);

    InvoiceDetails selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(InvoiceDetails record);

    int updateByPrimaryKey(InvoiceDetails record);
    
    int selectMaxID();
}