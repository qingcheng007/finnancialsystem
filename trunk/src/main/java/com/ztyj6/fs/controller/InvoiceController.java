package com.ztyj6.fs.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.AuditState;
import com.ztyj6.fs.model.Balance;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.model.PenaltyRate;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IInvoiceService;
import com.ztyj6.fs.service.IUserService;

@Controller
@RequestMapping("/invoiceController")
public class InvoiceController extends BaseController {
	IInvoiceService iInvoiceService;

	IUserService iUserService;

	public IUserService getiUserService() {
		return iUserService;
	}

	@Autowired
	public void setiUserService(IUserService iUserService) {
		this.iUserService = iUserService;
	}

	public IInvoiceService getiInvoiceService() {
		return iInvoiceService;
	}

	@Autowired
	public void setiInvoiceService(IInvoiceService iInvoiceService) {
		this.iInvoiceService = iInvoiceService;
	}

	@ResponseBody
	@RequestMapping("/getInvoiceAll")
	public Json selectInvoiceAll(HttpSession session) {
		Json json = new Json();
		String message = "";
		List<Invoice> invoiceList = iInvoiceService.getInvoiceAll();
		if (invoiceList.size() != 0) {
			json.setSuccess(true);
			json.setObj(invoiceList);
		} else {
			json.setSuccess(false);
		}

		return json;
	}

	@ResponseBody
	@RequestMapping("/getAllTest")
	public List getAllTest(HttpSession session) {
		List<InvoiceType> invoiceType;

		try {
			invoiceType = iInvoiceService.getInvoiceTypeAll();
		} catch (Exception e) {
			return null;
		}
		return invoiceType;
	}

	@ResponseBody
	@RequestMapping("/admin/add")
	public Json addtest(@RequestBody Invoice invoice, HttpSession session) {
		Json j = new Json();
		try {
			SecurityContext ctx = (SecurityContext) session
					.getAttribute("SPRING_SECURITY_CONTEXT");

			// System.out.println("--------"+((Invoice)
			// (ctx.getAuthentication().getPrincipal())).getId());
			// System.out.println("-------content:"+invoice.getContent());
			System.out.println("-------content:"
					+ invoice.getInvoiceDetails().getId()
					+ invoice.getContent());
			System.out.println("-------content:" + invoice.getDescription());
			invoice.setId(((Invoice) (ctx.getAuthentication().getPrincipal()))
					.getId());
			Date createdate = new Date(0);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date now = new Date(0);
			String nowDate = sdf.format(now).toString();
			createdate = (Date) sdf.parse(nowDate);
			System.out.println(createdate);

			
			
		//	invoice.setCreatedate(createdate);
			// invoice.setOccurdate(occurdate);
			invoice.setInvoicedetailsid(((Invoice) (ctx.getAuthentication()
					.getPrincipal())).getInvoicetypeid());
			iInvoiceService.save(invoice);
			// Invoice invoiceReturn = new Invoice();
			// invoiceReturn = iInvoiceService.getById(invoice.getId());
			j.setSuccess(true);
			j.setObj(invoice);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg("添加失败！");
		}
		return j;
	}

	@ResponseBody
	@RequestMapping("/add")
	public Json add(@RequestBody Invoice invoice, HttpSession session) throws ParseException {
		Json json = new Json();
		// SecurityContext ctx = (SecurityContext)
		// session.getAttribute("SPRING_SECURITY_CONTEXT");
		// System.out.println("------------------"+((Invoice)
		// (ctx.getAuthentication().getPrincipal())).getId());
		// invoice.setCreateRealname(((Invoice)
		// (ctx.getAuthentication().getPrincipal())).getRealname());
		// System.out.println("------"+invoice.getContent()+invoice.getInvoiceType().getId()+"--date:"+invoice.getCreatedate());
		// System.out.println("-------content:"+invoice.getPhotourl());
		java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
		System.out.println(currentDate);
		AuditState auditState = new AuditState();
		invoice.setAuditState(auditState);
		invoice.setCreateDate(currentDate);
		
		// invoice.setDearerid(1);
		invoice.setInvoicedetailsid(invoice.getInvoiceDetails().getId());
		invoice.setInvoicetypeid(invoice.getInvoiceType().getId());
		
		//Date createdate = new Date();
		
		
		String msg = "";
		try {
			iInvoiceService.saveInvoiceAllSelective(invoice);
			BigDecimal rate = new BigDecimal("0.1");
			BigDecimal calculatePenalty = iInvoiceService.calculatePenalty(
					invoice, rate);
			int proverid = invoice.getProverid();
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
			frozen = frozen.add(money.subtract(calculatePenalty));
			available = available.subtract(money);
			// balance.setId(proverid);
			balance.setAvailable(available);
			balance.setFrozen(frozen);
			System.out.println("------------" + balance);
			iInvoiceService.updateBalance(balance);

			msg = "添加成功";
			json.setSuccess(true);
			json.setObj(invoice);
			json.setMsg(msg);
		} catch (Exception e) {
			msg = "添加失败";
			json.setMsg(msg);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/audit")
	public Json audit(@RequestBody Invoice invoice, HttpSession session) {
		Json json = new Json();

		// SecurityContext ctx = (SecurityContext)
		// session.getAttribute("SPRING_SECURITY_CONTEXT");
		// System.out.println("------------------"+((Invoice)
		// (ctx.getAuthentication().getPrincipal())).getId());
		// invoice.setCreateRealname(((Invoice)
		// (ctx.getAuthentication().getPrincipal())).getRealname());
		// System.out.println("------"+invoice.getContent()+invoice.getInvoiceType().getId()+"--date:"+invoice.getCreatedate());
		// System.out.println("-------content:"+invoice.getPhotourl());
		AuditState auditState = invoice.getAuditState();
		System.out.println(auditState.getId());
		Invoice invoiceNew = new Invoice();
		iInvoiceService.updateAuditStateOnly(auditState);
		// 需要修改
		// invoice.setDearerid(1);
		invoice.setInvoicedetailsid(invoice.getInvoiceDetails().getId());
		invoice.setInvoicetypeid(invoice.getInvoiceType().getId());

		//
		// BigeDecimal rate = iInvoiceService.getRate();
		BigDecimal rate = new BigDecimal("0.1");

		// 计算罚款金额
		BigDecimal calculatePenalty = iInvoiceService.calculatePenalty(invoice,
				rate);
		// 整合到service中

		Balance balance = new Balance();
		// balance = role.get();
		BigDecimal frozen = null;
		BigDecimal available = null;
		int proverid = invoice.getProverid();
		BigDecimal money = null;
		money = invoice.getMoney().subtract(calculatePenalty);
		// frozen = money;
		balance = iUserService.getBalanceById(proverid);
		available = balance.getAvailable();
		frozen = balance.getFrozen();
		// 审批人审核通过，冻结金额减少，
		int control = 0;
		if (invoice.getAuditState().getDearer() == 2
				|| invoice.getAuditState().getDearer() == 1) {
			if (invoice.getAuditState().getDearer() == 2) {
				available = available.add(money);
				// frozen = frozen.subtract(money);
				control = 1;
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

		balance.setFrozen(frozen);
		balance.setAvailable(available);

		iInvoiceService.updateBalance(balance);

		String msg = "";
		try {
			invoiceNew = iInvoiceService.getById(invoice.getId());
			msg = "添加成功";
			json.setSuccess(true);
			json.setObj(invoiceNew);
			json.setMsg(msg);
		} catch (Exception e) {
			msg = "添加失败";
			json.setMsg(msg);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/delete")
	public Json delete(String ids) {
		Json json = new Json();
		System.out.println(ids);
		String msg = "";
		try {
			iInvoiceService.delete(ids);
			msg = "删除成功";
			json.setSuccess(true);
			json.setMsg(msg);
		} catch (Exception e) {
			e.printStackTrace();
			msg = "删除失败";
			json.setMsg(msg);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/getByPage")
	public DataGrid getByPage(PageFilter pageFilter) {

		try {
			return iInvoiceService.getByPage(pageFilter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@ResponseBody
	@RequestMapping("/geTPageById")
	public DataGrid geTByPageByid(PageFilter pageFilter,
			HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println(id);
		try {
			return iInvoiceService
					.getPageById(pageFilter, Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@ResponseBody
	@RequestMapping("/doGetPageById")
	public DataGrid doGetByPageByid(PageFilter pageFilter,
			HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println(id);
		try {
			return iInvoiceService
					.getPageById(pageFilter, Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@ResponseBody
	@RequestMapping("/edit")
	public Json edit(Invoice invoice) {
		Json json = new Json();

		String msg = "";
		try {
			iInvoiceService.update(invoice);
			msg = "更新成功";
			json.setSuccess(true);
			json.setMsg(msg);
		} catch (Exception e) {
			msg = "更新失败";
			json.setSuccess(false);
			json.setMsg(msg);
			e.printStackTrace();
		}
		return json;
	}

}
