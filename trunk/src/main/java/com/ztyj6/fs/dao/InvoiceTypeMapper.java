package com.ztyj6.fs.dao;

import java.util.List;

import com.ztyj6.fs.model.InvoiceType;

public interface InvoiceTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(InvoiceType record);

    int insertSelective(InvoiceType record);

    InvoiceType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(InvoiceType record);

    int updateByPrimaryKey(InvoiceType record);
    
    List<InvoiceType> getInvoiceType();
    
}