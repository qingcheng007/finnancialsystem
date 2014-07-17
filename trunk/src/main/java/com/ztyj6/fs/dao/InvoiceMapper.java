package com.ztyj6.fs.dao;

import java.util.List;

import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceKey;

public interface InvoiceMapper {
    int deleteByPrimaryKey(InvoiceKey key);

    int insert(Invoice record);

    int insertSelective(Invoice record);

    Invoice selectByPrimaryKey(InvoiceKey key);

    int updateByPrimaryKeySelective(Invoice record);

    int updateByPrimaryKey(Invoice record);
    
    int selectCount();
    
    List<Invoice> getInvoiceAll();
    
}