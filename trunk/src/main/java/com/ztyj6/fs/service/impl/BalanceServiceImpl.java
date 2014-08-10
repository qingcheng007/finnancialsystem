package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ztyj6.fs.dao.BalanceMapper;
import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IBalanceService;

@Service("balanceService")
public class BalanceServiceImpl implements IBalanceService {
	private BalanceMapper balanceMapper;

	public BalanceMapper getBalanceMapper() {
		return balanceMapper;
	}

	@Autowired
	public void setBalanceMapper(BalanceMapper balanceMapper) {
		this.balanceMapper = balanceMapper;
	}

	@Override
	public int getByMaxId() {
		// TODO Auto-generated method stub
		return balanceMapper.selectByMaxId();

	}


	@Override
	public void delete(Balance o) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String ids) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updatebalance(Balance o) {
		// TODO Auto-generated method stub
  return balanceMapper.updateByPrimaryKeySelective(o);
	}

	@Override
	public void saveOrUpdate(Balance o) throws Throwable {
		// TODO Auto-generated method stub

	}

	@Override
	public Balance getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Balance> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DataGrid getByPage(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DataGrid getByPageFilter(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long count() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int add(Balance balance) {
		// TODO Auto-generated method stub
		return balanceMapper.insert(balance);
	}

	@Override
	public Serializable save(Balance o) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Balance o) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Balance getBalanceById(int id) {
		// TODO Auto-generated method stub
		return balanceMapper.selectBalanceByUserId(id);
	}

}
