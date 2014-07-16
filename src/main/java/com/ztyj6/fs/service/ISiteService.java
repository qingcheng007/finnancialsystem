package com.ztyj6.fs.service;

import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.SiteUser;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;

public interface ISiteService extends IBaseService<Site> {
	 /*
     * 为站点关联一个员工
     */
    void saveUserToSite(SiteUser siteUser);
    /*
     * 查询站点中的所有员工
     */
    DataGrid getAllUserInSiteByPage(PageFilter pageFilter);
    /*
     *删除站点中的一个员工
     */
    void deleteUserFromSiteByUserId(Integer id);
    /*
     * 批量删除站点中的员工   输入参数是 站点中员工的 UserId
     */
    void deleteBatchUserFromSite(String ids);
}
