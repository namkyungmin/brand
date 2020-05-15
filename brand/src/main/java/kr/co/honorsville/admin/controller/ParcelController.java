package kr.co.honorsville.admin.controller;

/*
 *  ADMIN 컨트롤러
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.admin.dto.AdminAccessIp;
import kr.co.honorsville.admin.dto.Customer;
import kr.co.honorsville.admin.dto.File;
import kr.co.honorsville.admin.dto.Parcel;
import kr.co.honorsville.admin.dto.ParcelPlan;
import kr.co.honorsville.admin.dto.User;
import kr.co.honorsville.admin.dto.UserRetire;
import kr.co.honorsville.admin.service.CustomerService;
import kr.co.honorsville.admin.service.ParcelPlanService;
import kr.co.honorsville.admin.service.ParcelService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.FileUtils;
import kr.co.honorsville.common.Pagination;
import lombok.extern.slf4j.Slf4j;
 
@Controller
@Slf4j
@RequestMapping("/smadmin")
public class ParcelController {

	@Resource
	private Admin admin;
	
	@Resource
	private User user;	
	
	@Resource
	private Customer customer;		
	
	@Resource
	private Parcel parcel;					
	
	@Resource
	private ParcelPlan parcelPlan;						
	
	@Resource
	private File file;		
	
	@Resource
	private UserRetire userRetire;				
	
	@Resource
	private AdminAccessIp adminAccessIp;								
	
	@Autowired
	private CustomerService customerService;		
	
	@Autowired
	private ParcelService parcelService;				

	@Autowired
	private ParcelPlanService parcelPlanService;				
	 
	@Autowired
    public JavaMailSender javaMailSender;
    
    /*
     * 분양단지 리스트
     */    
    @RequestMapping("/parcel/parcel_list")
    public String parcel_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Model model) throws Exception {
			
			// 검색 조건 셋팅
			parcel.setSearchKey(searchKey);
			parcel.setSearchValue(searchValue);
			
			// 전체리스트 개수
			int listCnt = parcelService.getParcelListCnt(parcel);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			parcel.setStartIndex(pagination.getStartIndex());
			parcel.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<Parcel> list = parcelService.getParcelList(parcel);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    		return "admin/parcel/parcel_list";
    } 
    
    /*
     * 분양단지관리 상세
     */
    @RequestMapping("/parcel/parcel_detail")
    public String parcel_detail(Device device, HttpServletRequest request, Model model, Parcel parcel) throws Exception {
    	
    	if(!CommonUtils.isEmpty(request.getParameter("parcel_id"))) {
    		parcel.setParcelId(Long.valueOf(request.getParameter("parcel_id")));
    		parcel = parcelService.getParcelIdx(parcel);    	
    	}
    	
		
		if(parcel != null) {
			model.addAttribute("data", parcel);
		} else
			model.addAttribute("data", parcel);
		
    		return "admin/parcel/parcel_detail";
    }  
    
    /*
     * 분양단지관리 삭제
     */    
    @RequestMapping(value="/parcel/delete_parcel", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> deleteParcel(Parcel parcel, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    parcel.setParcelId(Long.valueOf(request.getParameter("parcelId")));
	    
	    parcel = parcelService.getParcelIdx(parcel);
		
		// 파일 삭제
			FileUtils.delete(parcel.getConstructionImageMo(), request);
			FileUtils.delete(parcel.getConstructionImagePc(), request);
			FileUtils.delete(parcel.getModelhouseImageMo(), request);
			FileUtils.delete(parcel.getModelhouseImagePc(), request);
			FileUtils.delete(parcel.getParcelDetailImage(), request);
			FileUtils.delete(parcel.getParcelDetailImageMo(), request);
			FileUtils.delete(parcel.getParcelListImage(), request);
			FileUtils.delete(parcel.getParcelListImageMo(), request);
	    
	    Long result = parcelService.deleteParcel(parcel);
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
     * 연간분양계획 리스트
     */    
    @RequestMapping("/parcel/parcel_plan_list")
    public String parcel_plan_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
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
			List<ParcelPlan> list = parcelPlanService.getParcelPlanList(parcelPlan);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    		return "admin/parcel/parcel_plan_list";
    }      
    
    /*
     * 연간분양계획 상세
     */
    @RequestMapping("/parcel/parcel_plan_detail")
    public String parcel_plan_detail(Device device, HttpServletRequest request, ParcelPlan parcelPlan, Model model) throws Exception {
    	if(!CommonUtils.isEmpty(request.getParameter("plan_id"))) {
    		parcelPlan.setPlanId(Long.valueOf(request.getParameter("plan_id")));
    		parcelPlan = parcelPlanService.getParcelPlanIdx(parcelPlan);    	
    	}
    	
		if(parcelPlan != null) {
			model.addAttribute("data", parcelPlan);
		} else
			model.addAttribute("data", parcelPlan);
		
    		return "admin/parcel/parcel_plan_detail";
    }       
    
    /*
     * 분양단지 등록 /수정
     */        
    @RequestMapping("/parcel/parcel_save")
    public @ResponseBody HashMap<String, String> parcel_save(Device device, Model model, HttpSession httpSession, Parcel parcel) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
			
    		// 수정
			if(parcel.getParcelId() != null) {
				// 고유번호 게시 정보 Load
				Parcel doc = parcelService.getParcelIdx(parcel);
				if(doc.getParcelId() != null) {
					Long result = parcelService.updateParcel(parcel);
					
					data.put("result", "0");
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					
					return (HashMap<String, String>) data;					
				}
			} else {
				//parcel.setAdminId(httpSession.getAttribute("adminId").toString());
				//등록
				Long result = parcelService.insertParcel(parcel);
				
				data.put("result", "0");
				
				return (HashMap<String, String>) data;
			}			
    }        
    
    /*
     * 연간분양계획 등록 / 수정
     */        
    @RequestMapping("/parcel/parcel_plan_save")
    public @ResponseBody HashMap<String, String> parcel_plan_save(Device device, Model model, HttpSession httpSession, ParcelPlan parcelPlan) throws Exception {
    	
    	
    		Map<String, String> data = new HashMap<String, String>();
			
    		// 수정
			if(parcelPlan.getPlanId() != null) {

				ParcelPlan doc = parcelPlanService.getParcelPlanIdx(parcelPlan);
				if(doc.getPlanId() != null) {
					// 개인정보 업데이트
					Long result = parcelPlanService.updateParcelPlan(parcelPlan);
					
					data.put("result", "0");
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					
					return (HashMap<String, String>) data;					
				}
			} else {
				
				//등록
				Long result = parcelPlanService.insertParcelPlan(parcelPlan);
				
				data.put("result", "0");
				
				return (HashMap<String, String>) data;
			}			
    }     
    
    /*
     * 연간분양계획 삭제
     */    
    @RequestMapping(value="/parcel/delete_plan", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> deletePlan(ParcelPlan parcelPlan, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    parcelPlan.setPlanId(Long.valueOf(request.getParameter("planId")));
	    
	    Long result = parcelPlanService.deleteParcelPlan(parcelPlan);
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
     * 관심고객단지 리스트
     */    
    @RequestMapping("/parcel/customer_list")
    public String customer_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Customer customer,
			Model model) throws Exception {

			// 검색 조건 셋팅
			customer.setSearchKey(searchKey);
			customer.setSearchValue(searchValue);
			
			// 전체리스트 개수
			int listCnt = customerService.getCustomerListCnt(customer);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			customer.setStartIndex(pagination.getStartIndex());
			customer.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<Customer> list = customerService.getCustomerList(customer);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    		return "admin/parcel/customer_list";
    }    
    
    /*
     * 관심고객단지 상세
     */
    @RequestMapping("/parcel/customer_detail")
    public String customer_detail(Device device, HttpServletRequest request,Customer customer, Model model) throws Exception {
    	if(!CommonUtils.isEmpty(request.getParameter("customer_id"))) {
    		customer.setCustomerId(Long.valueOf(request.getParameter("customer_id")));
    		customer = customerService.getCustomerIdx(customer);    	
    	}
		
		if(customer != null) {
			model.addAttribute("data", customer);
		} else
			model.addAttribute("data", customer);
		
    		return "admin/parcel/customer_detail";
    }     
    
    /*
     * 관심고객단지 삭제
     */    
    @RequestMapping(value="/parcel/delete_customer", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> deleteCustomer(Customer customer, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    customer.setCustomerId(Long.valueOf(request.getParameter("customerId")));
	    
	    Long result = customerService.deleteCustomer(customer);
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
     * 관심고객단지 엑셀 다운로드
     * 
     */
    @RequestMapping(path="/parcel/customer_excel_down", produces = "application/vnd.ms-excel") 
    public String downloadExcel(HttpServletRequest request,
    		HttpServletResponse response,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Map<String,Object> modelMap) throws Exception {
    	
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Pragma","public");
        response.setHeader("Expires","0");
        response.setHeader("Content-Disposition","attachment; filename = member_list.xls");

		user.setStatus("Active");
		// 검색 조건 셋팅
		customer.setSearchKey(searchKey);
		customer.setSearchValue(searchValue);
		
		// 전체리스트 출력
		List<Customer> list = null;
				
			customer.setStartIndex(0);
			customer.setCntPerPage(5000);
			
			// 전체리스트 출력
			list = customerService.getCustomerList(customer);
		

        modelMap.put("excelList",list);
        modelMap.put("excelType","Customer");
        
    	return "excelViewCustomer"; 
    }
            
        
}
