package com.ztyj6.fs.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.Site;

public interface SiteMapper {
   
    int deleteByPrimaryKey(Integer id);
    /*
     * 批量删除站点基本信息表中的站点记录 （暂未实现）
     */
    void deleteBatch(List ids);

   
    int insert(Site record);

   
    int insertSelective(Site record);

   
    Site selectByPrimaryKey(Integer id);
    
    List<Site> selectByPage(PageBounds pageBounds);
    
    int updateByPrimaryKeySelective(Site record);

   
    int updateByPrimaryKey(Site record);
}