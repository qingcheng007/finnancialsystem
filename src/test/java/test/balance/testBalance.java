package test.balance;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.service.IBalanceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class testBalance {

	private IBalanceService blanService;

	public IBalanceService getBlanService() {
		return blanService;
	}
	@Autowired
	public void setBlanService(IBalanceService blanService) {
		this.blanService = blanService;
	}
	@Test
	public void TestGetBalanceById(){
		Balance a=blanService.getBalanceById(4);
		System.out.println("kaka"+a.getAvailable()+"-"+a.getFrozen());
	}
}
