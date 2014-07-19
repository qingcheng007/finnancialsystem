package com.ztyj6.fs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Invoice;
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
	@RequestMapping("/add")
	public Json add(Invoice invoice, HttpSession session) {
		Json json = new Json();
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
		String msg = "";
		try {
			iInvoiceService.delete(ids);
			msg = "删除成功";
			json.setSuccess(true);
			json.setMsg(msg);
		} catch (Exception e) {
			e.printStackTrace();
			msg = "删除失败";
			json.setSuccess(false);
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
