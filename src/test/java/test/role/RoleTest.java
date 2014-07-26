package test.role;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.dao.BalanceMapper;
import com.ztyj6.fs.model.Role;
import com.ztyj6.fs.service.IBalanceService;
import com.ztyj6.fs.service.IRoleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class RoleTest {
	private IBalanceService balanceService;
	
	public IBalanceService getBalanceService() {
		return balanceService;
	}
	@Autowired
	public void setBalanceService(IBalanceService balanceService) {
		this.balanceService = balanceService;
	}
	private IRoleService roleService;

	public IRoleService getRoleService() {
		return roleService;
	}
 @Autowired
	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}
	@Test
	public void insertTest(){
		Role role=new Role();
		role.setCode("ROLE_DIST");
		role.setName("出纳");
		role.setDescription("出纳人员");
		role.setIsEnable(true);
		roleService.save(role);
	}
    @Test
    public void testGetMaxId(){
    	System.out.println("---maxId----"+balanceService.getByMaxId());
    }
}
