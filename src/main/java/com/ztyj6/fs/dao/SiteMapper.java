package com.ztyj6.fs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.Site;

public interface SiteMapper {

	int deleteByPrimaryKey(Integer id);

	void deleteBatch(List<String> ids);

	int insert(Site record);

	int insertSelective(Site record);

	Site selectByPrimaryKey(Integer id);

	List<Site> selectByPage(PageBounds pageBounds);

	int updateByPrimaryKeySelective(Site record);

	int updateByPrimaryKey(Site record);

	int insertUserSite(@Param("siteId") int siteId,
			@Param("userId") int userId, @Param("postId") int postId);

	List selectUserSiteByPage(PageBounds pageBounds, Integer siteId);

	void deleteUserSite(@Param("siteId") Integer siteId,
			@Param("userId") Integer userId);

	void deleteBatchUserSite(@Param("siteId") Integer siteId,
			@Param("ids") List<String> ids);
}