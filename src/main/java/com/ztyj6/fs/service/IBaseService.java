package com.ztyj6.fs.service;

import java.io.Serializable;
import java.util.List;

import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;



public interface IBaseService<T> {

	public Serializable save(T o);

	public void delete(T o);

	public void delete(String ids);
	
	public void update(T o);

	public void saveOrUpdate(T o) throws Throwable;

	public T getById(Integer id);

	public List<T> getAll();

	public DataGrid getByPage(PageFilter pageFilter);
	
	public DataGrid getByPageFilter(PageFilter pageFilter);
	
	public Long count();
}
