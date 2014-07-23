package com.ztyj6.fs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceKey;

import com.ztyj6.fs.model.page.PageFilter;

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
    
    List selectByFilter(@Param("pageFilter")PageFilter pageFilter,PageBounds pageBounds);
    
    List selectByPage(PageBounds pageBounds);
    
}