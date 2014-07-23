package com.ztyj6.fs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.User;

public interface SiteMapper {

	int deleteByPrimaryKey(Integer id);

	void deleteBatch(List<String> ids);

	int insert(Site record);

	int insertSelective(Site record);
    
	int countBySiteName(String name); 
	
	Site selectByPrimaryKey(Integer id);

	List<Site> selectByPage(PageBounds pageBounds);

	int updateByPrimaryKeySelective(Site record);

	int updateByPrimaryKey(Site record);

	int insertUserSite(@Param("map") Map<String, Integer> map);

	void deleteUserSite(@Param("siteId") Integer siteId,
			@Param("userId") Integer userId);

	void deleteBatchUserSite(@Param("siteId") Integer siteId,
			@Param("ids") List<String> ids);

	List<Site> selectUsersByPage(@Param("pageBounds") PageBounds pageBounds,
			@Param("siteId") Integer siteId);
	
	int countByUserIdAndSiteId(@Param("userId") int userId,@Param("siteId") int siteId);
}