package com.ztyj6.fs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.service.IBalanceService;

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
	public Balance getById(@RequestParam("id") Integer id,
			HttpServletRequest request) {
		try {
			return  balanceService.getBalanceById(id);
		} catch (Exception e) {
			return null;
		}
	}
}
