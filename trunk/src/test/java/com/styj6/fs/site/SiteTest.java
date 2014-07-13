package com.styj6.fs.site;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.controller.SiteController;
import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.service.ISiteService;

@RunWith(SpringJUnit4ClassRunner.class)//等同于继承
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})//指明配置文件
public class SiteTest {
	private SiteController siteController;
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
    	site.setId(2);
    	site.setName("2");
    	site.setAddress("2");
    	site.setCreateDate(new Date());
    	site.setCreatePurpose("2");
    	site.setUserId(1);
    	site.setProjectName("2");
    	siteService.save(site);
    }
}
