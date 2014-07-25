package com.ztyj6.fs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.AuditState;
import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.InvoiceType;
import com.ztyj6.fs.model.Post;
import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.page.DataGrid;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.model.page.PageFilter;
import com.ztyj6.fs.service.IInvoiceService;







@Controller
@RequestMapping("/invoiceController")
public class InvoiceController extends BaseController{
	IInvoiceService iInvoiceService;

	public IInvoiceService getiInvoiceService() {
		return iInvoiceService;
	}

	@Autowired
	public void setiInvoiceService(IInvoiceService iInvoiceService) {
		this.iInvoiceService = iInvoiceService;
	}
	

	
    @ResponseBody
    @RequestMapping("/getInvoiceAll")
    public Json selectInvoiceAll(HttpSession session){
    	Json json = new Json();
    	String message ="";
    	List<Invoice> invoiceList = iInvoiceService.getInvoiceAll();
    	if(invoiceList.size()!=0)
    	{
    	json.setSuccess(true);
    	json.setObj(invoiceList);
    	}
    	else
    	{
    		json.setSuccess(false);
    	}
    
    	return json;
    }
    @ResponseBody
    @RequestMapping("/getAllTest")
    public List getAllTest(HttpSession session){
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
			SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
			System.out.println("----------------------------------------------------------------------------");
			//System.out.println("--------"+((Invoice) (ctx.getAuthentication().getPrincipal())).getId());
			//System.out.println("-------content:"+invoice.getContent());
			System.out.println("-------content:"+invoice.getInvoiceDetails().getId()+invoice.getContent());
			System.out.println("-------content:"+invoice.getDescription());
			invoice.setId(((Invoice) (ctx.getAuthentication().getPrincipal())).getId());
			invoice.setInvoicedetailsid(((Invoice) (ctx.getAuthentication().getPrincipal())).getInvoicetypeid());
			iInvoiceService.save(invoice);
			j.setSuccess(true);
			j.setObj(invoice);
			j.setMsg("添加成功！");
		}  catch (Exception e) {
			j.setMsg("添加失败！");
		}
		return j;
	}
    
	@ResponseBody
	@RequestMapping("/add")
	public Json add(@RequestBody Invoice invoice, HttpSession session) {
		Json json = new Json();
		//SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		//System.out.println("------------------"+((Invoice) (ctx.getAuthentication().getPrincipal())).getId());
		//invoice.setCreateRealname(((Invoice) (ctx.getAuthentication().getPrincipal())).getRealname());
		//System.out.println("------"+invoice.getContent()+invoice.getInvoiceType().getId()+"--date:"+invoice.getCreatedate());
		//System.out.println("-------content:"+invoice.getPhotourl());
		AuditState auditState = new AuditState();
		invoice.setAuditState(auditState);
		//需要修改
		//invoice.setDearerid(1);
		invoice.setInvoicedetailsid(invoice.getInvoiceDetails().getId());
		invoice.setInvoicetypeid(invoice.getInvoiceType().getId());
		
		String msg = "";
		try {
			iInvoiceService.saveInvoiceAllSelective(invoice);
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
		//SecurityContext ctx = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		//System.out.println("------------------"+((Invoice) (ctx.getAuthentication().getPrincipal())).getId());
		//invoice.setCreateRealname(((Invoice) (ctx.getAuthentication().getPrincipal())).getRealname());
		//System.out.println("------"+invoice.getContent()+invoice.getInvoiceType().getId()+"--date:"+invoice.getCreatedate());
		//System.out.println("-------content:"+invoice.getPhotourl());
		AuditState auditState = invoice.getAuditState();
		iInvoiceService.updateAuditState(invoice, 1);//(auditState);
		//需要修改
		//invoice.setDearerid(1);
		invoice.setInvoicedetailsid(invoice.getInvoiceDetails().getId());
		invoice.setInvoicetypeid(invoice.getInvoiceType().getId());
		
		Invoice invoiceNew =iInvoiceService.getById(invoice.getId());
		
		String msg = "";
		try {
			iInvoiceService.saveInvoiceAllSelective(invoice);
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
	@RequestMapping("/getPageById")
	public DataGrid getByPageByid(PageFilter pageFilter,HttpServletRequest request) {
		String id=request.getParameter("id");
		System.out.println(id);
		try {
			return iInvoiceService.getPageById(pageFilter,Integer.parseInt(id));
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
