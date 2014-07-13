package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.ztyj6.fs.dao.PostMapper;
import com.ztyj6.fs.model.Post;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IPostService;
import com.ztyj6.fs.utils.PageFilterUtil;
@Service("postService")
public class PostServiceImpl implements IPostService {
    private PostMapper postMapper;
    
	public PostMapper getPostMapper() {
		return postMapper;
	}
    @Autowired
	public void setPostMapper(PostMapper postMapper) {
		this.postMapper = postMapper;
	}
    /*
     *添加一个 Post 记录
     * @Input Post对象
     * @Return NULL
     */
	public Serializable save(Post o) {
		// TODO Auto-generated method stub
		postMapper.insert(o);
		return null;
	}
    /*
     *删除一条记录
     *@Input Post 对象
     * @Return 无返回值
     */
	public void delete(Post o) {
		// TODO Auto-generated method stub
		postMapper.deleteByPrimaryKey(o.getId());

	}

	public void delete(String ids) {
		// TODO Auto-generated method stub
		List<String> arrays = Arrays.asList(ids.split(","));
        postMapper.deleteBatch(arrays);
	}

	public void update(Post o) {
		// TODO Auto-generated method stub

	}

	public void saveOrUpdate(Post o) throws Throwable {
		// TODO Auto-generated method stub

	}

	public Post getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Post> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public DataGrid getByPage(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList posts = (PageList) postMapper.selectByPage(pageBounds);
		dg.setRows(posts);
		dg.setTotal(posts.getPaginator().getTotalCount());
		return dg;
		
	}

	public DataGrid getByPageFilter(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	public Long count() {
		// TODO Auto-generated method stub
		return null;
	}

}
