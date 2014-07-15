package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.event.ListDataEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ztyj6.fs.dao.ResourceMapper;
import com.ztyj6.fs.model.Resource;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.model.page.Tree;
import com.ztyj6.fs.security.service.MyVoter;
import com.ztyj6.fs.service.IResourceService;

@Service("resourceService")
public class ResourceServiceImpl implements IResourceService {

	private ResourceMapper resourceMapper;

	public ResourceMapper getResourceMapper() {
		return resourceMapper;
	}

	@Autowired
	public void setResourceMapper(ResourceMapper resourceMapper) {
		this.resourceMapper = resourceMapper;
	}
	
	private MyVoter myVoter;

	public MyVoter getMyVoter() {
		return myVoter;
	}

	@Autowired
	public void setMyVoter(MyVoter myVoter) {
		this.myVoter = myVoter;
	}

	public List<Tree> getMenuTree(Integer id) {
		List<Resource> resources;
		if (id == null)
			resources = resourceMapper.selectMenuByParentId(1);
		else
			resources = resourceMapper.selectMenuByParentId(id);
		List<Tree> trees = new ArrayList<Tree>();
		for (Resource resource : resources) {
			if (myVoter.vote(resource.getUrl())) {
				Tree tree = new Tree();
				tree.setId(resource.getId());
				tree.setText(resource.getName());
				tree.setIconCls(resource.getIcon());
				tree.setParentId(resource.getParentId());
				if (resource.getIsLeaf())
					tree.setState("open");
				Map<String, Object> attr = new HashMap<String, Object>();
				attr.put("url", resource.getUrl());
				tree.setAttributes(attr);
				trees.add(tree);
			}
		}
		return trees;
	}

	public Serializable save(Resource o) {
		// TODO Auto-generated method stub
		
		resourceMapper.insertSelective(o);
		return null;
	}

	public void delete(Resource o) {
		// TODO Auto-generated method stub

	}

	public void update(Resource o) {
		// TODO Auto-generated method stub

	}

	public void saveOrUpdate(Resource o) {
		// TODO Auto-generated method stub

	}

	public Resource getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long count() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Resource> getAll() {
		return resourceMapper.selectAll();
	}

	public List<Tree> getAllMenuTree(Integer id) {
		List<Resource> resources;
		if (id == null)
			resources = resourceMapper.selectByParentId(0);
		else
			resources = resourceMapper.selectByParentId(id);
		List<Tree> trees = null;
		if (resources != null && !resources.isEmpty()) {
			trees = new ArrayList<Tree>();
			for (Resource resource : resources) {
				Tree tree = new Tree();
				tree.setId(resource.getId());
				tree.setText(resource.getName());
				tree.setIconCls(resource.getIcon());
				tree.setParentId(resource.getParentId());
				tree.setState("open");
				List<Tree> childs = getAllMenuTree(resource.getId());
				tree.setChildren(childs);
				Map<String, Object> attr = new HashMap<String, Object>();
				attr.put("url", resource.getUrl());
				tree.setAttributes(attr);
				trees.add(tree);
			}
		}
		return trees;
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
	public void delete(String o) {

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Resource> getByRoleId(Integer id) {
		List re = resourceMapper.selectByRoleId(id);
		return re;
	}

}
