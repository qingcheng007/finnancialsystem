package com.ztyj6.fs.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.User;
import com.ztyj6.fs.service.IUserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class UserTest {
 private IUserService userService;

public IUserService getUserService() {
	return userService;
}
@Autowired
public void setUserService(IUserService userService) {
	this.userService = userService;
}
@Test
public void TestInsertUser(){
	User user  = new User();
	user.setUsername("2");
	user.setRealname("3");
	user.setPassword("2");
	user.setParentId(2);
	user.setBalanceId(1);
	user.setIsEnable(true);
	userService.save(user);
}
}
