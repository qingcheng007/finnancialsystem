package com.ztyj6.fs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
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

	@ResponseBody
	@RequestMapping("/admin/getByPage")
	public DataGrid getByPage(PageFilter pageFilter) {
		try {
			return siteService.getByPage(pageFilter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@ResponseBody
	@RequestMapping("/admin/add")
	public Json add(Site site, HttpSession session) {
		Json json = new Json();
		int flag = 0;
		try {
			flag = siteService.isExistSite(site.getName());
			if(flag==0){
				site.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())));
				siteService.save(site);
				json.setSuccess(true);
				json.setObj(site);
				json.setMsg("添加成功");
			}else{
				json.setMsg("添加失败，站点已经存在");
			}
			
		} catch (Exception e) {
			json.setMsg( "添加失败");
		    e.printStackTrace();
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/delete")
	public Json delete(String ids) {
		Json json = new Json();
		try {
			siteService.delete(ids);
			json.setSuccess(true);
			json.setMsg("删除成功");
		} catch (Exception e) {
			json.setMsg("删除失败");
			e.printStackTrace();
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/edit")
	public Json edit(Site site, HttpSession session) {
		Json json = new Json();
		try {
			siteService.update(site);
			json.setSuccess(true);
			json.setObj(site);
			json.setMsg("更新成功");
		} catch (Exception e) {
			json.setMsg("更新失败");
			e.printStackTrace();
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/getSiteInformation")
	public Site getSiteinformation(int siteId) {
		Site site = new Site();
		try {
			site = siteService.getById(siteId);
		} catch (Exception e) {
			site = null;
			e.printStackTrace();
		}
		return site;
	}

	@ResponseBody
	@RequestMapping("/admin/addUserSite")
	public Json addUserSite(HttpServletRequest request,
			HttpSession session) {
		Json json = new Json();
		int flag = 0;
		int userId =Integer.parseInt(request.getParameter("userId"));
		int siteId = (int)session.getAttribute("siteId");
		int postId = Integer.parseInt(request.getParameter("postId"));
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("siteId", siteId);
		map.put("userId", userId);
		map.put("postId", postId);
		try {
			flag = siteService.isExistUserInSite(userId, siteId);
			if(flag == 0){
				siteService.saveUserSite(map);
				json.setSuccess(true);
				json.setMsg("添加成功");
			}else{
				json.setMsg("该用户已经存在于站点中");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("添加失败");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/deleteUserSite")
	public Json deleteUserSite(HttpServletRequest request,HttpSession session) {
		//从getUserInformationOfOneSiteByPage中为siteId完成赋值
		int siteId = (int)session.getAttribute("siteId");
		String userIds = request.getParameter("userId");
        int userId = Integer.parseInt(userIds);
		int flag = 0;
		
		Json json = new Json();
		try {
			flag = siteService.isExistUserInSite(userId, siteId);
			if(flag > 0){
			siteService.deleteBatchUserSite(siteId, userIds);
			json.setSuccess(true);
			json.setMsg("删除成功");
			}else{
				json.setMsg("删除失败，删除的对象不存在");
			}
		} catch (Exception e) {
			json.setMsg("删除失败");
			e.printStackTrace();
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/getUserInformationOfOneSiteByPage")
	public DataGrid getUserInformationOfOneSiteByPage(PageFilter pageFilter
		,HttpServletRequest request,HttpSession session) {
		int siteId = Integer.parseInt(request.getParameter("siteId"));
		session.setAttribute("siteId",siteId);
		try {
			return siteService.getUserInformationOfOneSiteByPage(pageFilter,
					siteId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
