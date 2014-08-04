package test.invoce;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.lang.model.element.Element;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ztyj6.fs.model.AuditState;
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
	/*
	 * 
	 * 发票类型插入
	 * 
	 * **/
	@Test
	public void test4(){
		InvoiceType invoiceType = new InvoiceType();

		//invoiceType.setId(12);

		//invoiceType.setId(1);

		invoiceType.setName("款待费用");

		System.out.println(iInvoiceService.saveInvoiceTypeSelective(invoiceType)+"==============="+invoiceType.getId());

		//System.out.println(iInvoiceService.insertInvoiceTypeAll(invoiceType));

	}
	/*
	 * 测试审计状态初始化插入
	 * 
	 * 
	 * */
	@Test
	public void TestAuditState(){
		AuditState auditState = new AuditState();
		System.out.println(iInvoiceService.saveAuditStateInitialise(auditState)+"================="+auditState.getId());
	}
	
	/*
	 * 测试查询发票总数
	 * **/
	@Test
	public void TestCount(){
		System.out.println(iInvoiceService.count());
	}
	/*
	 * 测试发票类型
	 * 
	 * */
	@Test 
	public void testInvoiceType(){
		List<InvoiceType> invoiceType = iInvoiceService.getInvoiceTypeAll();
		for(InvoiceType invoicetest:invoiceType)
		{
			System.out.println(invoicetest.getId()+"--------"+invoicetest.getName());
		}
		
	}
	/*
	 * 发票详细类型插入
	 * */
	@Test
	public void testinvoiceDetails()
	{
		Invoice invoice = new Invoice();
		InvoiceDetails invoiceDetails = new InvoiceDetails();
		invoiceDetails.setContent1("1");
		invoiceDetails.setContent2("2");
		invoiceDetails.setContent3("3");
		invoice.setInvoiceDetails(invoiceDetails);
		
		iInvoiceService.insertInvoiceDetails(invoice.getInvoiceDetails());
		System.out.println(invoice.getInvoiceDetails().getId());
	}
	/*
	 * 测试发票所有信息插入
	 * */
	@Test
	public void testinvoiceAll()
	{
		AuditState auditState =new AuditState();
		Invoice invoice = new Invoice();
		InvoiceDetails invoiceDetails = new InvoiceDetails();
		invoiceDetails.setContent1("1");
		invoiceDetails.setContent2("2");
		invoiceDetails.setContent3("3");
		invoice.setInvoiceDetails(invoiceDetails);
		invoice.setAuditor1id(1);
		invoice.setAuditor2id(1);
		invoice.setContent("1");
		Date m=new Date();
		
		  String ds = "November 1, 2000";
	      DateFormat df = DateFormat.getDateInstance();
	     
	         try {
				 m = df.parse(ds);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		invoice.setCreateDate(m);
		invoice.setDearerid(1);
		invoice.setDescription("1");
		InvoiceType invoiceType = new InvoiceType();
		invoiceType.setId(1);
		invoice.setInvoiceType(invoiceType);
		System.out.println(invoice.getInvoiceType().getId());
		invoice.setInvoicetypeid(invoice.getInvoiceType().getId());
		BigDecimal b = new BigDecimal("100.1");
		invoice.setMoney(b);
		invoice.setOccurDate(m);
		invoice.setOperatorid(1);
		invoice.setPenalty(b);
		invoice.setPhotoUrl("11");
		invoice.setProjectName("121");
		invoice.setProverid(1);
		invoice.setRemark("test");
		invoice.setAuditState(auditState);
		//iInvoiceService.saveAuditStateInitialise(invoice.getAuditState());
		//iInvoiceService.saveAuditStateInitialise(invoice.getAuditState());
		//invoice.setAuditstateid(invoice.getAuditState().getId());
		//iInvoiceService.saveInvoiceDetailsSelective(invoice.getInvoiceDetails());
		//invoice.setInvoicedetailsid(invoice.getInvoiceDetails().getId());
		//iInvoiceService.insertSelective(invoice);
		
		//iInvoiceService.insertInvoiceDetails(invoice.getInvoiceDetails());
		iInvoiceService.saveInvoiceAllSelective(invoice);
		System.out.println(invoice.getId());
	}
	
	/*
	 * 审计状态插入测试
	 * */
	@Test
	public void testauditstate()
	{
		Invoice invoice = new Invoice();
		AuditState auditState = new AuditState();
		invoice.setAuditState(auditState);
		iInvoiceService.saveAuditStateInitialise(invoice.getAuditState());
		System.out.println(invoice.getAuditState().getId());
	}
	
	@Test
	public void testselectAll()
	{
		List<Invoice> invoiceList=iInvoiceService.getAll();
		for(Invoice i:invoiceList)
		{
			System.out.print(i.getContent()+"----"+i.getId());
		}
	}
	
	


}
