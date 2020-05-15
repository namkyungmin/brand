package kr.co.honorsville.brand.controller;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 
@Controller
@RequestMapping("/brand")
public class BrandController {
 
    @RequestMapping("/brandstory")
    public String brandstroy(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/brand/brandstory";
    	else
    		return "brand/brandstory";
    }
    
    @RequestMapping("/bi")
    public String bi(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/brand/bi";
    	else
    		return "brand/bi";
    }
    
    @RequestMapping("/item")
    public String item(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/brand/item";
    	else
    		return "brand/item";
    }    
 
}
