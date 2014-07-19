package com.ztyj6.fs.service;

import java.util.Map;

import com.ztyj6.fs.model.Site;

public interface ISiteService extends IBaseService<Site> {

	void saveUserSite(Map<String,Integer> map);

	void deleteUserSite(int siteId, int userId);

	void deleteBatchUserSite(int siteId, String ids);
}
