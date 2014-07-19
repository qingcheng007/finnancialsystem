package com.ztyj6.fs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceKey;

public interface InvoiceMapper {
    int deleteByPrimaryKey(InvoiceKey key);

    int deleteByPrimaryID(@Param("id")int Id);
    
    int insert(Invoice record);

    int insertSelective(Invoice record);

    Invoice selectByPrimaryKey(InvoiceKey key);
    
    //待测试
    Invoice selectByPrimaryID(@Param("id")int Id);
    
    int updateByPrimaryKeySelective(Invoice record);

    int updateByPrimaryKey(Invoice record);
    
    int selectInvoiceCount();
    
    List<Invoice> getInvoiceAll();
    
}