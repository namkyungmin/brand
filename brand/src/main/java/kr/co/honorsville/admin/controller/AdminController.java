package kr.co.honorsville.admin.controller;

import java.io.Console;

/*
 *  ADMIN 컨트롤러
 */

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

import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.admin.dto.AdminAccessIp;
import kr.co.honorsville.admin.dto.User;
import kr.co.honorsville.admin.service.AdminService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.Pagination;
import lombok.extern.slf4j.Slf4j;
 
@Controller
@Slf4j
@PropertySource("classpath:application.properties")
@RequestMapping("/smadmin")
public class AdminController {

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
	
	@Value("${app.url}") 
	private String url;  	
	
    /*
     * 운영자관리 리스트
     */        
    @RequestMapping("/admin/admin_list")
    public String admin_list(Device device, HttpServletRequest request, 
    						@RequestParam(defaultValue="1") int curPage, 
    						@RequestParam(defaultValue="") String searchKey,
    						@RequestParam(defaultValue="") String searchValue,
    						Model model) throws Exception {

    		// 검색 조건 셋팅
    		admin.setSearchKey(searchKey);
    		admin.setSearchValue(searchValue);
    		
	        // 전체리스트 개수
	        int listCnt = adminService.getAdminListCnt(admin);    	
    	
	        // 페이징 셋팅
    	 	Pagination pagination = new Pagination(listCnt, curPage);
    	 	
    	 	admin.setStartIndex(pagination.getStartIndex());
    	 	admin.setCntPerPage(pagination.getPageSize());
    	 	
            // 전체리스트 출력
            List<Admin> list = adminService.getAdminList(admin);
                    
            model.addAttribute("list", list);
            model.addAttribute("listCnt", listCnt);
    	 	
    	 	model.addAttribute("pagination", pagination);
    	
    		return "admin/admin/admin_list";
    }            
    
    /*
     * 운영자관리 상세
     */        
    @RequestMapping("/admin/admin_detail")
    public String admin_detail(Device device, HttpServletRequest request, Model model, Admin admin) throws Exception {
    	
		//admin.setAdminId("master");
		
    	if(!CommonUtils.isEmpty(request.getParameter("admin_idx"))) {
    		admin.setAdminIdx(Long.valueOf(request.getParameter("admin_idx")));
    		admin = adminService.getAdminIdx(admin);    	
    	}
		
		if(admin != null) {
			model.addAttribute("data", admin);
		} else
			model.addAttribute("data", admin);
    		
    	return "admin/admin/admin_detail";
    }
    
    
    /*
     * 관리자 등록
     */    
    @RequestMapping(value="/admin/insert_admin", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> insertAdmin(Admin admin, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();

	    // 임시 비밀번호 생성
	    Random random = new Random();
	    String temp_pwd = random.nextInt(1000000)+"";
	    
	    admin.setPassword(temp_pwd);
	    
	    // 현재 시간
	    String datetime = CommonUtils.datetime();
	    

	    Long result = adminService.insertAdmin(admin);
	    
	    
		Map<String, String> data = new HashMap<String, String>();
		
		if(result != null) {
			data.put("result", "0");
			
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
	    	content = content.replace("[_LOCATION_]", url+"/smadmin/");
	    	   
		    MimeMessage message = javaMailSender.createMimeMessage();  
		   
		    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
		    helper.setTo(admin.getEmail());  
		    helper.setSubject("[경남아너스빌] 신규 관리자가 등록되었습니다.");  
		    helper.setText(content, true);  
		    javaMailSender.send(helper.getMimeMessage());
			
			return (HashMap<String, String>) data;
		} else {
			data.put("result", "1");
			
			return (HashMap<String, String>) data;
		}		
    }    
    
    
    /*
     * 관리자 수정
     */    
    @RequestMapping(value="/admin/update_admin", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> updateAdmin(Admin admin, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();

	    Long result = adminService.updateAdmin(admin);
		Map<String, String> data = new HashMap<String, String>();
		
		if(result != null) {
			data.put("result", "0");
			
			return (HashMap<String, String>) data;
		} else {
			data.put("result", "1");
			
			return (HashMap<String, String>) data;
		}		
    }    
    
    
    /*
     * 관리자 삭제
     */    
    @RequestMapping(value="/admin/delete_admin", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> deleteAdmin(Admin admin, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    admin.setAdminIdx(Long.valueOf(request.getParameter("adminIdx")));
	    Long result = adminService.deleteAdmin(admin);
		Map<String, String> data = new HashMap<String, String>();
		
		if(result != null) {
			data.put("result", "0");
			
			return (HashMap<String, String>) data;
		} else {
			data.put("result", "1");
			
			return (HashMap<String, String>) data;
		}		
    }        
    
    /*
     * 관리자 수정
     */    
    @RequestMapping(value="/admin/update_admin_password", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> resetAdminPassword(Admin admin, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    
	    // 임시 비밀번호 생성
	    Random random = new Random();
	    String temp_pwd = random.nextInt(1000000)+"";
	    admin.setAdminIdx(Long.valueOf(request.getParameter("adminIdx")));
	    admin.setPassword(temp_pwd);
	    
	    // 현재 시간
	    String datetime = CommonUtils.datetime();	    

	    Long result = adminService.resetAdminPassword(admin);
		Map<String, String> data = new HashMap<String, String>();
		
		// 관리자 정보
		admin.setAdminIdx(Long.valueOf(request.getParameter("adminIdx")));
		admin = adminService.getAdminIdx(admin);
		
		if(result != null) {
			data.put("result", "0");
			//data.put("msg", "초기화가 완료되었습니다.");
			
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
	    	content = content.replace("[_LOCATION_]", url+"/smadmin/");
	    	   
		    MimeMessage message = javaMailSender.createMimeMessage();  
		   
		    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
		    helper.setTo(admin.getEmail());  
		    helper.setSubject("[경남아너스빌] 관리자 비밀번호가 초기화되었습니다.");  
		    helper.setText(content, true);  
		    javaMailSender.send(helper.getMimeMessage());
			
			return (HashMap<String, String>) data;
		} else {
			data.put("result", "1");
			//data.put("msg", "초기화가 실패하였습니다.");						
			
			return (HashMap<String, String>) data;
		}		
    }    
        
    
    /*
     * 관리자 아이디 중복 확인
     */    
    @RequestMapping(value="/admin/admin_id_check", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> admin_id_check(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();

		admin.setAdminId(request.getParameter("adminId"));    
		Admin doc = adminService.getAdminId(admin);
		Map<String, String> data = new HashMap<String, String>();
		
		if(doc == null) {
			data.put("result", "0");
			//data.put("msg", "사용이 가능한 아이디 입니다.");			
			
			return (HashMap<String, String>) data;
		} else {
			data.put("result", "1");
			//data.put("msg", "이미 사용중인 아이디입니다.");						
			
			return (HashMap<String, String>) data;
		}		
    }    
     
}
