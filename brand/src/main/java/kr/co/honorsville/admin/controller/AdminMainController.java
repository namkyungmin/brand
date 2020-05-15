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
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
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
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
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
import kr.co.honorsville.admin.dto.Banner;
import kr.co.honorsville.admin.dto.Customer;
import kr.co.honorsville.admin.dto.As;
import kr.co.honorsville.admin.dto.Faq;
import kr.co.honorsville.admin.dto.File;
import kr.co.honorsville.admin.dto.News;
import kr.co.honorsville.admin.dto.Parcel;
import kr.co.honorsville.admin.dto.ParcelPlan;
import kr.co.honorsville.admin.dto.Popup;
import kr.co.honorsville.admin.dto.Qna;
import kr.co.honorsville.admin.dto.User;
import kr.co.honorsville.admin.dto.UserRetire;
import kr.co.honorsville.admin.service.AdminService;
import kr.co.honorsville.admin.service.AsService;
import kr.co.honorsville.admin.service.BannerService;
import kr.co.honorsville.admin.service.CustomerService;
import kr.co.honorsville.admin.service.FaqService;
import kr.co.honorsville.admin.service.NewsService;
import kr.co.honorsville.admin.service.ParcelPlanService;
import kr.co.honorsville.admin.service.ParcelService;
import kr.co.honorsville.admin.service.PopupService;
import kr.co.honorsville.admin.service.QnaService;
import kr.co.honorsville.admin.service.UserService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.FileUtils;
import kr.co.honorsville.common.Pagination;
import lombok.extern.slf4j.Slf4j;
 
@Controller
@Slf4j
@RequestMapping("/smadmin")
public class AdminMainController {

	@Resource
	private Admin admin;
	
	@Resource
	private Banner banner;			
	
	@Resource
	private Popup popup;				
	
 
	@Resource
	private File file;		
 			
	@Autowired
	private PopupService popupService;		
	
	@Autowired
	private BannerService bannerService;			
	
	
	@Autowired
    public JavaMailSender javaMailSender;
 
    
    @Autowired
	FileUtils fileService;    
	 
    /*
     * 배너관리 리스트
     */    
    @RequestMapping("/main/banner_list")
    public String banner_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Model model) throws Exception {
			
			// 검색 조건 셋팅
			banner.setSearchKey(searchKey);
			banner.setSearchValue(searchValue);
			
			// 전체리스트 개수
			int listCnt = bannerService.getBannerListCnt(banner);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			banner.setStartIndex(pagination.getStartIndex());
			banner.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<Banner> list = bannerService.getBannerList(banner);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    		return "admin/main/banner_list";
    }                
    
    /*
     * 배너관리 상세
     */    
    @RequestMapping("/main/banner_detail")
    public String banner_detail(Device device, HttpServletRequest request, Banner banner, Model model) throws Exception {
    	if(!CommonUtils.isEmpty(request.getParameter("banner_id"))) {
    		banner.setBannerId(Long.valueOf(request.getParameter("banner_id")));
    		banner = bannerService.getBannerIdx(banner);    	
    	}
    	
		if(banner != null) {
			model.addAttribute("data", banner);
		} else
			model.addAttribute("data", banner);
		
    		return "admin/main/banner_detail";
    }     
    
    /*
     * 배너 등록 / 수정
     */        
    @RequestMapping("/main/banner_save")
    public @ResponseBody HashMap<String, String> banner_save(Device device, Model model, HttpSession httpSession, Banner banner) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
			
    		// 수정
			if(banner.getBannerId() != null) {
				// 고유번호 게시 정보 Load
				Banner doc = bannerService.getBannerIdx(banner);
				if(doc.getBannerId() != null) {
					Long result = bannerService.updateBanner(banner);
					
					data.put("result", "0");
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					
					return (HashMap<String, String>) data;					
				}
			} else {
				banner.setAdminId(httpSession.getAttribute("adminId").toString());
				//등록
				Long result = bannerService.insertBanner(banner);
				
				data.put("result", "0");
				
				return (HashMap<String, String>) data;
			}			
    }     
    
    /*
     * 배너 등록 / 수정
     */        
    @RequestMapping("/main/banner_sort_save")
    public @ResponseBody HashMap<String, String> banner_sort_save(Device device, 
    		Model model, 
    		HttpSession httpSession, 
    		@RequestParam("bannerId[]") String[] bannerId,
    		@RequestParam("sortOrder[]") String[] sortOrder
    		) throws Exception {
    	
    		for(int i =0; bannerId.length > i; i++) {
    			banner.setSortOrder(Integer.parseInt(sortOrder[i]));
    			banner.setBannerId(Long.valueOf(bannerId[i]));
    			Long result = bannerService.updateSortBanner(banner);
    		}
    		
    		Map<String, String> data = new HashMap<String, String>();
    		
			data.put("result", "0");
			
			return (HashMap<String, String>) data;
    }      
    
    /*
     * 배너 삭제
     */    
    @RequestMapping(value="/main/delete_banner", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> deleteBanner(Banner banner, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    banner.setBannerId(Long.valueOf(request.getParameter("bannerId")));
	    
		banner = bannerService.getBannerIdx(banner);
		
		// 파일 삭제
			FileUtils.delete(banner.getImage(), request);
	    
	    Long result = bannerService.deleteBanner(banner);
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
     * 팝업관리 리스트
     */    
    @RequestMapping("/main/popup_list")
    public String popup_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Model model) throws Exception {
			
			// 검색 조건 셋팅
			popup.setSearchKey(searchKey);
			popup.setSearchValue(searchValue);
			
			// 전체리스트 개수
			int listCnt = popupService.getPopupListCnt(popup);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			popup.setStartIndex(pagination.getStartIndex());
			popup.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<Popup> list = popupService.getPopupList(popup);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    		return "admin/main/popup_list";
    }   
    
    /*
     * 팝업관리 상세
     */
    @RequestMapping("/main/popup_detail")
    public String popup_detail(Device device, HttpServletRequest request, Popup popup, Model model) throws Exception {
    	if(!CommonUtils.isEmpty(request.getParameter("popup_id"))) {
    		popup.setPopupId(Long.valueOf(request.getParameter("popup_id")));
    		popup = popupService.getPopupIdx(popup);    	
    	}
    	
		if(popup != null) {
			model.addAttribute("data", popup);
		} else
			model.addAttribute("data", popup);
		
    		return "admin/main/popup_detail";
    }     
    
    /*
     * 팝업 등록 / 수정
     */        
    @RequestMapping("/main/popup_save")
    public @ResponseBody HashMap<String, String> popup_save(Device device, Model model, HttpSession httpSession, Popup popup) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
			
    		// 수정
			if(popup.getPopupId() != null) {
				// 고유번호 게시 정보 Load
				Popup doc = popupService.getPopupIdx(popup);
				if(doc.getPopupId() != null) {
					Long result = popupService.updatePopup(popup);
					
					data.put("result", "0");
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					
					return (HashMap<String, String>) data;					
				}
			} else {
				popup.setAdminId(httpSession.getAttribute("adminId").toString());
				//등록
				Long result = popupService.insertPopup(popup);
				
				data.put("result", "0");
				
				return (HashMap<String, String>) data;
			}			
    }
    
    /*
     * 팝업 삭제
     */    
    @RequestMapping(value="/main/delete_popup", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> deletePopup(Popup popup, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    popup.setPopupId(Long.valueOf(request.getParameter("popupId")));
	    
	    popup = popupService.getPopupIdx(popup);
		
		// 파일 삭제
			FileUtils.delete(popup.getImageMo(), request);
			FileUtils.delete(popup.getImagePc(), request);
	    
	    Long result = popupService.deletePopup(popup);
		Map<String, String> data = new HashMap<String, String>();
		
		if(result != null) {
			data.put("result", "0");
			
			return (HashMap<String, String>) data;
		} else {
			data.put("result", "1");
			
			return (HashMap<String, String>) data;
		}		
    }   
}
