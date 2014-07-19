package test.site;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.Post;
import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.service.ISiteService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class SiteTest {
	private ISiteService siteService;

	public ISiteService getSiteService() {
		return siteService;
	}
    @Autowired
	public void setSiteService(ISiteService siteService) {
		this.siteService = siteService;
	}
    @Test
    public void testAdd(){
    	Site site = new Site();
    	site.setId(7);
    	site.setName("44");
    	site.setAddress("44");
    	site.setCreateDate(new Date());
    	site.setCreatePurpose("44");
    	site.setUserId(1);
    	site.setProjectName("44");
    	siteService.save(site);
    }
    @Test
    public void testDeleteBatch(){
    	String ids = "1,2,3";
    	siteService.delete(ids);
    }
    @Test
    public void testSaveUserSite(){
    	int siteId = 1;
    	int userId = 1;
    	int postId = 1;
    	Map<String,Integer> map = new HashMap<String,Integer>();
    	map.put("siteId", siteId);
    	map.put("userId", userId);
    	map.put("postId", postId);
    	siteService.saveUserSite(map);
    }
    @Test
    public void testDeleteUserSite(){
    	int siteId = 1;
    	int userId  = 1;
    	siteService.deleteUserSite(siteId,userId);
    }
    
    @Test
    public void deleteBatchUserSite(){
    	String ids = "1,2,3";
    	int siteId = 1;
    	siteService.deleteBatchUserSite(siteId, ids);
    }
    @Test
    public void testGetUserInformationOfOneSite(){
    	/*int siteId = 1;
    	List<Site> siteList = new ArrayList<Site>();
    	List<User> userList = new ArrayList<User>();
    	List<Post> postList = new ArrayList<Post>();
    	User user = new User();
    	Post post = new Post();
    	参数 不对
    	siteList = siteService.getUserInformationOfOneSite(siteId);
    	for(int i=0;i<siteList.size();i++){
    		System.out.println(" site--> siteName "+siteList.get(i).getName());
    		userList = siteList.get(i).getUsers();
    		for(int j=0;j<userList.size();j++){
    			user = userList.get(j);
    			System.out.println("user ---> userName "+user.getUsername());
    		}
    		postList = siteList.get(i).getPosts();
    		for(int k=0;k<postList.size();k++){
    			post  = postList.get(k);
    			System.out.println("post ---> postName "+post.getName());
    		}
    	}*/
    }
}
