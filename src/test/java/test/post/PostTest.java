package test.post;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.Post;
import com.ztyj6.fs.service.IPostService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class PostTest {
	public IPostService postService;

	public IPostService getPostService() {
		return postService;
	}
    @Autowired
	public void setPostService(IPostService postService) {
		this.postService = postService;
	}
    
    @Test
	public void addTset(){
		Post post = new Post();
		post.setId(100);
		post.setName("普通员工");
		postService.save(post);
		
	}
    @Test
	public void testIsExist(){
		String name = "站长";
		System.out.println("-----fsnhui----"+postService.isExist(name));
	}
    @Test
    public void testGetAllPost(){
    	System.out.println("---------listSize----------"+postService.getAllPost().size());
    	List<Post> list = postService.getAllPost();
    	for(Post post : list){
    		System.out.println(post.getId()+"    "+post.getName());
    	}
    }
}
