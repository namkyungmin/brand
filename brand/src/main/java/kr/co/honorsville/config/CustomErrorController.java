package kr.co.honorsville.config;

/*
 *  Error 컨트롤러
 */

import java.util.Date;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.mobile.device.Device;
import org.springframework.session.jdbc.config.annotation.web.http.EnableJdbcHttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 
import lombok.extern.slf4j.Slf4j;
 
@EnableJdbcHttpSession
@Controller
@Slf4j
public class CustomErrorController implements ErrorController {
 
    private static final String ERROR_PATH = "/error";
 
    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
    
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Device device, Model model,HttpSession session) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        //HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));
        //HttpSession session = request.getSession();
        
        //log.info("httpStatus : "+httpStatus.toString());
        //model.addAttribute("code", status.toString());
        //model.addAttribute("msg", httpStatus.getReasonPhrase());
        //model.addAttribute("timestamp", new Date());
        model.addAttribute("session", session);
        model.addAttribute("userId", session.getAttribute("userId"));
        if (device.isMobile())
        	return "mobile/error/error";
        else
        	return "error/error";
    }
    
    @RequestMapping("/404")
    public String handleError404(HttpServletRequest request, Device device, Model model,HttpSession session) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        
        model.addAttribute("userId", session.getAttribute("userId"));
        model.addAttribute("session", session);
        if (device.isMobile())
        	return "mobile/error/error";
        else
        	return "error/error";
    }    
 
}