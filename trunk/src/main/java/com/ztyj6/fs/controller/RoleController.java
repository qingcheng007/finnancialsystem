package com.ztyj6.fs.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Resource;
import com.ztyj6.fs.model.Role;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.model.page.Tree;
import com.ztyj6.fs.service.IRoleService;
import com.ztyj6.fs.utils.IPUtil;

@Controller
@RequestMapping("/roleController")
public class RoleController extends BaseController {

	private IRoleService roleService;

	public IRoleService getRoleService() {
		return roleService;
	}

	@Autowired
	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}

	@RequestMapping("/admin/getByPage")
	@ResponseBody
	public DataGrid getByPage(PageFilter pageFilter) {
		return roleService.getByPage(pageFilter);
	}

	@RequestMapping("/admin/grant")
	@ResponseBody
	public Json grant(@RequestParam("roleId") Integer roleId,
			@RequestParam("ids") String ids) {
		Json j = new Json();
		try {
			roleService.grant(roleId, ids);
			j.setSuccess(true);
			j.setMsg("授权成功！");
		} catch (Exception e) {
			j.setMsg("授权失败！");
		}
		return j;
	}

	@ResponseBody
	@RequestMapping("/admin/addRole")
	public Json add(Role role, HttpSession session) {
		Json j = new Json();
		SecurityContext ctx = (SecurityContext) session
				.getAttribute("SPRING_SECURITY_CONTEXT");
		role.setCreateUserId(((User) (ctx.getAuthentication().getPrincipal()))
				.getId());
		try {
			roleService.save(role);
			j.setSuccess(true);
			j.setObj(role);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg("添加失败！");
		}
		return j;
	}

	@ResponseBody
	@RequestMapping("/admin/delete")
	public Json delete(String ids) {
		Json j = new Json();
		try {
			roleService.delete(ids);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("删除失败！");
		}
		return j;
	}

	@ResponseBody
	@RequestMapping("/admin/edit")
	public Json edit(Role role, HttpSession session) {
		Json j = new Json();
		SecurityContext ctx = (SecurityContext) session
				.getAttribute("SPRING_SECURITY_CONTEXT");
		role.setModifyUserId(((User) (ctx.getAuthentication().getPrincipal()))
				.getId());
		try {
			roleService.update(role);
			j.setSuccess(true);
			j.setObj(role);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg("编辑失败！");
		}
		return j;
	}

	@RequestMapping("/admin/getAllRoleTree")
	@ResponseBody
	public List<Tree> getAllRoleTree() {
		return roleService.getAllRoleTree();
	}

	@RequestMapping(value = "/admin/getByUserId", method = RequestMethod.GET)
	@ResponseBody
	public Json getByUserId(@RequestParam("userId") Integer userId) {
		Json j = new Json();
		try {
			List<Role> role = roleService.getByUserId(userId);
			j.setSuccess(true);
			j.setObj(role);
		} catch (Exception e) {
		}
		return j;
	}
}
