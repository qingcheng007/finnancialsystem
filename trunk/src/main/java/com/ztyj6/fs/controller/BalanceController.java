package com.ztyj6.fs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.service.IBalanceService;
import com.ztyj6.fs.model.User;

@Controller
@RequestMapping("/balanceController")
public class BalanceController extends BaseController {

	private IBalanceService balanceService;

	public IBalanceService getBalanceService() {
		return balanceService;
	}

	@Autowired
	public void setBalanceService(IBalanceService balanceService) {
		this.balanceService = balanceService;
	}

	@ResponseBody
	@RequestMapping("/admin/getById")
	public Balance getById(Integer id, HttpSession session) {
		SecurityContext ctx = (SecurityContext) session
				.getAttribute("SPRING_SECURITY_CONTEXT");
		try {
			return balanceService.getBalanceById(((User) (ctx
					.getAuthentication().getPrincipal())).getId());
		} catch (Exception e) {
			return null;
		}
	}
}
