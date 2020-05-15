package kr.co.honorsville.membership;
 
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.honorsville.user.service.FrontUserService;
import lombok.extern.slf4j.Slf4j;
import kr.co.honorsville.admin.controller.DashboardController;
import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.user.dto.FrontUser;

 
@Controller
@Slf4j
@RequestMapping("/membership")
public class MembershipController {
	
	@Resource(name="FrontUser")
	private FrontUser user;		
	
	@Autowired
	private FrontUserService userService;
	
	@Autowired
    public JavaMailSender javaMailSender;
	
	@Value("${app.url}") 
	private String url;  		
 
    @RequestMapping("/login")
    public String login(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/membership/login";
    	else
    		return "membership/login";
    }
        
    @RequestMapping("/password-info")
    public String password_info(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/membership/password-info";
    	else
    		return "membership/password-info";
    }
    
    @RequestMapping("/find-id")
    public String find_id(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/membership/find-id";
    	else
    		return "membership/find-id";
    }
    
    @RequestMapping("/find-id/result")
    public String find_info(Device device, HttpServletRequest request, Model model) throws Exception {
    	
    	if(CommonUtils.isEmpty(request.getParameter("sDupInfo")) == true) {
    		return "redirect:/membership/find-id";
    	}    	
    	if(request.getParameter("sDupInfo") == null)
    		user.setCertInfo("");
    	else
    		user.setCertInfo(request.getParameter("sDupInfo"));
    	
    	if(request.getParameter("certType").contentEquals("20")) {
	    	if(request.getParameter("cellPhone") == null)
	    		user.setCellPhone("");
	    	else
	    		user.setCellPhone(request.getParameter("cellPhone"));
    	}
    	user.setUserId(null);
    	user.setPassword(null);
		FrontUser data = userService.getUserCheck(user);
		 
		model.addAttribute("data", data);
		
    	if (device.isMobile())
    		return "mobile/membership/find-id_result";
    	else
    		return "membership/find-id_result";
    }
    
    @RequestMapping("/find-password")
    public String find_password(Device device, HttpServletRequest request) {
    	
    	if (device.isMobile())
    		return "mobile/membership/find-password";
    	else
    		return "membership/find-password";
    }    
    
    @RequestMapping("/find-password/result")
    public String find_password_result(Device device, HttpServletRequest request, Model model) throws Exception {
    	
	    // 임시 비밀번호 생성
	    Random random = new Random();
	    String temp_pwd = random.nextInt(1000000)+"";
	    
    	if(CommonUtils.isEmpty(request.getParameter("userId")) == true) {
    		return "redirect:/membership/find-password";
    	}
    	
    	if(CommonUtils.isEmpty(request.getParameter("sDupInfo")) == true) {
    		return "redirect:/membership/find-password";
    	}
    	
    	user.setUserId(request.getParameter("userId"));
    	user.setPassword(null);
    	if(request.getParameter("sDupInfo") == null)
    		user.setCertInfo("");
    	else
    		user.setCertInfo(request.getParameter("sDupInfo"));
    	
    	if(request.getParameter("certType").contentEquals("20")) {
	    	if(request.getParameter("cellPhone") == null)
	    		user.setCellPhone("");
	    	else
	    		user.setCellPhone(request.getParameter("cellPhone"));
    	}
    	user.setPassword(null);
		FrontUser data = userService.getUserCheck(user);
		
		/* 메일 발송 */
		if(data != null) {
			user.setPassword(temp_pwd);
			long result = userService.updateUserPassword(user);
			
		    // 현재 시간
		    String datetime = CommonUtils.datetime();			

	    	ClassPathResource resource = new ClassPathResource("templates/email_template/customer_find_pw.html");
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
	    	content = content.replace("[_TEMP_PWD_]", temp_pwd);
	    	content = content.replace("[_DATE_]", datetime);
	    	content = content.replace("[_LOCATION_]", url+"/membership/login");
	    	   
		    MimeMessage message = javaMailSender.createMimeMessage();  
		   
		    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
		    helper.setTo(data.getEmail());  
		    helper.setSubject("[경남아너스빌] 임시 비밀번호 안내입니다.");  
		    helper.setText(content, true);  
		    javaMailSender.send(helper.getMimeMessage());		    
		}
		 
		model.addAttribute("data", data);
		
    	if (device.isMobile())
    		return "mobile/membership/find-password_result";
    	else
    		return "membership/find-password_result";
    }                
    
    @RequestMapping("/join/agreement")
    public String join_agreement(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/membership/join_agreement";
    	else
    		return "membership/join_agreement";
    }
    
    @RequestMapping("/join/form")
    public String join_form(Device device, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
		if(request.getParameter("cellPhone") != null)
			user.setCellPhone(request.getParameter("cellPhone")+"");
		user.setCertInfo(request.getParameter("certInfo")+"");
		
		if(request.getParameter("sDupInfo") == null) {
			response.sendRedirect("/membership/join/agreement");
		}
		
		FrontUser doc = userService.getUserCheck(user);  
		if(doc != null) {
			 response.sendRedirect("/membership/join/check?check=dup");
		}
		
    	
    	if (device.isMobile())
    		return "mobile/membership/join_form";
    	else
    		return "membership/join_form";
    }

    /*
     * 사용자 아이디 중복 확인
     */    
    @RequestMapping(value="/join/user_id_check", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> user_id_check(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();

		user.setUserId(request.getParameter("userId"));    
		FrontUser doc = userService.getUserId(user);
		Map<String, String> data = new HashMap<String, String>();
		
		if(doc == null) {
			// 사용가능
			data.put("result", "0");
			return (HashMap<String, String>) data;
		} else {
			// 사용중
			data.put("result", "1");
			return (HashMap<String, String>) data;
		}		
    }
    
    /*
     * 사용자 등록
     */    
    @RequestMapping(value="/join/register_user", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> registerUser(FrontUser user, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	  	    
	    // 현재 시간
	    String datetime = CommonUtils.datetime();
	    Map<String, String> data = new HashMap<String, String>();
	    // 중복 체크
	    FrontUser doc = userService.getUserId(user);

		if(doc == null) {
			// 사용가능
			Long result = userService.insertUser(user);
			if(result != null) {
				data.put("result", "0");
				return (HashMap<String, String>) data;
			} else {
				data.put("result", "1");
				return (HashMap<String, String>) data;
			}				
		} else {
			// 사용중
			data.put("result", "1");
			return (HashMap<String, String>) data;
		}			    
    }     
    
    
    
    @RequestMapping("/join/end")
    public String join_end(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/membership/join_end";
    	else
    		return "membership/join_end";
    }       
    
    @RequestMapping("/join/check")
    public String join_check(Device device, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getParameter("agree") == null && request.getParameter("check") == null) {
			response.sendRedirect("/membership/join/agreement");
		}
    	
    	if (device.isMobile())
    		return "mobile/membership/join_check";
    	else
    		return "membership/join_check";
    }       
    
    /*
     * 사용자 비밀번호 90일 뒤 변경
     */    
    @RequestMapping(value="/time_update", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> editUser(FrontUser user, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	  	    
	    // 현재 시간
	    String datetime = CommonUtils.datetime();
	    Map<String, String> data = new HashMap<String, String>();
	    
	    // 정보 확인
	    user.setUserId(session.getAttribute("userId")+"");
	    FrontUser doc = userService.getUserId(user);

		if(doc != null) {
			// 사용가능
			Long result = userService.updateUserUpTime(user);
			if(result != null) {
				data.put("result", "0");
				return (HashMap<String, String>) data;
			} else {
				data.put("result", "1");
				return (HashMap<String, String>) data;
			}				
		} else {
			// 사용중
			data.put("result", "1");
			return (HashMap<String, String>) data;
		}			    
    }       
}
