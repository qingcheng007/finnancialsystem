package com.ztyj6.fs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
    @RequestMapping("/admin/getByPage")
    @ResponseBody
    public DataGrid getByPage(PageFilter pageFilter){
    	try{
    		return siteService.getByPage(pageFilter);
    	}catch(Exception e){
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
    public Json delete(@RequestBody Site site,HttpSession session){
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
    	}
    	return json;
    }
   
}
