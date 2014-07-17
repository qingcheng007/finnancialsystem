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

	/*
	 * 保存站点信息
	 * 
	 * @INput： Site 对象
	 * 
	 * @Return： null
	 */
	public Serializable save(Site o) {
		// TODO Auto-generated method stub
		siteMapper.insert(o);
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
		siteMapper.deleteByPrimaryKey(o.getId());
	}

	/*
	 * 批量删除 site 表中的记录
	 * @Input: String 其中的 id 以 ， 隔开
	 * @Return： void
	 */
	public void delete(String ids) {
		// TODO Auto-generated method stub
		
		List<String> arrays = Arrays.asList(ids.split(","));
		siteMapper.deleteBatch(arrays);
		
	}
  /*
   * 更新站点信息
   * 
   */
	public void update(Site o) {
		// TODO Auto-generated method stub
		siteMapper.updateByPrimaryKeySelective(o);
	}
	
    /*
     * 
     * 取得单个站点的基本详细信息
     */
	public Site getById(Integer id) {
		// TODO Auto-generated method stub
		Site site = new Site();
		site = siteMapper.selectByPrimaryKey(id);
		return site;
	}
   /*
    *分页 显示站点的信息 
    * 
    */
	public DataGrid getByPage(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList sites = (PageList) siteMapper.selectByPage(pageBounds);
		dg.setRows(sites);
		dg.setTotal(sites.getPaginator().getTotalCount());
		return dg;
	}
	
	/*
	 * 向站点中添加 用户
	 * 
	 */
	@Override
	public void saveUserToSite(int siteId,int userId,int postId) {
		// TODO Auto-generated method stub
        siteMapper.insertUserToSite(siteId, userId, postId);		
	}
   /*
    * 分页显示 站点中的所有用户
    */
	@Override
	public DataGrid getAllUserInSiteByPage(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();	
		
		return dg;
	}
    /*
     * 通过 userId 删除站点中的某个用户
     */
	@Override
	public void deleteUserFromSiteByUserId(Integer id) {
		// TODO Auto-generated method stub
		siteMapper.deleteUserFromSiteByUserId(id);
	}
    /*
     * 批量删除站点中的用户
     */
	@Override
	public void deleteBatchUserFromSite(String ids) {
		// TODO Auto-generated method stub
		List<String> arrays = Arrays.asList(ids.split(","));
		siteMapper.deleteBatch(arrays);
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
