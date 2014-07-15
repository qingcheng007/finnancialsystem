package com.ztyj6.fs.service;

import java.util.List;

import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceDetails;
import com.ztyj6.fs.model.InvoiceType;

public interface IInvoiceService {

	List<Invoice> getInvoiceAll();
	
	int insertSelective(Invoice invoice);
	
	int selectInvoiceDetailsID();

	int insertInvoiceDetails(InvoiceDetails invoiceDetail);
	
	int selectMaxIDFromInvoiceDetails();
	
	int insertInvoiceType(InvoiceType invoiceType);
	
	int insertInvoiceTypeAll(InvoiceType invoiceType);
	
}
