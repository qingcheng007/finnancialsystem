package com.ztyj6.fs.service.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.ztyj6.fs.dao.AuditStateMapper;
import com.ztyj6.fs.dao.BalanceMapper;
import com.ztyj6.fs.dao.InvoiceDetailsMapper;
import com.ztyj6.fs.dao.InvoiceMapper;
import com.ztyj6.fs.dao.InvoiceTypeMapper;
import com.ztyj6.fs.model.AuditState;
import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceDetails;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.model.PenaltyRate;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IInvoiceService;
import com.ztyj6.fs.utils.PageFilterUtil;

@Service("invoiceService")
public class InvoiceServiceImpl implements IInvoiceService {

	InvoiceMapper invoiceMapper;

	InvoiceDetailsMapper invoiceDetailsMapper;

	InvoiceTypeMapper invoiceTypeMapper;

	AuditStateMapper auditStateMapper;
	
	BalanceMapper balanceMapper;

	public BalanceMapper getBalanceMapper() {
		return balanceMapper;
	}
	@Autowired
	public void setBalanceMapper(BalanceMapper balanceMapper) {
		this.balanceMapper = balanceMapper;
	}

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

/*	@Override
	public int insertInvoiceTypeSelective(InvoiceType invoiceType) {

		return invoiceTypeMapper.insertSelective(invoiceType);

	}*/

	@Override
	public int saveInvoiceTypeSelective(InvoiceType invoiceType) {
		return invoiceTypeMapper.insertSelective(invoiceType);
	}

/*	@Override
	public int insertInvoiceTypeAll(InvoiceType invoiceType) {
		return invoiceTypeMapper.insert(invoiceType);
	}*/

	@Override
	public int saveInvoiceDetailsSelective(InvoiceDetails invoiceDetails) {

		return invoiceDetailsMapper.insertSelective(invoiceDetails);

	}

	// 初始插入发票的所有信息
	@Override
	public int saveInvoiceAllSelective(Invoice invoice) {
		// this.saveInvoiceTypeSelective(invoice.getInvoiceType());
		this.saveInvoiceDetailsSelective(invoice.getInvoiceDetails());
		System.out.println("-----------------detailsID:"+invoice.getInvoiceDetails().getId());
		invoice.setInvoicedetailsid(invoice.getInvoiceDetails().getId());
		this.saveAuditStateInitialise(invoice.getAuditState());
		System.out.println("-----------------"+invoice.getAuditState().getId());
		invoice.setAuditstateid(invoice.getAuditState().getId());
		invoiceMapper.insertSelective(invoice);
		return 0;
	}

	@Override
	public int saveAuditStateInitialise(AuditState auditState) {

		auditState.setAuditor1(0);
		auditState.setAuditor2(0);
		auditState.setDearer(0);
		auditState.setOperator(1);
		auditState.setProver(0);
		return auditStateMapper.insertSelective(auditState);
	}

	// 审计状态的更新
	@Override
	public int updateAuditState(Invoice invoice, int passOne) {

		switch (passOne) {
		case 1: {
			invoice.getAuditState().setProver(1);
		}
			break;
		case 2: {
			invoice.getAuditState().setAuditor1(1);
		}
			break;
		case 3: {
			invoice.getAuditState().setAuditor2(1);
		}
			break;
		default: {
			invoice.getAuditState().setProver(1);
		}
		}
		return auditStateMapper.updateByPrimaryKeySelective(invoice
				.getAuditState());

	}
	
	@Override
	public int updateAuditStateOnly(AuditState auditState) {
		return auditStateMapper.updateByPrimaryKeySelective(auditState);
	}

	@Override
	public Serializable save(Invoice o) {
		return this.saveInvoiceAllSelective(o);
	}

	@Override
	public void delete(Invoice o) {
		invoiceMapper.deleteByPrimaryKey(o);

	}

	@Override
	public void delete(String ids) {

		List<String> arrays = Arrays.asList(ids.split(","));
		invoiceMapper.deleteBatch(arrays);
//		invoiceMapper.deleteByPrimaryID(Integer.parseInt(ids));

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
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList roles = (PageList) invoiceMapper.selectByPage(pageBounds);
		dg.setRows(roles);
		dg.setTotal(roles.getPaginator().getTotalCount());
		return dg;
	}
	@Override
	public DataGrid getPageById(PageFilter pageFilter, int id) {
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList roles = (PageList) invoiceMapper.selectPageById(pageBounds,id);
		dg.setRows(roles);
		dg.setTotal(roles.getPaginator().getTotalCount());
		return dg;
		
	}

	@Override
	public DataGrid getByPageFilter(PageFilter pageFilter) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 查询发票主表的总数
	@Override
	public Long count() {
		return (long) invoiceMapper.selectInvoiceCount();
	}

	@Override
	public List<InvoiceType> getInvoiceTypeAll() {
		return invoiceTypeMapper.getInvoiceType();
	}

	@Override
	public BigDecimal calculatePenalty(Invoice invoice,BigDecimal rate) {
		//BigDecimal rate = new BigDecimal("0.1");
		

		long to = invoice.getCreateDate().getTime();
		long from = invoice.getOccurDate().getTime();
		long bg;

		if (from > to)
			bg = (to - from) / (1000 * 60 * 60 * 24);
		else
			bg = (to - from) / (1000 * 60 * 60 * 24);

		BigDecimal calculate = new BigDecimal(bg);
		calculate = calculate.multiply(rate);
		return calculate;
	}

	@Override
	public int saveBalance(Balance balance) {
		return balanceMapper.insertSelective(balance);
		
	}
	@Override
	public int updateBalance(Balance balance) {
		return balanceMapper.updateByPrimaryKeySelective(balance);
	}





}
