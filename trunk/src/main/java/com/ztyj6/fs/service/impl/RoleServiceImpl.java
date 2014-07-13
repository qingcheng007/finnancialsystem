package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import com.ztyj6.fs.dao.RoleMapper;
import com.ztyj6.fs.model.Resource;
import com.ztyj6.fs.model.Role;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.model.page.Tree;
import com.ztyj6.fs.security.service.MySecurityMetadataSource;
import com.ztyj6.fs.service.IRoleService;
import com.ztyj6.fs.utils.PageFilterUtil;

@Service("roleService")
public class RoleServiceImpl implements IRoleService {

	private RoleMapper roleMapper;

	private MySecurityMetadataSource mySecurityMetadataSource;

	public MySecurityMetadataSource getMySecurityMetadataSource() {
		return mySecurityMetadataSource;
	}

	@Autowired
	public void setMySecurityMetadataSource(MySecurityMetadataSource mySecurityMetadataSource) {
		this.mySecurityMetadataSource = mySecurityMetadataSource;
	}

	public RoleMapper getRoleMapper() {
		return roleMapper;
	}

	@Autowired
	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}

	public Serializable save(Role role) {
		role.setCreateDate(new Date());
		role.setIsEnable(true);
		roleMapper.insertSelective(role);
		return null;
	}

	public void delete(Role o) {
		// TODO Auto-generated method stub

	}

	public void update(Role role) {
		role.setModifyDate(new Date());
		roleMapper.updateByPrimaryKeySelective(role);
	}

	public void saveOrUpdate(Role o) {
		// TODO Auto-generated method stub

	}

	public Role getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long count() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Role> getAll() {
		return null;
	}

	@Override
	public DataGrid getByPage(PageFilter pageFilter) {
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList roles = (PageList) roleMapper.selectByPage(pageBounds);
		dg.setRows(roles);
		dg.setTotal(roles.getPaginator().getTotalCount());
		return dg;
	}

	@Override
	public DataGrid getByPageFilter(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String ids) {
		List<String> arrays = Arrays.asList(ids.split(","));
		roleMapper.deleteBatch(arrays);
	}

	@Override
	public void grant(Integer roleId, String ids) {
		List<String> arrays = Arrays.asList(ids.split(","));
		roleMapper.deleteByResourceIdNotIn(roleId, arrays);
		roleMapper.insertRoleResource(roleId, arrays);
		mySecurityMetadataSource.load();
	}

	@RequestMapping("/admin/getAllRoleTree")
	@ResponseBody
	public List<Tree> getAllRoleTree() {
		List<Role> roles = roleMapper.selectAll();
		List<Tree> trees = null;
		if (roles != null && !roles.isEmpty()) {
			trees = new ArrayList<Tree>();
			for (Role role : roles) {
				Tree tree = new Tree();
				tree.setId(role.getId());
				StringBuilder sb = new StringBuilder();
				sb.append(role.getName()).append(" ").append(role.getDescription());
				tree.setText(sb.toString());
				tree.setState("open");
				trees.add(tree);
			}
		}
		return trees;
	}

	@Override
	public List<Role> getByUserId(Integer userId) {
		return roleMapper.selectByUserId(userId);
	}
}
