package com.ztyj6.fs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ztyj6.fs.dao.InvoiceDetailsMapper;
import com.ztyj6.fs.dao.InvoiceMapper;
import com.ztyj6.fs.dao.InvoiceTypeMapper;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceDetails;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.service.IInvoiceService;

@Service("invoiceService")
public class InvoiceServiceImpl implements IInvoiceService {

	InvoiceMapper invoiceMapper;
	
	InvoiceDetailsMapper invoiceDetailsMapper;
	
	InvoiceTypeMapper invoiceTypeMapper;
	
	

	public InvoiceTypeMapper getInvoiceTypeMapper() {
		return invoiceTypeMapper;
	}
	@Autowired
	public void setInvoiceTypeMapper(InvoiceTypeMapper invoiceTypeMapper) {
		this.invoiceTypeMapper = invoiceTypeMapper;
	}
	public InvoiceDetailsMapper getInvoiceDetailsMapper() {
		return invoiceDetailsMapper;
	}
	@Autowired
	public void setInvoiceDetailsMapper(InvoiceDetailsMapper invoiceDetailsMapper) {
		this.invoiceDetailsMapper = invoiceDetailsMapper;
	}

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

	@Override
	public int insertSelective(Invoice invoice) {
		return invoiceMapper.insert(invoice);
	}

	@Override
	public int selectInvoiceDetailsID() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertInvoiceDetails(InvoiceDetails invoiceDetail) {
		
		return invoiceDetailsMapper.insertSelective(invoiceDetail);
	}
	
	/**
	 * 
	 * 查询发票详细信息的ID最大值
	 * **/
	@Override
	public int selectMaxIDFromInvoiceDetails() {
		
		return invoiceDetailsMapper.selectMaxID();
	}
	@Override
	public int insertInvoiceTypeSelective(InvoiceType invoiceType) {
		
		return invoiceTypeMapper.insertSelective(invoiceType);
		
	}

	@Override
	public int saveInvoiceTypeSelective(InvoiceType invoiceType) {
		return invoiceTypeMapper.insertSelective(invoiceType);
	}

	@Override
	public int insertInvoiceTypeAll(InvoiceType invoiceType) {
		return invoiceTypeMapper.insert(invoiceType);
	}

	

}
