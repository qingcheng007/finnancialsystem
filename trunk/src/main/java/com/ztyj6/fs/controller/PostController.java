package com.ztyj6.fs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Post;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IPostService;

@Controller
@RequestMapping("/postController")
public class PostController extends BaseController {
	private IPostService postService;

	public IPostService getPostService() {
		return postService;
	}

	@Autowired
	public void setPostService(IPostService postService) {
		this.postService = postService;
	}

	@ResponseBody
	@RequestMapping("/admin/add")
	public Json add(Post post, HttpSession session) {
	    Json json = new Json();
		try {
			postService.save(post);
			json.setSuccess(true);
			json.setObj(post);
			json.setMsg("添加成功");
		} catch (Exception e) {
			json.setMsg("添加失败");
			e.printStackTrace();
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/delete")
	public Json delete(String ids) {
		Json json = new Json();
		try {
			postService.delete(ids);
			json.setSuccess(true);
			json.setMsg("删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("删除失败");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/admin/getByPage")
	public DataGrid getByPage(PageFilter pageFilter) {
		try {
			return postService.getByPage(pageFilter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@ResponseBody
	@RequestMapping("/admin/edit")
	public Json edit(Post post) {
		Json json = new Json();
		try {
			postService.update(post);
			json.setSuccess(true);
			json.setMsg("更新成功");
			json.setObj(post);
		} catch (Exception e) {
			json.setMsg("更新失败");
			e.printStackTrace();
		}
		return json;
	}
}
