package com.ztyj6.fs.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.dao.UserMapper;
import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.service.IBalanceService;
import com.ztyj6.fs.service.IUserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class UserTest {
 private IUserService userService;
 private UserMapper userMapper;
 public UserMapper getUserMapper() {
	return userMapper;
}
 @Autowired
public void setUserMapper(UserMapper userMapper) {
	this.userMapper = userMapper;
}
private IBalanceService blanService;

public IBalanceService getBlanService() {
	return blanService;
}
@Autowired
public void setBlanService(IBalanceService blanService) {
	this.blanService = blanService;
}
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
@Test
public void TestInsertUser1(){
userService.getPartion();
System.out.println("卡卡"+userService.getPartion());
}
@Test
public void TestInsertUser2(){
  userService.getAll();
}
@Test
public void TestSelectBalanceById()
{ 
	Balance b = userService.getBalanceById(43);
	System.out.println(b.getAvailable()+"法"+b.getFrozen());
}
@Test
public void TestSelectRealNameById()
{
	String	RealName = userService.getRealNameById(1);
	System.out.println(RealName);
}
@Test
public void TestGetBalanceById(){
	Balance a=blanService.getBalanceById(4);
	System.out.println("kaka"+a.getAvailable()+"-"+a.getFrozen());
}
@Test
public void TestPassword(){
	//User user = userMapper.selectPasswordById(4);
	//System.out.println(user.getUsername()+"dddd"+user.getPassword());
	userService.updatePasswordById(4, "admin", "user");
}


}
