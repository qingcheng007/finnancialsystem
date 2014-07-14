package com.ztyj6.fs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ztyj6.fs.dao.InvoiceMapper;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.service.IInvoiceService;

@Service("invoiceService")
public class InvoiceServiceImpl implements IInvoiceService {

	InvoiceMapper invoiceMapper;

	public InvoiceMapper getInvoiceMapper() {
		return invoiceMapper;
	}

	@Autowired
	public void setInvoiceMapper(InvoiceMapper invoiceMapper) {
		this.invoiceMapper = invoiceMapper;
	}
	
	@Override
	public List<Invoice> getInvoiceAll() {
		
		return  invoiceMapper.getInvoiceAll();
	}

}
