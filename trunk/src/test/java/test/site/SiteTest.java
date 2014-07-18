package test.site;

import java.util.Date;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.Site;
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
    @Ignore
    public void testDeleteBatch(){
    	String ids = "1,2,3";
    	siteService.delete(ids);
    }
    @Ignore
    public void testSaveUserToSite(){
    	int siteId = 1;
    	int userId = 1;
    	int postId = 1;
    	siteService.saveUserToSite(siteId, userId, postId);
    }
    @Ignore
    public void testDeleteUserFromSiteByUserId(){
    	int siteId = 1;
    	int userId  = 1;
    	siteService.deleteUserFromSiteByUserId(siteId,userId);
    }
    
    @Test
    public void deleteBatchUserFromSite(){
    	String ids = "1,2,3";
    	int siteId = 1;
    	siteService.deleteBatchUserFromSite(siteId, ids);
    }
}
