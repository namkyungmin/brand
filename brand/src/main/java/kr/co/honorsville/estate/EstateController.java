package kr.co.honorsville.estate;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.honorsville.parcel.service.FrontParcelPlanService;
import kr.co.honorsville.parcel.service.FrontParcelService;
import kr.co.honorsville.user.dto.FrontUser;
import lombok.extern.slf4j.Slf4j;
import kr.co.honorsville.admin.controller.AdminController;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.Pagination;
import kr.co.honorsville.parcel.dto.FrontParcel;
import kr.co.honorsville.parcel.dto.FrontParcelPlan;

 
@Controller
@Slf4j
@RequestMapping("/estate")
public class EstateController {
	
	@Resource(name="FrontParcel")
	private FrontParcel parcel;					
	
	@Resource(name="FrontParcelPlan")
	private FrontParcelPlan parcelPlan;		
	
	@Autowired
	private FrontParcelService parcelService;				

	@Autowired
	private FrontParcelPlanService parcelPlanService;	
	
    @RequestMapping("/sale/list")
    public String sale_list(Device device, HttpServletRequest request, 
			@RequestParam(value="curPage", defaultValue="1") int curPage, 
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchArea", defaultValue="") String searchArea,
			@RequestParam(value="searchType", defaultValue="") String searchType,
			FrontParcel parcel,
			Model model) throws Exception {
    	
    		HttpSession session = request.getSession();
    	
    		if(searchKey == null) searchKey = "";
    		if(searchValue == null) searchValue = "";
    		if(searchArea == null) searchArea = "";
    		if(searchType == null) searchType = "";
    		
			// 검색 조건 셋팅
			//parcel.setSearchKey(searchKey);
			//parcel.setSearchValue(searchValue);
			//parcel.setParcelArea(searchArea);
    		//parcel.setParcelType(searchType);
    		
			parcel.setSearchKey("");
			parcel.setSearchValue("");
			parcel.setParcelArea("");
			parcel.setParcelType("");	
			if(session.getAttribute("userIdx") == null)
				parcel.setUserIdx(Long.valueOf(0));
			else
				parcel.setUserIdx(Long.valueOf((CommonUtils.isEmpty(session.getAttribute("userIdx"))==true?"0":session.getAttribute("userIdx"))+""));
			parcel.setParcelStage("분양중");
			
			// 전체리스트 개수
			int listCnt = parcelService.getParcelListCnt(parcel);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			parcel.setStartIndex(pagination.getStartIndex());
			parcel.setCntPerPage(6);
			
			// 전체리스트 출력
			List<FrontParcel> list = parcelService.getParcelList(parcel);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    	if (device.isMobile())
    		return "mobile/estate/sale_list";
    	else
    		return "estate/sale_list";
    }
    
    @RequestMapping("/sale/view")
    public String sale_view(Device device, HttpServletRequest request, Model model, FrontParcel parcel) throws Exception {
    	
    	if(!CommonUtils.isEmpty(request.getParameter("parcel_id"))) {
    		parcel.setParcelId(Long.valueOf(request.getParameter("parcel_id")));
    		parcel = parcelService.getParcelIdx(parcel);    	
    	}
    	
		
		if(parcel != null) {
			model.addAttribute("data", parcel);
		} else
			model.addAttribute("data", parcel);
		
    	if (device.isMobile())
    		return "mobile/estate/sale_view";
    	else
    		return "estate/sale_view";
    }    	
 
    @RequestMapping("/plan/list")
    public String plan_list(Device device, HttpServletRequest request, 
			@RequestParam(value="curPage", defaultValue="1") int curPage, 
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchArea", defaultValue="") String searchArea,
			@RequestParam(value="searchType", defaultValue="") String searchType,
			FrontParcel parcel,
			Model model) throws Exception {
			
			HttpSession session = request.getSession();
	    	
			// 검색 조건 셋팅
    		if(searchKey == null) searchKey = "";
    		if(searchValue == null) searchValue = "";
    		if(searchArea == null) searchArea = "";
    		if(searchType == null) searchType = "";
    		
			// 검색 조건 셋팅
			//parcel.setSearchKey(searchKey);
			//parcel.setSearchValue(searchValue);
			//parcel.setParcelArea(searchArea);
    		//parcel.setParcelType(searchType);
			parcel.setSearchKey("");
			parcel.setSearchValue("");
			parcel.setParcelArea("");
			parcel.setParcelType("");			
			if(session.getAttribute("userIdx") == null)
				parcel.setUserIdx(Long.valueOf(0));
			else
				parcel.setUserIdx(Long.valueOf((CommonUtils.isEmpty(session.getAttribute("userIdx"))==true?"0":session.getAttribute("userIdx"))+""));
			parcel.setParcelStage("분양예정");
			
			// 전체리스트 개수
			int listCnt = parcelService.getParcelListCnt(parcel);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			parcel.setStartIndex(pagination.getStartIndex());
			parcel.setCntPerPage(6);
			
			// 전체리스트 출력
			List<FrontParcel> list = parcelService.getParcelList(parcel);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    	if (device.isMobile())
    		return "mobile/estate/plan_list";
    	else
    		return "estate/plan_list";
    }
    
    @RequestMapping("/plan/view")
    public String plan_view(Device device, HttpServletRequest request, Model model) throws Exception {
    	if(!CommonUtils.isEmpty(request.getParameter("parcel_id"))) {
    		parcel.setParcelId(Long.valueOf(request.getParameter("parcel_id")));
    		parcel = parcelService.getParcelIdx(parcel);    	
    	}
    	
		
		if(parcel != null) {
			model.addAttribute("data", parcel);
		} else
			model.addAttribute("data", parcel);
		
    	if (device.isMobile())
    		return "mobile/estate/plan_view";
    	else
    		return "estate/plan_view";
    }
    
    @RequestMapping("/apt/list")
    public String apt_list(Device device, HttpServletRequest request, 
			@RequestParam(value="curPage", defaultValue="1") int curPage, 
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchArea", defaultValue="") String searchArea,
			@RequestParam(value="searchType", defaultValue="") String searchType,
			FrontParcel parcel,
			Model model) throws Exception {
			
			HttpSession session = request.getSession();
	    	
			// 검색 조건 셋팅
    		if(searchKey == null) searchKey = "";
    		if(searchValue == null) searchValue = "";
    		if(searchArea == null) searchArea = "";
    		if(searchType == null) searchType = "";
    		
			// 검색 조건 셋팅
			//parcel.setSearchKey(searchKey);
			//parcel.setSearchValue(searchValue);
			//parcel.setParcelArea(searchArea);
    		//parcel.setParcelType(searchType);
    		
			parcel.setSearchKey("");
			parcel.setSearchValue("");
			parcel.setParcelArea("");
			parcel.setParcelType("");	
			if(session.getAttribute("userIdx") == null)
				parcel.setUserIdx(Long.valueOf(0));
			else
				parcel.setUserIdx(Long.valueOf((CommonUtils.isEmpty(session.getAttribute("userIdx"))==true?"0":session.getAttribute("userIdx"))+""));
			parcel.setUserIdx(Long.valueOf((CommonUtils.isEmpty(session.getAttribute("userIdx"))==true?"0":session.getAttribute("userIdx"))+""));
			parcel.setParcelStage("분양완료");
			
			// 전체리스트 개수
			int listCnt = parcelService.getParcelListCnt(parcel);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			parcel.setStartIndex(pagination.getStartIndex());
			parcel.setCntPerPage(6);
			
			// 전체리스트 출력
			List<FrontParcel> list = parcelService.getParcelList(parcel);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    	if (device.isMobile())
    		return "mobile/estate/apt_list";
    	else
    		return "estate/apt_list";
    }
    
    @RequestMapping("/apt/view")
    public String apt_view(Device device, HttpServletRequest request, Model model) throws Exception {
    	if(!CommonUtils.isEmpty(request.getParameter("parcel_id"))) {
    		parcel.setParcelId(Long.valueOf(request.getParameter("parcel_id")));
    		parcel = parcelService.getParcelIdx(parcel);    	
    	}
    	
		
		if(parcel != null) {
			model.addAttribute("data", parcel);
		} else
			model.addAttribute("data", parcel);
		
    	if (device.isMobile())
    		return "mobile/estate/apt_view";
    	else
    		return "estate/apt_view";
    }
    
    @RequestMapping("/tearplan")
    public String tearplan(Device device, HttpServletRequest request, 
			@RequestParam(value="curPage", defaultValue="1") int curPage, 
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
			
			// 검색 조건 셋팅
			parcelPlan.setSearchKey(searchKey);
			parcelPlan.setSearchValue(searchValue);
			
			// 전체리스트 개수
			int listCnt = parcelPlanService.getParcelPlanListCnt(parcelPlan);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			parcelPlan.setStartIndex(pagination.getStartIndex());
			parcelPlan.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<FrontParcelPlan> list = parcelPlanService.getParcelPlanList(parcelPlan);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    	if (device.isMobile())
    		return "mobile/estate/tearplan";
    	else
    		return "estate/tearplan";
    }      
    

    @RequestMapping("/parcel_list")
    public  @ResponseBody HashMap<String, Object> parcel_list(Device device, HttpServletRequest request,
			@RequestParam(value="curPage", defaultValue="1") int curPage, 
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchArea", defaultValue="") String searchArea,
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value="parcelStage", defaultValue="") String parcelStage,
			FrontParcel parcel,
			Model model) throws Exception {

			HttpSession session = request.getSession();
			
    		if(searchKey == null) searchKey = "";
    		if(searchValue == null) searchValue = "";
    		if(searchArea == null) searchArea = "";
    		if(searchType == null) searchType = "";
    		
			// 검색 조건 셋팅
			if(session.getAttribute("userIdx") == null)
				parcel.setUserIdx(Long.valueOf(0));
			else
				parcel.setUserIdx(Long.valueOf((CommonUtils.isEmpty(session.getAttribute("userIdx"))==true?"0":session.getAttribute("userIdx"))+""));
			parcel.setSearchKey(searchKey);
			parcel.setSearchValue(searchValue);
			parcel.setParcelStage(parcelStage);
			parcel.setParcelArea(searchArea);
			parcel.setParcelType(searchType);
			
			// 전체리스트 개수
			int listCnt = parcelService.getParcelListCnt(parcel);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			//parcel.setStartIndex(pagination.getStartIndex());
			parcel.setStartIndex((curPage-1)*6); 
			parcel.setCntPerPage(6);
			
			// 전체리스트 출력 
			List<FrontParcel> list = parcelService.getParcelList(parcel);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("data", list);
			data.put("total", listCnt);
			return  (HashMap<String, Object>) data;
    }
    

    @RequestMapping("/parcel_list1")
    public  @ResponseBody Object parcel_list1(Device device, HttpServletRequest request,
			@RequestParam(value="curPage", defaultValue="1") int curPage, 
			@RequestParam(value="searchKey", defaultValue="") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchArea", defaultValue="") String searchArea,
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value="parcelStage", defaultValue="") String parcelStage,
			FrontParcel parcel,
			Model model) throws Exception {

			HttpSession session = request.getSession();
			
    		if(searchKey == null) searchKey = "";
    		if(searchValue == null) searchValue = "";
    		if(searchArea == null) searchArea = "";
    		if(searchType == null) searchType = "";
    		
			// 검색 조건 셋팅
			if(session.getAttribute("userIdx") == null)
				parcel.setUserIdx(Long.valueOf(0));
			else
				parcel.setUserIdx(Long.valueOf((CommonUtils.isEmpty(session.getAttribute("userIdx"))==true?"0":session.getAttribute("userIdx"))+""));
			parcel.setSearchKey(searchKey);
			parcel.setSearchValue(searchValue);
			parcel.setParcelStage(parcelStage);
			parcel.setParcelArea(searchArea);
			parcel.setParcelType(searchType);
			
			// 전체리스트 개수
			int listCnt = parcelService.getParcelListCnt(parcel);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			//parcel.setStartIndex(pagination.getStartIndex());
			parcel.setStartIndex((curPage-1)*6);
			parcel.setCntPerPage(6);
			
			// 전체리스트 출력 
			List<FrontParcel> list = parcelService.getParcelList(parcel);
			return  list;
    }    
    
    @RequestMapping("/add_favorite")
    public  @ResponseBody HashMap<String, String> add_favorite(Device device, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        	response.setContentType("text/html;charset=UTF-8");
        	
    	    HttpSession session = request.getSession();
    	    Map<String, String> data = new HashMap<String, String>();
    	    
    	    if(session.getAttribute("userIdx") == null ) {
    			data.put("result", "1");
    			data.put("msg", "ERROR");
    			
    			return (HashMap<String, String>) data;    	    	
    	    }

    	    parcel.setUserIdx(Long.valueOf((CommonUtils.isEmpty(session.getAttribute("userIdx"))==true?"0":session.getAttribute("userIdx"))+""));
    		parcel.setParcelId(Long.valueOf(request.getParameter("parcelId")));
    		
    		FrontParcel doc = parcelService.getParcelInterest(parcel);
    		
    		if(doc == null) {
    			Long result = parcelService.insertParcelInterest(parcel);
    		    
    			data.put("result", "0");
    			data.put("msg", "ADD");
    			
    			return (HashMap<String, String>) data;
    		} else {
    			Long result = parcelService.deleteParcelInterest(parcel);
    			data.put("result", "0");
    			data.put("msg", "DELETE");
    			
    			return (HashMap<String, String>) data;
    		}
    }    
    
}
