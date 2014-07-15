package com.ztyj6.fs.service;

import java.util.List;

import com.ztyj6.fs.model.AuditState;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceDetails;
import com.ztyj6.fs.model.InvoiceType;

public interface IInvoiceService extends IBaseService<Invoice> {

	List<Invoice> getInvoiceAll();
	
	int insertSelective(Invoice invoice);
	
	int selectInvoiceDetailsID();

	int insertInvoiceDetails(InvoiceDetails invoiceDetail);
	
	int selectMaxIDFromInvoiceDetails();
	
	int insertInvoiceTypeSelective(InvoiceType invoiceType);
	
	int saveInvoiceTypeSelective(InvoiceType invoiceType);
	
	int saveInvoiceDetailsSelective(InvoiceDetails invoiceDetails);
	
	int insertInvoiceTypeAll(InvoiceType invoiceType);
	
	int saveInvoiceAllSelective(Invoice invoice); 
	
	int saveAuditStateInitialise(AuditState auditState);
	
	int updateAuditState(Invoice invoice,int passOne);
	
}
