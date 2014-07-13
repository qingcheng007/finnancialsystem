package com.ztyj6.fs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Post;
import com.ztyj6.fs.model.page.Json;
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
    public Json add(@RequestBody Post post,HttpSession session){
    	Json json = new Json();
    	String msg = "";
    	try{
    		postService.save(post);
    		msg = "添加成功";
    		json.setSuccess(true);
    		json.setObj(post);
    		json.setMsg(msg);
    	}catch(Exception e){
    		msg = "添加失败";
    		json.setMsg(msg);
    	}
    	return json;
    }
}
