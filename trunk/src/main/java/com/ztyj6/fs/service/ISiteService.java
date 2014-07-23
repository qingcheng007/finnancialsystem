package com.ztyj6.fs.service;

import java.util.Map;

import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;

public interface ISiteService extends IBaseService<Site> {

	void saveUserSite(Map<String, Integer> map);

	void deleteUserSite(int siteId, int userId);

	void deleteBatchUserSite(int siteId, String ids);

	DataGrid getUserInformationOfOneSiteByPage(PageFilter pageFilter, int siteId);
	
	int isExistSite(String siteName);
	
	int isExistUserInSite(int userId,int siteId);
}
