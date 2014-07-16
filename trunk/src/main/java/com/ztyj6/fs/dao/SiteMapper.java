package com.ztyj6.fs.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.SiteUser;

public interface SiteMapper {
   
    int deleteByPrimaryKey(Integer id);
    /*
     * 批量删除站点基本信息表中的站点记录 （暂未实现）
     */
    void deleteBatch(List<String> ids);
    /*
     * 向站点基本信息表中添加一条记录
     */
    int insert(Site record);
    /*
     * 向站点基本信息表中添加一条记录
     */
    int insertSelective(Site record);
    /*
     * 通过 Id 查找站点对象
     */
    Site selectByPrimaryKey(Integer id); 
   
    
    List<Site> selectByPage(PageBounds pageBounds);
    
    /*
     * 更新站点中的信息
     */
    int updateByPrimaryKeySelective(Site record);
    /*
     * 更新站点中的信息
     */
    int updateByPrimaryKey(Site record);
    
    
    /*
     * 为站点关联一个员工
     */
    int insertUserToSite(SiteUser siteUser);
    /*
     * 查询站点中的所有员工  
     */
    List<SiteUser> selectUserOfSiteByPage(PageBounds pageBounds);
    /*
     *删除站点中的一个员工
     */
    void deleteUserFromSiteByUserId(Integer id);
    /*
     * 批量删除站点中的员工   输入参数是 站点中员工的 UserId
     */
    void deleteBatchUserFromSite(List<String> ids);
}