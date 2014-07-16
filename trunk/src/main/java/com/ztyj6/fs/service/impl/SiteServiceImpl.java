package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.ztyj6.fs.dao.SiteMapper;
import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.SiteUser;
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

	/*
	 * 保存站点信息
	 * 
	 * @INput： Site 对象
	 * 
	 * @Return： null
	 */
	public Serializable save(Site o) {
		// TODO Auto-generated method stub
		try {
			siteMapper.insert(o);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * 根据对象的Id 删除一个对象
	 * 
	 * @Input Site 对象
	 * 
	 * @Return void
	 */
	public void delete(Site o) {
		// TODO Auto-generated method stub
		try {
			siteMapper.deleteByPrimaryKey(o.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 批量删除 site 表中的记录
	 * @Input: String 其中的 id 以 ， 隔开
	 * @Return： void
	 */
	public void delete(String ids) {
		// TODO Auto-generated method stub
		try {
			List<String> arrays = Arrays.asList(ids.split(","));
			siteMapper.deleteBatch(arrays);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(Site o) {
		// TODO Auto-generated method stub
		try {
			siteMapper.updateByPrimaryKeySelective(o);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    /*
     * 
     * 此方法 不实现 因为此方法无用
     * 
     */
	public void saveOrUpdate(Site o) throws Throwable {
		// TODO Auto-generated method stub    
	}

	public Site getById(Integer id) {
		// TODO Auto-generated method stub
		Site site = new Site();
		site = siteMapper.selectByPrimaryKey(id);
		return site;
	}

	public List<Site> getAll() {
		// TODO Auto-generated method stub
		return null;
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

	public DataGrid getByPageFilter(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long count() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveUserToSite(SiteUser siteUser) {
		// TODO Auto-generated method stub
		try{
			siteMapper.insertUserToSite(siteUser);		
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public DataGrid getAllUserInSiteByPage(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList siteUsers = (PageList) siteMapper.selectUserOfSiteByPage(pageBounds);
		dg.setRows(siteUsers);
		dg.setTotal(siteUsers.getPaginator().getTotalCount());
		return dg;
	}

	@Override
	public void deleteUserFromSiteByUserId(Integer id) {
		// TODO Auto-generated method stub
		try{
			siteMapper.deleteUserFromSiteByUserId(id);
		}catch(	Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void deleteBatchUserFromSite(String ids) {
		// TODO Auto-generated method stub
		try{
			List<String> arrays = Arrays.asList(ids.split(","));
			siteMapper.deleteBatch(arrays);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
