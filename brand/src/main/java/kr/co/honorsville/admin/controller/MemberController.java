package kr.co.honorsville.admin.controller;

import java.io.Console;

/*
 *  ADMIN 컨트롤러
 */

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.admin.dto.AdminAccessIp;
import kr.co.honorsville.admin.dto.User;
import kr.co.honorsville.admin.dto.UserRetire;
import kr.co.honorsville.admin.service.UserService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.Pagination;
import lombok.extern.slf4j.Slf4j;
 
@Controller
@Slf4j
@RequestMapping("/smadmin")
public class MemberController {

	@Resource
	private Admin admin;
	
	@Resource
	private User user;	
	
	@Resource
	private UserRetire userRetire;				
	
	@Resource
	private AdminAccessIp adminAccessIp;								
	
	@Autowired
	private UserService userService;	
	
	@Autowired
    public JavaMailSender javaMailSender;
	
    /*
     * 회원관리 리스트  
     */    
    @RequestMapping("/member/member_list")
    public String member_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			User user,
			Model model) throws Exception {

			// 검색 조건 셋팅
 
			user.setStatus("Active");
			// 전체리스트 개수
			int listCnt = 0;
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			List<User> list = null;
			
			if(user.getUserId() == null && user.getUserName() == null && user.getCellPhone() == null && user.getEmail() == null && user.getMailYn() == null && user.getEmailYn() == null && user.getSmsYn() == null) {
				
			} else {
				// 전체리스트 개수
				listCnt = userService.getUserListCnt(user);    	
				
				// 페이징 셋팅
				pagination = new Pagination(listCnt, curPage);
				
				user.setStartIndex(pagination.getStartIndex());
				user.setCntPerPage(pagination.getPageSize());
				// 전체리스트 출력
				list = userService.getUserList(user);
			}
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);

    		return "admin/member/member_list";
    } 
    
    /*
     * 회원관리 상세
     */
    @RequestMapping("/member/member_detail")
    public String member_detail(Device device, HttpServletRequest request, Model model, User user) throws Exception {
    	if(!CommonUtils.isEmpty(request.getParameter("user_idx"))) {
    		user.setUserIdx(Long.valueOf(request.getParameter("user_idx")));
    		user = userService.getUserIdx(user);    	
    	}
		
		if(user != null) {
			model.addAttribute("data", user);
		} else
			model.addAttribute("data", user);
		
    	return "admin/member/member_detail";
    }          
    
    /*
     * 회원 엑셀 다운로드
     * 
     */
    @RequestMapping(path="/member/excel_down", produces = "application/vnd.ms-excel") 
    public String downloadExcel(HttpServletRequest request,
    		HttpServletResponse response,
			@RequestParam(defaultValue="1") int curPage, 
			User user,
			Map<String,Object> modelMap) throws Exception {
    	
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Pragma","public");
        response.setHeader("Expires","0");
        response.setHeader("Content-Disposition","attachment; filename = member_list.xls");

		user.setStatus("Active");
		// 전체리스트 출력
		List<User> list = null;
		if(user.getUserId() == null && user.getUserName() == null && user.getCellPhone() == null && user.getEmail() == null && user.getMailYn() == null && user.getEmailYn() == null && user.getSmsYn() == null) {
			
		} else {		
			user.setStartIndex(0);
			user.setCntPerPage(1000);
			
			// 전체리스트 출력
			list = userService.getUserList(user);
		}

        modelMap.put("excelList",list);
        modelMap.put("excelType","User");
        
    	return "excelView"; 
    }
        
    
    /*
     * 탈퇴회원관리 리스트  
     */    
    @RequestMapping("/member/member_retire_list")
    public String member_retire_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Model model) throws Exception {

			// 검색 조건 셋팅
			userRetire.setSearchKey(searchKey);
			userRetire.setSearchValue(searchValue);
			
			// 전체리스트 개수
			int listCnt = userService.getUserRetireListCnt(userRetire);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			userRetire.setStartIndex(pagination.getStartIndex());
			userRetire.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<UserRetire> list = userService.getUserRetireList(userRetire);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    		return "admin/member/member_retire_list";
    }   
    
    /*
     * 탈퇴회원관리 상세
     */
    @RequestMapping("/member/member_retire_detail")
    public String member_retire_detail(Device device, HttpServletRequest request) {
    		return "admin/member/member_retire_detail";
    }    
    
 
}
