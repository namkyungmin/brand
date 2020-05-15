package kr.co.honorsville.util.controller;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 
@Controller
@RequestMapping("/util")
public class UtilController {
 
    @RequestMapping("/email-security")
    public String emailSecurity(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/util/email-security";
    	else
    		return "util/email-security";
    }
    
    @RequestMapping("/privacy")
    public String privacy(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/util/privacy";
    	else
    		return "util/privacy";
    }
    
    @RequestMapping("/user-guidelines")
    public String userGuidelines(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/util/user-guidelines";
    	else
    		return "util/user-guidelines";
    }    
}
