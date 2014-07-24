package com.ztyj6.fs.service;

import java.util.List;

import com.ztyj6.fs.model.Post;

public interface IPostService extends IBaseService<Post> {
	public int isExist(String postName);
	public List<Post> getAllPost();
}
