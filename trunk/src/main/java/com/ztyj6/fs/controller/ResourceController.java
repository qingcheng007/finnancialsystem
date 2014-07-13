package com.ztyj6.fs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.Request;

import com.ztyj6.fs.model.Resource;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.model.page.Tree;
import com.ztyj6.fs.service.IResourceService;

@Controller
@RequestMapping("/resourceController")
public class ResourceController extends BaseController {

	private IResourceService resourceService;
	
	public IResourceService getResourceService() {
		return resourceService;
	}

	@Autowired
	public void setResourceService(IResourceService resourceService) {
		this.resourceService = resourceService;
	}

	@RequestMapping("/admin/getMenuTree")
	@ResponseBody
	public List<Tree> getMenuTree(Integer id,HttpSession session) {
		return resourceService.getMenuTree(id);
	}
	
	@RequestMapping("/admin/getAllMenuTree")
	@ResponseBody
	public List<Tree> getAllMenuTree() {
		return resourceService.getAllMenuTree(null);
	}
	
	@RequestMapping(value="/admin/getByRoleId",method=RequestMethod.GET)
	@ResponseBody
	public Json getByRoleId(@RequestParam("roleId")Integer roleId) {
		Json j = new Json();
		try {
			List<Resource> resources =  resourceService.getByRoleId(roleId);
			j.setSuccess(true);
			j.setObj(resources);
		} catch (Exception e) {
		}
		return j;
	}
}
