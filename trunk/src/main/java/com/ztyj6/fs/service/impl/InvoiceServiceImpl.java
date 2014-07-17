package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ztyj6.fs.dao.AuditStateMapper;
import com.ztyj6.fs.dao.InvoiceDetailsMapper;
import com.ztyj6.fs.dao.InvoiceMapper;
import com.ztyj6.fs.dao.InvoiceTypeMapper;
import com.ztyj6.fs.model.AuditState;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceDetails;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IInvoiceService;

@Service("invoiceService")
public class InvoiceServiceImpl implements IInvoiceService {

	InvoiceMapper invoiceMapper;

	InvoiceDetailsMapper invoiceDetailsMapper;

	InvoiceTypeMapper invoiceTypeMapper;

	AuditStateMapper auditStateMapper;

	public AuditStateMapper getAuditStateMapper() {
		return auditStateMapper;
	}

	@Autowired
	public void setAuditStateMapper(AuditStateMapper auditStateMapper) {
		this.auditStateMapper = auditStateMapper;
	}

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
	public void setInvoiceDetailsMapper(
			InvoiceDetailsMapper invoiceDetailsMapper) {
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

		return invoiceMapper.getInvoiceAll();
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

	@Override
	public int saveInvoiceDetailsSelective(InvoiceDetails invoiceDetails) {

		return invoiceDetailsMapper.insertSelective(invoiceDetails);

	}

	// 初始插入发票的所有信息
	@Override
	public int saveInvoiceAllSelective(Invoice invoice) {
		// this.saveInvoiceTypeSelective(invoice.getInvoiceType());
		this.saveInvoiceDetailsSelective(invoice.getInvoiceDetails());
		this.saveAuditStateInitialise(invoice.getAuditState());
		invoiceMapper.insertSelective(invoice);
		return 0;
	}

	@Override
	public int saveAuditStateInitialise(AuditState auditState) {

		auditState.setAuditor1(false);
		auditState.setAuditor2(false);
		auditState.setDearer(false);
		auditState.setOperator(true);
		auditState.setProver(false);
		return auditStateMapper.insertSelective(auditState);
	}

	// 审计状态的更新
	@Override
	public int updateAuditState(Invoice invoice, int passOne) {

		switch (passOne) {
		case 1: {
			invoice.getAuditState().setProver(false);
		}
			break;
		case 2: {
			invoice.getAuditState().setAuditor1(true);
		}
			break;
		case 3: {
			invoice.getAuditState().setAuditor2(true);
		}
			break;
		default: {
			invoice.getAuditState().setProver(true);
		}
		}
		return auditStateMapper.updateByPrimaryKeySelective(invoice
				.getAuditState());

	}

	@Override
	public Serializable save(Invoice o) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Invoice o) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Invoice o) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveOrUpdate(Invoice o) throws Throwable {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Invoice getById(Integer id) {
		// TODO Auto-generated method stub
		return invoiceMapper.selectByPrimaryID(id);
	}

	@Override
	public List<Invoice> getAll() {
		
		return invoiceMapper.getInvoiceAll();
	}

	@Override
	public DataGrid getByPage(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DataGrid getByPageFilter(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long count() {
		return (long) invoiceMapper.selectCount();
	}

}
