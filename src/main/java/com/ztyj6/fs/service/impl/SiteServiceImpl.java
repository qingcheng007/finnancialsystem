package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.ztyj6.fs.dao.SiteMapper;
import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.ISiteService;
import com.ztyj6.fs.utils.PageFilterUtil;

@Service("siteService")
public class SiteServiceImpl implements ISiteService {

	private SiteMapper siteMapper;

	public SiteMapper getSiteMapper() {
		return siteMapper;
	}

	@Autowired
	public void setSiteMapper(SiteMapper siteMapper) {
		this.siteMapper = siteMapper;
	}

	public Serializable save(Site o) {
		// TODO Auto-generated method stub
		siteMapper.insert(o);
		return null;
	}

	public void delete(Site o) {
		// TODO Auto-generated method stub
		siteMapper.deleteByPrimaryKey(o.getId());
	}

	public void delete(String ids) {
		// TODO Auto-generated method stub

		List<String> arrays = Arrays.asList(ids.split(","));
		siteMapper.deleteBatch(arrays);

	}

	public void update(Site o) {
		// TODO Auto-generated method stub
		siteMapper.updateByPrimaryKeySelective(o);
	}

	public Site getById(Integer id) {
		// TODO Auto-generated method stub
		Site site = new Site();
		site = siteMapper.selectByPrimaryKey(id);
		return site;
	}

	public DataGrid getByPage(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList sites = (PageList) siteMapper.selectByPage(pageBounds);
		dg.setRows(sites);
		dg.setTotal(sites.getPaginator().getTotalCount());
		return dg;
	}

	public void saveUserSite(int siteId, int userId, int postId) {
		// TODO Auto-generated method stub
		siteMapper.insertUserSite(siteId, userId, postId);

	}


	public void deleteUserSite(int siteId, int userId) {
		// TODO Auto-generated method stub
		siteMapper.deleteUserSite(siteId, userId);
	}

	public void deleteBatchUserSite(int siteId, String ids) {
		// TODO Auto-generated method stub
		List<String> arrays = Arrays.asList(ids.split(","));
		siteMapper.deleteBatchUserSite(siteId, arrays);
	}

	public void saveOrUpdate(Site o) throws Throwable {
		// TODO Auto-generated method stub
	}

	public List<Site> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public DataGrid getByPageFilter(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long count() {
		// TODO Auto-generated method stub
		return null;
	}
}
