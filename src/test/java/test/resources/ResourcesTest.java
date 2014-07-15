package test.resources;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.Resource;
import com.ztyj6.fs.service.IResourceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class ResourcesTest {
	private IResourceService resourceService;

	public IResourceService getResourceService() {
		return resourceService;
	}
@Autowired
	public void setResourceService(IResourceService resourceService) {
		this.resourceService = resourceService;
	}
	
@Test 
   public void insertTest(){
	Resource resource=new Resource();
	resource.setId(15);
	resource.setName("客户管理");
	resource.setSequence((short) 1);
	resource.setType((short) 1);
	resource.setDescription("客户管理");
	resource.setParentId(1);
	resource.setIsLeaf(false);
	resourceService.save(resource);
}
 
}
