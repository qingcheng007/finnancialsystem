package com.ztyj6.fs.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.User;
import com.ztyj6.fs.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)//等同于继承
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})//指明配置文件
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
public void interestTest(){
	User user  = new User();
	user.setId(1);
	user.setUsername("2");
	user.setRealname("3");
	user.setPassword("2");
	user.setParentId(1);
	user.setBalanceId(3);
	user.setIsEnable(true);
	userService.save(user);
}
}
