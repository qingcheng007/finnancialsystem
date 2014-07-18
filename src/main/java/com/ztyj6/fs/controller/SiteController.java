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
		String message = "";
		Json json = new Json();
		try {
			siteService.save(site);
			json.setSuccess(true);
			json.setObj(site);
			message = "添加成功";
			json.setMsg(message);
		} catch (Exception e) {
			message = "添加失败";
			json.setMsg(message);
			json.setSuccess(false);
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/admin/delete")
	public Json delete(String ids) {
		String msg = "";
		Json json = new Json();
		try {
			siteService.delete(ids);
			msg = "删除成功";
			json.setSuccess(true);
			json.setMsg(msg);
		} catch (Exception e) {
			msg = "删除失败";
			json.setSuccess(false);
			json.setMsg(msg);
			e.printStackTrace();
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/edit")
	public Json edit(Site site, HttpSession session) {
		String msg = "";
		Json json = new Json();
		try {
			siteService.update(site);
			msg = "更新成功";
			json.setSuccess(true);
			json.setMsg(msg);
		} catch (Exception e) {
			msg = "更新失败";
			json.setSuccess(false);
			json.setMsg(msg);
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
	public Json addUserSite(int siteId, int userId, int postId,
			HttpSession session) {
		Json json = new Json();
		String msg = "";
		try {
			siteService.saveUserSite(siteId, userId, postId);
			msg = "添加成功";
			json.setSuccess(true);
			json.setMsg(msg);
		} catch (Exception e) {
			e.printStackTrace();
			msg = "添加失败";
			json.setSuccess(false);
			json.setMsg(msg);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/deleteUserSite")
	public Json deleteUserSite(int siteId, String userIds) {
		Json json = new Json();
		String msg = "";
		try {
			siteService.deleteBatchUserSite(siteId, userIds);
			msg = "批量删除成功";
			json.setSuccess(true);
			json.setMsg(msg);
		} catch (Exception e) {
			msg = "批量删除失败";
			json.setSuccess(false);
			json.setMsg(msg);
			e.printStackTrace();
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/getUserSiteByPage")
	public DataGrid getUserSiteByPage(PageFilter pageFilter, int siteId) {
		try {
			return siteService.getAllUserSiteByPage(pageFilter, siteId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
