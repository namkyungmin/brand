package kr.co.honorsville.admin.controller;

import java.io.Console;

/*
 *  ADMIN 컨트롤러
 */

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.admin.dto.AdminAccessIp;
import kr.co.honorsville.admin.dto.File;
import kr.co.honorsville.admin.dto.User;
import kr.co.honorsville.admin.service.AdminService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.FileUtils;
import lombok.extern.slf4j.Slf4j;
 
@Controller
@Slf4j
@RequestMapping("/smadmin")
public class DashboardController {

	@Resource
	private Admin admin;
	
	@Resource
	private User user;	
	
	@Resource
	private AdminAccessIp adminAccessIp;								
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
    public JavaMailSender javaMailSender;
	
    
    @Autowired
	FileUtils fileService;    
	
    /*
     * 로그인 페이지
     */        
    @RequestMapping(value = {"/", "/login"})
    public String index(Device device, HttpServletRequest request, AdminAccessIp adminAccessIp) throws Exception {
    	adminAccessIp.setIpAddr(CommonUtils.getIp(request));
    	adminAccessIp = adminService.getAdminAccessIp(adminAccessIp);
    			
    	if(adminAccessIp == null) {
    		return "redirect:/";
    	}
    	return "admin/login";
    }	
	
   
    /*
     * 메인
     */        
    @RequestMapping("/main")
    public String main(Device device, HttpServletRequest request) {
    		return "admin/main";
    }    

    /*
     * 내 정보 수정
     */        
    @RequestMapping("/mypage")
    public String mypage(Device device, HttpServletRequest request, Model model, HttpSession httpSession) throws Exception {
    	
			admin.setAdminId(httpSession.getAttribute("adminId").toString());
			
			Admin data = adminService.getAdminId(admin);    	
    	
    		model.addAttribute("data", data);
    		
    		return "admin/mypage";
    }        
    
    /*
     * 내 정보 수정
     */        
    @RequestMapping("/mypage_update")
    public @ResponseBody HashMap<String, String> mypage_update(Device device, HttpServletRequest request, Model model, HttpSession httpSession) throws Exception {
    	
			admin.setAdminId(httpSession.getAttribute("adminId").toString());
			admin.setPassword(request.getParameter("password"));
			
			Admin doc = adminService.getAdmin(admin);

			Map<String, String> data = new HashMap<String, String>();
		
			if(doc != null) {
				// 개인정보 셋팅
				admin.setAdminIdx(Long.valueOf(request.getParameter("adminIdx")));
				admin.setDept(request.getParameter("dept"));
				admin.setEmail(request.getParameter("email"));
				admin.setPassword(request.getParameter("new_password"));
				
				// 개인정보 업데이트
				Long result = adminService.updateMypage(admin);
				
				data.put("result", "0");
				
				return (HashMap<String, String>) data;
			} else {
				data.put("result", "1");
				
				return (HashMap<String, String>) data;
			}			
    }            

    
    /*
     * 로그인
     */      
    @RequestMapping(value="/login_proc", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody HashMap<String, String> login_proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	response.setContentType("text/html;charset=UTF-8");
    	
	    HttpSession session = request.getSession();
	    
	    Map<String, String> data = new HashMap<String, String>();
	    
		admin.setAdminId(request.getParameter("adminId"));
		
		Admin doc = adminService.getAdminId(admin);
		Integer loginCnt = 0;
		if(doc != null) {
			if(doc.getLoginTryCnt() >= 5 && doc.getTimeDiff() <240 ) {
				data.put("result", "-1");
				return (HashMap<String, String>) data;
			}
			
			loginCnt = doc.getLoginTryCnt();
		}
			
		admin.setPassword(request.getParameter("password"));
		doc = adminService.getAdmin(admin);
		
		if(doc != null) {
			if(doc.getEndDate() != null) {
				data.put("result", "-2");
				return (HashMap<String, String>) data;				
			}
			Long Result = adminService.updateAdminLoginCntReset(admin);
			
		    session.setAttribute("adminId", doc.getAdminId());
		    session.setAttribute("adminName", doc.getAdminName());
		    session.setAttribute("adminRole", doc.getRole());
		    session.setAttribute("adminType", doc.getAdminType());		    
		    
			admin.setAdminId(doc.getAdminId());
			admin.setAdminName(doc.getAdminName());
			admin.setRole(doc.getRole());
			admin.setAdminType(doc.getAdminType());
			
			data.put("adminId", doc.getAdminId());
			data.put("adminName", doc.getAdminName());
			data.put("adminRole", doc.getRole());
			data.put("adminType", doc.getAdminType());
			data.put("adminStatus", doc.getStatus());
			data.put("result", "0");
			if(doc.getStatus().equals("T"))
				data.put("location", "mypage");
			else
				data.put("location", "main");
			
			return (HashMap<String, String>) data;
		} else {
			admin.setAdminId(request.getParameter("adminId"));
			
			Long Result = adminService.updateAdminLoginCnt(admin);
			
			data.put("adminId", "ERROR");
			data.put("adminName", "ERROR");
			data.put("loginCnt", (loginCnt+1)+"");
			data.put("result", "1");
			data.put("location", "");
			
			return (HashMap<String, String>) data;
		}
		
	}
    
	@RequestMapping( "/uploadFile" )
	public @ResponseBody HashMap<String, String> upload(
			Model model,
			HttpServletRequest request,
			@RequestParam("file") MultipartFile file) {
		
		Map<String, String> result = null;
		
		result = fileService.upload(file, request);

		return (HashMap<String, String>) result;
	}    
    
    /*
     * 로그아웃
     */      
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("adminId", null);
		request.getSession().setAttribute("adminName", null);
		request.getSession().setAttribute("adminRole", null);
		request.getSession().setAttribute("adminType", null);
		request.getSession().invalidate();
        
		return "redirect:/smadmin/login";
	}
	

	
    @RequestMapping("/mailSend")
    public  @ResponseBody Map<String, String>  get(HttpServletRequest request) throws Exception{
    	    	
    	Map<String, String> data = new HashMap<String, String>();
 
    	ClassPathResource resource = new ClassPathResource("templates/email_template/customer_answer.html");
    	String mail_content = "";
    	
		try {
		    Path path = Paths.get(resource.getURI());
		    List<String> content = Files.readAllLines(path);
		    for(String str : content) {
		    	mail_content += str;
		    }
		} catch (IOException e) {
		    log.error("{}", e.getMessage(), e);
		}    
    	String content = mail_content;
    	content = content.replace("[_NAME_]", "이름");
    	content = content.replace("[_DATE_]", "일짜");
    	
     	
    	   
	    MimeMessage message = javaMailSender.createMimeMessage();  
	   
	    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
	    //helper.setTo("cooper.sendmail@gmail.com");
	    helper.setTo("honorsville.sender@gmail.com");
	    helper.setSubject("COOPER!!! WELCOME");  
	    helper.setText(content, true);  
	    javaMailSender.send(helper.getMimeMessage());  
    	     
    	data.put("result", "0");
    	
		
		return (HashMap<String, String>) data;
    	
    }    
}
