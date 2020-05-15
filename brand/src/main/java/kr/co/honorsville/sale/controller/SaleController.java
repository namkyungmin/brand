package kr.co.honorsville.sale.controller;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 
@Controller
@RequestMapping("/sale")
public class SaleController {
 
    @RequestMapping("/list")
    public String list(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/sale/list";
    	else
    		return "sale/list";
    }
    
    @RequestMapping(value = {"/list/view", "/view"})
    public String view(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/sale/view";
    	else
    		return "sale/view";
    }
    
    @RequestMapping("/view_dangjin")
    public String view_dangjin(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/sale/view_dangjin";
    	else
    		return "sale/view_dangjin";
    }
    
    @RequestMapping("/view_bukhansan")
    public String view_bukhansan(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/sale/view_bukhansan";
    	else
    		return "sale/view_bukhansan";
    }    
    
    
    
}
