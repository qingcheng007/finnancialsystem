package com.ztyj6.fs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.Invoice;


import com.ztyj6.fs.model.page.PageFilter;

public interface InvoiceMapper {
    int deleteByPrimaryKey(Invoice key);

    int deleteByPrimaryID(@Param("id")int Id);
    
    int insert(Invoice record);

    int insertSelective(Invoice record);

    Invoice selectByPrimaryKey(Invoice key);
    
    //待测试
    Invoice selectByPrimaryID(@Param("id")int Id);
    
    int updateByPrimaryKeySelective(Invoice record);

    int updateByPrimaryKey(Invoice record);
    
    int selectInvoiceCount();
    
    List<Invoice> getInvoiceAll();
    
    List selectByFilter(@Param("pageFilter")PageFilter pageFilter,PageBounds pageBounds);
    
    List selectByPage(@Param("pageFilter")PageFilter pageFilter,PageBounds pageBounds, int id);

    List selectPageById(@Param("pageFilter")PageFilter pageFilter,PageBounds pageBounds, int id);
    
    List selectAllInvoice(@Param("pageFilter")PageFilter pageFilter,PageBounds pageBounds);
    
	void deleteBatch(List<String> ids);
	
    
}