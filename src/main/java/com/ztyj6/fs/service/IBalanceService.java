package com.ztyj6.fs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;

import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.model.page.Tree;

public interface IBalanceService extends IBaseService<Balance> {
	
	public int getByMaxId();

	public int add(Balance balance);

}
