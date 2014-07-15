package test.invoke;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceDetails;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.service.IInvoiceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-security.xml", "classpath:spring.xml", "classpath:spring-ehcache.xml", "classpath:spring-mybatis.xml" })
public class testInvoice {
	

	public IInvoiceService iInvoiceService;
	

	public IInvoiceService getiInvoiceService() {
		return iInvoiceService;
	}
	@Autowired
	public void setiInvoiceService(IInvoiceService iInvoiceService) {
		this.iInvoiceService = iInvoiceService;
	}
	@Test
	public void test1()
	{
		List<Invoice> invoiceList = iInvoiceService.getInvoiceAll();
		if(invoiceList.size()==0)
		System.out.println("发票信息为空的：");
			else
		System.out.println("发票信息为："+invoiceList);
		//Invoice invoice = new Invoice();
		//invoice.setAuditor1id(1);
		//invoice.setAuditor2id(1);
		//invoice.setAuditState('1');	
	}
	@Test
	public void test2(){
		InvoiceDetails invoiceDetails=new InvoiceDetails();
		invoiceDetails.setId(2);
		invoiceDetails.setContent1("qiyou");
		invoiceDetails.setContent2("50");
		invoiceDetails.setContent3("100");
		invoiceDetails.setContent4("ceshi");
		System.out.print(iInvoiceService.insertInvoiceDetails(invoiceDetails));
		
	}
	/**
	 * 
	 * 测试查询id最大值
	 * 
	 * **/
	@Test
	public void test3(){
		System.out.println(iInvoiceService.selectMaxIDFromInvoiceDetails());
		
	}
	@Test
	public void test4(){
		InvoiceType invoiceType = new InvoiceType();
		invoiceType.setId(12);
		invoiceType.setName("款待费用");
		System.out.println(iInvoiceService.insertInvoiceType(invoiceType));
	}


}
