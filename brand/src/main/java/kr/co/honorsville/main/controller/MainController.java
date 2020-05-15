package kr.co.honorsville.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
//import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.honorsville.admin.controller.DashboardController;
import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.dto.FrontNews;
import kr.co.honorsville.board.service.FrontNewsService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.Pagination;
import kr.co.honorsville.main.dto.FrontBanner;
import kr.co.honorsville.main.dto.FrontPopup;
import kr.co.honorsville.main.service.FrontBannerService;
import kr.co.honorsville.main.service.FrontPopupService;
import kr.co.honorsville.parcel.dto.FrontParcel;
import kr.co.honorsville.parcel.service.FrontParcelService;
import lombok.extern.slf4j.Slf4j;

@Controller 
@Slf4j
@RequestMapping("/")
public class MainController {
	@Resource(name="FrontParcel")
	private FrontParcel parcel;			
	
	@Resource(name="FrontNews")
	private FrontNews news;
	
	@Resource(name="FrontBanner")
	private FrontBanner banner;			
	
	@Resource(name="FrontPopup")
	private FrontPopup popup;	
	
	@Resource(name="FrontFile")
	private FrontFile file;
	
	@Autowired
	private FrontParcelService parcelService;		
	
	@Autowired
	private FrontNewsService newsService;
	
	@Autowired
	private FrontBannerService bannerService;
	
	@Autowired
	private FrontPopupService popupService;	
	
    @RequestMapping(value = {"/", "index"})
    public String greeting(Device device, HttpServletRequest request, Model model) throws Exception {

    	HttpSession session = request.getSession();
        Device deviceFromRequest = DeviceUtils.getCurrentDevice(request);
        
        /* 팝업 정보 */
        popup.setStartIndex(0);
        popup.setCntPerPage(10);
		
		// 전체리스트 출력
		List<FrontPopup> popupList = popupService.getPopupList(popup);        
        
		model.addAttribute("popupList", popupList);
		
        /* 배너 정보 */
		banner.setStartIndex(0);
		banner.setCntPerPage(3);
		
		// 전체리스트 출력
		List<FrontBanner> bannerList = bannerService.getBannerList(banner);        
        
		model.addAttribute("bannerList", bannerList);        
        
        
        /* 분양 정보 */
		// 전체리스트 개수
		parcel.setStartIndex(0);
		parcel.setCntPerPage(3);
		parcel.setParcelStage("");
		parcel.setParcelArea("");
		parcel.setParcelType("");
		parcel.setSearchKey("");
		parcel.setSearchValue("");
		parcel.setUserIdx(Long.valueOf((CommonUtils.isEmpty(session.getAttribute("userIdx"))==true?"0":session.getAttribute("userIdx"))+""));
		
		// 전체리스트 출력
		List<FrontParcel> parcelList = parcelService.getParcelList(parcel);        
        
		model.addAttribute("parcelList", parcelList);
		
        /* NEWS 정보 */
		// 검색 조건 셋팅
		news.setSearchKey("");
		news.setSearchValue("");
		
		// 페이징 셋팅
		news.setStartIndex(0);
		news.setCntPerPage(5);
		
		// 전체리스트 출력
		List<FrontNews> newsList = newsService.getNewsList(news);
		    
		model.addAttribute("newsList", newsList);

        if (device.isMobile()) 
        	return "mobile/index";
        else
        	return "index";
    }
    
	@RequestMapping(value = {"main"})
	//public String main(Device device, Model model, HttpServletRequest request)
	public String main(Device device, Model model, HttpServletRequest request)
	{
		if (device.isMobile()) 
			return "mobile/main"; 
		else
			return "main"; 
	}
 
}