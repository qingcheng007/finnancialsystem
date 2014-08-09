package com.ztyj6.fs.service;

import java.math.BigDecimal;
import java.util.List;

import com.ztyj6.fs.model.AuditState;
import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceDetails;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;

public interface IInvoiceService extends IBaseService<Invoice> {

	List<Invoice> getInvoiceAll();
	
	int insertSelective(Invoice invoice);
	
	int selectInvoiceDetailsID();

	int insertInvoiceDetails(InvoiceDetails invoiceDetail);
	
	int selectMaxIDFromInvoiceDetails();
	
	//int insertInvoiceTypeSelective(InvoiceType invoiceType);
	
	int saveInvoiceTypeSelective(InvoiceType invoiceType);
	
	int saveInvoiceDetailsSelective(InvoiceDetails invoiceDetails);
	
	//int insertInvoiceTypeAll(InvoiceType invoiceType);
	
	int saveInvoiceAllSelective(Invoice invoice); 
	
	int saveAuditStateInitialise(AuditState auditState);
	
	int updateAuditState(Invoice invoice,int passOne);
	
	int updateAuditStateOnly(AuditState auditState);
	//test
	List<InvoiceType> getInvoiceTypeAll();
	
	public DataGrid getPageById(PageFilter pageFilter,int id);
	
	public DataGrid getByPageCurrentID(PageFilter pageFilter,int id);
	
	BigDecimal calculatePenalty(Invoice invoice,BigDecimal rate);
	
	int saveBalance(Balance balance);
	
	int updateBalance(Balance balance);
	
}
