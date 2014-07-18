package com.ztyj6.fs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.ISiteService;

@Controller
@RequestMapping("/siteController")
public class SiteController extends BaseController {
    private ISiteService siteService;

	public ISiteService getSiteService() {
		return siteService;
	}
    @Autowired
	public void setSiteService(ISiteService siteService) {
		this.siteService = siteService;
	}
    /*
     * 分页显示 
     * @Input: PageFilter 对象
     * @Return：DataGrid 对象
     */
    @ResponseBody
    @RequestMapping("/admin/getByPage")
    public DataGrid getByPage(PageFilter pageFilter){
    	try{
    		return siteService.getByPage(pageFilter);
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}
    }
    /*
     * 添加一个对象
     * @Input Site 对象
     * @Return Json 对象
     */
    @ResponseBody
    @RequestMapping("/admin/add")
    public Json add(Site site,HttpSession session){
    	String message ="";
    	Json json = new Json();
    	try{
    	   siteService.save(site);
    	   json.setSuccess(true);
    	   json.setObj(site);
    	   message = "添加成功";
    	   json.setMsg(message); 
    	}catch(Exception e){
    		message = "添加失败";
    		json.setMsg(message);
    		json.setSuccess(false);
    	}
    	return json;
    }
    /*
     * 删除一个对象
     * @Input Site对象
     * @Return Josn 对象
     */
    @ResponseBody
    @RequestMapping("/admin/delete")
    public Json delete(Site site,HttpSession session){
    	String msg = "";
    	Json json = new Json();
    	try{
    		siteService.delete(site);
    		json.setSuccess(true);
    		msg = "删除成功";
    		json.setMsg(msg);
    		json.setObj(site);
    	}catch(Exception e){
    		msg = "删除失败";
    		json.setMsg(msg);
    		json.setSuccess(false);
    	}
    	return json;
    }
    /*
     * 批量删除 site 对象
     */
    @ResponseBody
    @RequestMapping("/admin/deleteBatch")
    public Json deleteBatch(String ids){
    	String msg= "";
    	Json json = new Json();
    	try{
    		siteService.delete(ids);
    		msg = "批量删除成功";
    		json.setSuccess(true);
    		json.setMsg(msg);
    	}catch(Exception e){
    		msg = "批量删除失败";
    		json.setSuccess(false);
    		json.setMsg(msg);
    		e.printStackTrace();
    	}
    	return json;
    }
    /*
     * 更新 Site 对象
     */
    @ResponseBody
    @RequestMapping("/admin/update")
    public Json update(Site site,HttpSession session){
    	String msg = "";
    	Json json = new Json();
    	try{
    		siteService.update(site);
    		msg = "更新成功";
    	    json.setSuccess(true);
    	    json.setMsg(msg);
    	}catch(Exception e){
    		msg = "更新失败";
    		json.setSuccess(false);
    		json.setMsg(msg);
    		e.printStackTrace();
    	}
    	return json;
    }
    /*
     * 得到 一个 site 对象的详细信息
     */
    @ResponseBody
    @RequestMapping("/admin/getSiteInformationById")
    public Site getSiteinformationById(int id){
    	Site site = new Site();
    	try{
    		site = siteService.getById(id);
    	}catch(Exception e){
    		site = null;
    		e.printStackTrace();
    	}
    	return site;
    }
    
    /*
     * 向站点中 添加一个用户
     */
    @ResponseBody
    @RequestMapping("/admin/addUserToSite")
    public Json addUserToSite(int siteId,int userId,int postId,HttpSession session){
    	Json json = new Json();
    	String msg = "";
    	try{
    		siteService.saveUserToSite(siteId, userId, postId);
    		msg = "添加成功";
    		json.setSuccess(true);
    		json.setMsg(msg);
    	}catch(Exception e){
    		e.printStackTrace();
    		msg = "添加失败";
    		json.setSuccess(false);
    		json.setMsg(msg);
    	}
    	return json;
    }
    /*
     * 从站点中删除一个用户
     */
    @ResponseBody
    @RequestMapping("/admin/deleteUserFromSite")
    public Json deleteUserFromSite(int siteId,int userId){
    	Json json = new Json();
    	String msg = "";
    	try{
    		siteService.deleteUserFromSiteByUserId(siteId,userId);
    	    msg = "删除成功";
    	    json.setSuccess(true);
    	    json.setMsg(msg);
    	}catch(Exception e){
    		msg = "删除失败";
    		json.setSuccess(false);
    		json.setMsg(msg);
    		e.printStackTrace();
    	}
    	return json;
    }
    /*
     * 从站点中批量删除用户
     */
    @ResponseBody
    @RequestMapping("/admin/deleteBatchUserFromSite")
    public Json deleteBatchUserFromSite(int siteId,String userIds){
    	Json json = new Json();
    	String msg = "";
    	try{
    		siteService.deleteBatchUserFromSite(siteId,userIds);
    		msg = "批量删除成功";
    		json.setSuccess(true);
    		json.setMsg(msg);
    	}catch(Exception e){
    		msg = "批量删除失败";
    		json.setSuccess(false);
    		json.setMsg(msg);
    		e.printStackTrace();
    	}
    	return json;
    }
   
    /*
     * 分页显示  // 一定要先测试该方法
     * @Input: PageFilter 对象
     * @Return：DataGrid 对象
     */
    @ResponseBody
    @RequestMapping("/admin/getByPage")
    public DataGrid getUserOfSiteByPage(PageFilter pageFilter,int siteId){
    	try{
    		return siteService.getAllUserInSiteByPage(pageFilter,siteId);
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}
    }
}
