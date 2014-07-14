package com.ztyj6.fs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ztyj6.fs.model.Invoice;
import com.ztyj6.fs.model.Site;
import com.ztyj6.fs.model.page.Json;
import com.ztyj6.fs.service.IInvoiceService;



@Controller
@RequestMapping("/invoiceController")
public class InvoiceController {
	IInvoiceService iInvoiceService;

	public IInvoiceService getiInvoiceService() {
		return iInvoiceService;
	}

	@Autowired
	public void setiInvoiceService(IInvoiceService iInvoiceService) {
		this.iInvoiceService = iInvoiceService;
	}
    @ResponseBody
    @RequestMapping("/selectInvoiceAll")
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
	

}
