package com.ztyj6.fs.dao;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ztyj6.fs.model.Post;
import com.ztyj6.fs.model.Site;

public interface PostMapper {
  
    int deleteByPrimaryKey(Integer id);
    void deleteBatch(List ids);

   
    int insert(Post record);

   
    int insertSelective(Post record);

   
    Post selectByPrimaryKey(Integer id);
    List<Post> selectByPage(PageBounds pageBounds);
   
    int updateByPrimaryKeySelective(Post record);

    
    int updateByPrimaryKey(Post record);
}