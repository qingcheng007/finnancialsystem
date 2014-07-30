package com.ztyj6.fs.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IBalanceService;
import com.ztyj6.fs.service.IUserService;
import com.ztyj6.fs.utils.IPUtil;

@Controller
@RequestMapping("/userController")
public class UserController extends BaseController {
	private IUserService userService;

	private IBalanceService balanceService;

	public IBalanceService getBalanceService() {
		return balanceService;
	}

	@Autowired
	public void setBalanceService(IBalanceService balanceService) {
		this.balanceService = balanceService;
	}

	public IUserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@ResponseBody
	@RequestMapping("/register")
	public Json register(User user, HttpServletRequest request) {
		Json j = new Json();
		user.setCreateIp(IPUtil.getIp(request));
		try {
			int code = ((Integer) userService.save(user)).intValue();
			if (code > 0) {
				j.setSuccess(true);
				j.setMsg("注册成功！");
			} else {
				if (code == 0)
					j.setMsg("用户名已存在！");
				else
					j.setMsg("注册失败！");
			}
		} catch (Exception e) {
			j.setMsg("注册失败！");
		}
		return j;
	}

	@RequestMapping("/admin/getByPageFilter")
	@ResponseBody
	public DataGrid getByPageFilter(PageFilter pageFilter) {
		try {
			return userService.getByPageFilter(pageFilter);
		} catch (Exception e) {
			return null;
		}
	}

	@ResponseBody
	@RequestMapping("/admin/geetById")
	public DataGrid geetById(PageFilter pageFilter, Integer id,
			HttpServletRequest request) {
		int myId = Integer.parseInt(request.getParameter("id"));
		try {
			return userService.getByIdPage(pageFilter, myId);
		} catch (Exception e) {
			return null;
		}
	}

	@ResponseBody
	@RequestMapping("/admin/add")
	public Json add(User user, Balance balance, HttpServletRequest request) {
		balanceService.add(balance);
		int Id = balanceService.getByMaxId();
		user.setBalanceId(Id);
		Json j = new Json();
		user.setCreateIp(IPUtil.getIp(request));
		try {
			int code = ((Integer) userService.save(user)).intValue();
			if (code > 0) {
				j.setSuccess(true);
				j.setObj(user);
				j.setMsg("添加成功！");
			} else {
				if (code == 0)
					j.setMsg("用户名已存在！");
				else
					j.setMsg("添加失败！");
			}
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
			userService.delete(ids);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("删除失败！");
		}
		return j;
	}

	@ResponseBody
	@RequestMapping("/admin/edit")
	public Json edit(User user) {

		Json j = new Json();
		try {
			userService.update(user);
			j.setSuccess(true);
			j.setObj(user);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg("编辑失败！");
		}
		return j;
	}

	@ResponseBody
	@RequestMapping("/admin/transfer")
	public Json transfer(User user, Balance balance, HttpServletRequest request) {
		int userid = user.getId();
		
		int balanceid=user.getBalanceId();
		
		Balance blance = userService.getBalanceById(userid);
		
		Double money1 = Double.parseDouble(request.getParameter("money"));
		
		System.out.print("钱1"+money1);
		
		BigDecimal money2 = BigDecimal.valueOf(money1);
		
		System.out.print("钱2"+money2);
		
		BigDecimal money3 = money2.add(blance.getAvailable());
		
		System.out.print("钱3"+money3);
		
        blance.setId(balanceid);
        
		blance.setAvailable(money3);
		
		Json j = new Json();
		try {
			balanceService.updatebalance(blance);
			j.setSuccess(true);
			j.setObj(user);
			j.setMsg("转账成功！");
		} catch (Exception e) {
			j.setMsg("转账失败！");
		}
		return j;
	}

	
	
	@RequestMapping("/admin/grant")
	@ResponseBody
	public Json grant(@RequestParam("userId") Integer userId,
			@RequestParam("ids") String ids) {
		Json j = new Json();
		try {
			userService.grant(userId, ids);
			j.setSuccess(true);
			j.setMsg("授权成功！");
		} catch (Exception e) {
			j.setMsg("授权失败！");
		}
		return j;
	}

}
