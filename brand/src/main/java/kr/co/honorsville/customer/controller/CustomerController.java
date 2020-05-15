package kr.co.honorsville.customer.controller;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 
@Controller
@RequestMapping("/customer")
public class CustomerController {
 
    @RequestMapping("/info")
    public String info(Device device, HttpServletRequest request) {
    	
    	if (device.isMobile())
    		return "mobile/customer/info";
    	else
    		return "customer/info";
    }
}
