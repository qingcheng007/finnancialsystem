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
    public Json add(Post post,HttpSession session){
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
    @ResponseBody
    @RequestMapping("/admin/delete")
    public Json delete(Post post){
    	Json json = new Json();
    	String msg = "";
    	try{
    		postService.delete(post);
    		json.setSuccess(true);
    		msg = "删除成功";
    		json.setMsg(msg);
    		json.setSuccess(true);
    	}catch(Exception e){
    		msg = "删除失败";
            json.setSuccess(false);
            json.setMsg(msg);
    		e.printStackTrace();
    	}
    	return json;
    }
    @ResponseBody
    @RequestMapping("/admin/deleteBatch")
    public Json deleteBatch(String ids){
    	Json json = new Json();
    	String msg = "";
    	try{
    	    postService.delete(ids);
    	    msg = "批量删除成功";
    	    json.setSuccess(true);
    	    json.setMsg(msg);
    	}catch(Exception e){
    		e.printStackTrace();
    		msg = "批量删除失败";
    		json.setSuccess(false);
    		json.setMsg(msg);
    	}
    	return json;
    }
    @ResponseBody
    @RequestMapping("/admin/getByPage")
    public DataGrid getByPage(PageFilter pageFilter){
    	 try{
    		 return postService.getByPage(pageFilter);
    	 }catch(Exception e){
    		 e.printStackTrace();
    		 return null;
    	 }
    }
    @ResponseBody
    @RequestMapping("/admin/update")
    public Json update(Post post){
    	Json json = new Json();
    	String msg = "";
    	try{
    		postService.update(post);
    		msg = "更新成功";
    		json.setSuccess(true);
    		json.setMsg(msg);
    	}catch(Exception e){
    		msg = "更新失败";
    		json.setSuccess(false);
            json.setMsg(msg);
    		e.printStackTrace();
    	}
    	return json;
    }
}
