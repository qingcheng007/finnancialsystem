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
    @Ignore
    public void testAdd(){
    	Site site = new Site();
    	site.setId(2);
    	site.setName("4");
    	site.setAddress("4");
    	site.setCreateDate(new Date());
    	site.setCreatePurpose("4");
    	site.setUserId(1);
    	site.setProjectName("4");
    	siteService.save(site);
    }
    @Test
    public void testDeleteBatch(){
    	
    	String ids = "1,2,3";
    	siteService.delete(ids);
		
    }
}
