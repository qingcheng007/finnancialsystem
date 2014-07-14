package test.invoke;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.service.IInvoiceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class testInvoice {
	

	public IInvoiceService iInvoiceServcei;
	
	public IInvoiceService getiInvoiceServcei() {
		return iInvoiceServcei;
	}
	@Autowired
	public void setiInvoiceServcei(IInvoiceService iInvoiceServcei) {
		this.iInvoiceServcei = iInvoiceServcei;
	}

	@Test
	public void test1()
	{
		List<Invoice> invoiceList = iInvoiceServcei.getInvoiceAll();
		if(invoiceList.size()==0)
		System.out.println("发票信息为空的：");
			else
		System.out.println("发票信息为："+invoiceList);
	}


}
