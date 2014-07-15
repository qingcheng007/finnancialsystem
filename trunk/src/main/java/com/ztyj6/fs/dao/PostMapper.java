package com.ztyj6.fs.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.Post;

public interface PostMapper {
  
    int deleteByPrimaryKey(Integer id);
    void deleteBatch(List<String> ids);

   
    int insert(Post record);

   
    int insertSelective(Post record);

   
    Post selectByPrimaryKey(Integer id);
    List<Post> selectByPage(PageBounds pageBounds);
   
    int updateByPrimaryKeySelective(Post record);

    
    int updateByPrimaryKey(Post record);
}