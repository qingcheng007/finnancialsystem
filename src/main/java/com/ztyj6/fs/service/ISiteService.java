package com.ztyj6.fs.service;

import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;

public interface ISiteService extends IBaseService<Site> {

	void saveUserSite(int siteId, int userId, int postId);

	void deleteUserSite(int siteId, int userId);

	void deleteBatchUserSite(int siteId, String ids);
}
