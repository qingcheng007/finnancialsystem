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
import com.ztyj6.fs.dao.PenaltyRateMapper;
import com.ztyj6.fs.dao.UserMapper;
import com.ztyj6.fs.model.AuditState;
import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceDetails;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.model.PenaltyRate;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IInvoiceService;
import com.ztyj6.fs.service.IUserService;
import com.ztyj6.fs.utils.PageFilterUtil;

@Service("invoiceService")
public class InvoiceServiceImpl implements IInvoiceService {

	InvoiceMapper invoiceMapper;

	InvoiceDetailsMapper invoiceDetailsMapper;

	InvoiceTypeMapper invoiceTypeMapper;

	AuditStateMapper auditStateMapper;

	BalanceMapper balanceMapper;

	PenaltyRateMapper penaltyRateMapper;

	IUserService iUserService;

	@Autowired
	public void setPenaltyRateMapper(PenaltyRateMapper penaltyRateMapper) {
		this.penaltyRateMapper = penaltyRateMapper;
	}

	public IUserService getiUserService() {
		return iUserService;
	}

	@Autowired
	public void setiUserService(IUserService iUserService) {
		this.iUserService = iUserService;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	UserMapper userMapper;

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

	/*
	 * @Override public int insertInvoiceTypeSelective(InvoiceType invoiceType)
	 * {
	 * 
	 * return invoiceTypeMapper.insertSelective(invoiceType);
	 * 
	 * }
	 */

	@Override
	public int saveInvoiceTypeSelective(InvoiceType invoiceType) {
		return invoiceTypeMapper.insertSelective(invoiceType);
	}

	/*
	 * @Override public int insertInvoiceTypeAll(InvoiceType invoiceType) {
	 * return invoiceTypeMapper.insert(invoiceType); }
	 */

	@Override
	public int saveInvoiceDetailsSelective(InvoiceDetails invoiceDetails) {

		return invoiceDetailsMapper.insertSelective(invoiceDetails);

	}

	// 初始插入发票的所有信息
	@Override
	public int saveInvoiceAllSelective(Invoice invoice) {
		// this.saveInvoiceTypeSelective(invoice.getInvoiceType());
		System.out.println(invoice.getInvoiceDetails());
		/*
		 * if(invoice.getInvoiceDetails().getContent1()==null) { InvoiceDetails
		 * invoiceDetails=new InvoiceDetails(); invoiceDetails.setContent1("0");
		 * invoice.setInvoiceDetails(invoiceDetails); }
		 */
		if (invoice.getInvoiceDetails().getContent1() != null)
			this.saveInvoiceDetailsSelective(invoice.getInvoiceDetails());
		// System.out.println("-----------------detailsID:"+
		// invoice.getInvoiceDetails().getId());
		invoice.setInvoiceDetailsId(invoice.getInvoiceDetails().getId());
		this.saveAuditStateInitialise(invoice.getAuditState());
		// System.out.println("-----------------"+
		// invoice.getAuditState().getId());
		invoice.setAuditstateId(invoice.getAuditState().getId());
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
		// invoiceMapper.deleteByPrimaryID(Integer.parseInt(ids));

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
	public Invoice saveInvoiceAllContent(Invoice invoice) {
		for (int j = 1; j <= 5; j++) {
			int idRealName = 0;
			String realName = "";
			switch (j) {
			case 1: {
				idRealName = invoice.getProverId();
				realName = userMapper.selectRealNameById(idRealName);
				invoice.setProverName(realName);
			}
				break;
			case 2: {
				idRealName = invoice.getOperatorId();
				realName = userMapper.selectRealNameById(idRealName);
				invoice.setOperatorName(realName);
			}
				break;
			case 3: {
				idRealName = invoice.getAuditor1Id();
				realName = userMapper.selectRealNameById(idRealName);
				invoice.setAuditor1Name(realName);
			}
				break;
			case 4: {
				idRealName = invoice.getAuditor2Id();
				realName = userMapper.selectRealNameById(idRealName);
				invoice.setAuditor2Name(realName);
			}
				break;
			case 5: {
				idRealName = invoice.getDearerId();
				realName = userMapper.selectRealNameById(idRealName);
				invoice.setDearerName(realName);
			}
				break;
			}
		}
		return invoice;
	}

	@Override
	public Invoice getById(Integer id) {
		// TODO Auto-generated method stub
		Invoice invoice = new Invoice();
		invoice = invoiceMapper.selectByPrimaryID(id);

		return this.saveInvoiceAllContent(invoice);
	}

	@Override
	public List<Invoice> getAll() {
		return invoiceMapper.getInvoiceAll();
	}

	@Override
	public DataGrid getByPageCurrentID(PageFilter pageFilter, int id) {
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList roles = (PageList) invoiceMapper.selectByPage(pageFilter,
				pageBounds, id);
		for (int i = 0; i < roles.size(); i++) {
			Invoice invoiceAddName = (Invoice) roles.get(i);

			roles.set(i, this.saveInvoiceAllContent(invoiceAddName));
			// //
		}
		dg.setRows(roles);
		dg.setTotal(roles.getPaginator().getTotalCount());
		return dg;
	}

	@Override
	public DataGrid getPageById(PageFilter pageFilter, int id) {
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList roles = (PageList) invoiceMapper.selectPageById(pageFilter,
				pageBounds, id);
		for (int i = 0; i < roles.size(); i++) {
			Invoice invoiceAddName = (Invoice) roles.get(i);

			roles.set(i, this.saveInvoiceAllContent(invoiceAddName));
			// //
		}
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
	public BigDecimal calculatePenalty(Invoice invoice, BigDecimal rate) {
		// BigDecimal rate = new BigDecimal("0.1");

		long to = invoice.getCreateDate().getTime();
		long from = invoice.getOccurDate().getTime();
		long bg;

		if (from > to)
			bg = (from - to) / (1000 * 60 * 60 * 24);
		else
			bg = (to - from) / (1000 * 60 * 60 * 24);

		BigDecimal calculate = new BigDecimal(bg);
		calculate = calculate.multiply(rate);
		calculate = calculate.multiply(invoice.getMoney());
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

	@Override
	public DataGrid getByPage(PageFilter pageFilter) {
		PageBounds pageBounds = PageFilterUtil.createPageBounds(pageFilter);
		DataGrid dg = new DataGrid();
		PageList roles = (PageList) invoiceMapper.selectAllInvoice(pageFilter,
				pageBounds);
		for (int i = 0; i < roles.size(); i++) {
			Invoice invoiceAddName = (Invoice) roles.get(i);
			for (int j = 1; j <= 5; j++) {
				int idRealName = 0;
				String realName = "";
				switch (j) {
				case 1: {
					idRealName = invoiceAddName.getProverId();
					realName = userMapper.selectRealNameById(idRealName);
					invoiceAddName.setProverName(realName);
				}
					break;
				case 2: {
					idRealName = invoiceAddName.getOperatorId();
					realName = userMapper.selectRealNameById(idRealName);
					invoiceAddName.setOperatorName(realName);
				}
					break;
				case 3: {
					idRealName = invoiceAddName.getAuditor1Id();
					realName = userMapper.selectRealNameById(idRealName);
					invoiceAddName.setAuditor1Name(realName);
				}
					break;
				case 4: {
					idRealName = invoiceAddName.getAuditor2Id();
					realName = userMapper.selectRealNameById(idRealName);
					invoiceAddName.setAuditor2Name(realName);
				}
					break;
				case 5: {
					idRealName = invoiceAddName.getDearerId();
					realName = userMapper.selectRealNameById(idRealName);
					invoiceAddName.setDearerName(realName);
				}
					break;
				}
			}
			roles.set(i, invoiceAddName);
			// //
		}
		dg.setRows(roles);
		dg.setTotal(roles.getPaginator().getTotalCount());
		return dg;
	}

	@Override
	public Invoice auditInvoice(Invoice invoice) {

		AuditState auditState = invoice.getAuditState();
		invoice = this.getById(invoice.getId());
		System.out.println(auditState.getId());
		invoice.setAuditState(auditState);

		// 需要修改
		// invoice.setDearerid(1);
		// invoice =this.getById(invoice.getId());
		// invoice.setAuditState(auditState);

		// invoice.setInvoiceDetailsId(invoice.getInvoiceDetails().getId());
		// invoice.setInvoiceTypeId(invoice.getInvoiceType().getId());

		//
		/*
		 * BigDecimal rate = this.getRate(); if(rate.equals(0)) rate = new
		 * BigDecimal("0.1");
		 * 
		 * // 计算罚款金额 BigDecimal calculatePenalty =
		 * this.calculatePenalty(invoice,rate); // 整合到service中
		 * 
		 * 
		 * // balance = role.get();
		 * 
		 * 
		 * 
		 * money = invoice.getMoney().subtract(calculatePenalty);
		 */

		BigDecimal money = null;
		money = invoice.getMoney();
		BigDecimal frozen = null;
		BigDecimal available = null;
		// frozen = money;
		int proverid = invoice.getProverId();
		Balance balance = new Balance();
		balance = iUserService.getBalanceById(proverid);
		available = balance.getAvailable();
		frozen = balance.getFrozen();
		// 审批人审核通过，冻结金额减少，

		if (invoice.getAuditState().getProver() == 0
				|| invoice.getAuditState().getProver() == 2) {
			invoice.getAuditState().setAuditor1(0);
			invoice.getAuditState().setAuditor2(0);
			invoice.getAuditState().setDearer(0);
		} else if (invoice.getAuditState().getAuditor1() == 0
				|| invoice.getAuditState().getAuditor1() == 2) {
			invoice.getAuditState().setAuditor2(0);
			invoice.getAuditState().setDearer(0);
		} else if (invoice.getAuditState().getAuditor2() == 0
				|| invoice.getAuditState().getAuditor2() == 2) {
			invoice.getAuditState().setDearer(0);
		}

		this.updateAuditStateOnly(auditState);
		if (invoice.getAuditState().getProver() == 1
				&& invoice.getAuditState().getAuditor1() == 1) {
			int control = 0;
			if (invoice.getAuditState().getDearer() == 2
					|| invoice.getAuditState().getDearer() == 1) {
				control = 1;
				if (invoice.getAuditState().getDearer() == 2) {
					available = available.add(money);
					// frozen = frozen.subtract(money);

				}
				// else {
				// frozen = frozen.subtract(money);
				// }
			}
			if (control == 0)
				if (invoice.getAuditState().getAuditor2() == 1) {

					frozen = frozen.subtract(money);
					// available=available.add(money);
				}// 如果有一个人审核失败，冻结金额减少，重新加入可用余额中
				else {
					if (invoice.getAuditState().getProver() == 2
							|| invoice.getAuditState().getAuditor1() == 2
							|| invoice.getAuditState().getAuditor2() == 2) {
						available = available.add(money);
						frozen = frozen.subtract(money);

					} else {
						if (invoice.getAuditState().getProver() == 0) {
							// available = available.subtract(money);
							// frozen = frozen.add(money);
						}
					}
				}
		}
		balance.setFrozen(frozen);
		balance.setAvailable(available);

		this.updateBalance(balance);
		return invoice;
	}

	@Override
	public Invoice saveInvoiceAndCalMoney(Invoice invoice) {

		java.sql.Date currentDate = new java.sql.Date(
				System.currentTimeMillis());
		System.out.println(currentDate);
		AuditState auditState = new AuditState();
		invoice.setAuditState(auditState);
		invoice.setCreateDate(currentDate);
		if (invoice.getInvoiceDetails() == null) {
			InvoiceDetails invoiceDetails = new InvoiceDetails();
			invoice.setInvoiceDetails(invoiceDetails);
		}
		// invoice.setDearerid(1);
		// invoice.setInvoiceDetailsId(invoice.getInvoiceDetails().getId());
		invoice.setInvoiceTypeId(invoice.getInvoiceType().getId());

		BigDecimal rate = this.getRate();
		BigDecimal zero = new BigDecimal(0);
		if (rate.equals(zero))
			rate = new BigDecimal("0.1");

		BigDecimal calculatePenalty = this.calculatePenalty(invoice, rate);
		invoice.setPenalty(calculatePenalty);
		int proverid = invoice.getProverId();
		System.out.println("prover" + proverid);
		Balance balance = new Balance();
		BigDecimal available = null;
		BigDecimal frozen = null;
		BigDecimal money = null;
		money = invoice.getMoney();
		System.out.println(money);
		balance = iUserService.getBalanceById(proverid);
		System.out.println(balance.getId() + "--" + balance.getAvailable());
		available = balance.getAvailable();
		frozen = balance.getFrozen();

		if (!calculatePenalty.equals(0)) {
			money = money.subtract(calculatePenalty);
		}
		invoice.setMoney(money);
		frozen = frozen.add(money.subtract(calculatePenalty));
		available = available.subtract(money);
		// balance.setId(proverid);
		balance.setAvailable(available);
		balance.setFrozen(frozen);
		System.out.println("------------" + balance);

		this.saveInvoiceAllSelective(invoice);
		this.updateBalance(balance);

		return invoice;
	}

	@Override
	public BigDecimal getRate() {
		BigDecimal bd = new BigDecimal(0);
		PenaltyRate pr = penaltyRateMapper.selectPenalRate();
		if (pr != null)
			return pr.getRate();
		return bd;
	}

}
