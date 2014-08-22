package com.ztyj6.fs.controller;

import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.model.User;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IInvoiceService;


@Controller
@RequestMapping("/invoiceController")
public class InvoiceController extends BaseController {
	IInvoiceService iInvoiceService;



	public IInvoiceService getiInvoiceService() {
		return iInvoiceService;
	}

	@Autowired
	public void setiInvoiceService(IInvoiceService iInvoiceService) {
		this.iInvoiceService = iInvoiceService;
	}


	@ResponseBody
	@RequestMapping("/admin/add")
	public Json add(@RequestBody Invoice invoice, HttpSession session) throws ParseException {
		Json json = new Json();
	
	
		invoice = iInvoiceService.saveInvoiceAndCalMoney(invoice);
		
		String msg = "";
		try {
			msg = "添加成功";
			json.setSuccess(true);
			json.setObj(iInvoiceService.saveInvoiceAllContent(invoice));
			json.setMsg(msg);
		} catch (Exception e) {
			msg = "添加失败";
			json.setMsg(msg);
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/admin/audit")
	public Json admin_audit(@RequestBody Invoice invoice, HttpSession session) {
		Json json = new Json();

		Invoice invoiceNew = new Invoice();
		iInvoiceService.auditInvoice(invoice);

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
	@RequestMapping("/audit")
	public Json audit(@RequestBody Invoice invoice, HttpSession session) {
		Json json = new Json();

		Invoice invoiceNew = new Invoice();
		iInvoiceService.auditInvoice(invoice);

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
	@RequestMapping("/admin/delete")
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
	@RequestMapping("/admin/getInvoiceAll")
	public DataGrid getByPage(PageFilter pageFilter,HttpSession session) {
	
		try {
			return iInvoiceService.getByPage(pageFilter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@ResponseBody
	@RequestMapping("/getUserAll")
	public DataGrid getUserAll(PageFilter pageFilter,HttpSession session) {
	
		SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Integer id = ((User) (ctx.getAuthentication().getPrincipal())).getId();
		System.out.println(id);
		try {
			return iInvoiceService.getUserAll(pageFilter, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@ResponseBody
	@RequestMapping("/audit/getAuditAll")
	public DataGrid getAuditAll(PageFilter pageFilter,HttpSession session) {
	
		try {
			return iInvoiceService.getByPage(pageFilter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@ResponseBody
	@RequestMapping("/myInvoice/getMyInvoice")
	public DataGrid getMyInvoice(PageFilter pageFilter,	HttpServletRequest request,HttpSession session) {
		SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Integer id = ((User) (ctx.getAuthentication().getPrincipal())).getId();
		try {
			return iInvoiceService.getByPageCurrentID(pageFilter, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@ResponseBody
	@RequestMapping("/myAudit/getMyAudit")
	public DataGrid getMyAudit(PageFilter pageFilter,HttpServletRequest request,HttpSession session) {
		SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Integer id = ((User) (ctx.getAuthentication().getPrincipal())).getId();
		System.out.println(id);
		try {
			return iInvoiceService.getPageById(pageFilter, id);
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
	@RequestMapping("/admin/edit")
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
