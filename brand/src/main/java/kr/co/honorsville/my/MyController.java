package kr.co.honorsville.my;
 
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import kr.co.honorsville.board.service.FrontFaqService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.FileUtils;
import kr.co.honorsville.common.Pagination;
import kr.co.honorsville.parcel.dto.FrontParcel;
import kr.co.honorsville.parcel.service.FrontParcelService;
import kr.co.honorsville.user.dto.FrontUser;
import kr.co.honorsville.user.dto.FrontUserRetire;
import kr.co.honorsville.user.service.FrontUserService;
import lombok.extern.slf4j.Slf4j;
import kr.co.honorsville.board.service.FrontAsService;
import kr.co.honorsville.board.service.FrontQnaService;
import kr.co.honorsville.admin.controller.AdminController;
import kr.co.honorsville.admin.dto.File;
import kr.co.honorsville.admin.dto.News;
import kr.co.honorsville.board.dto.FrontAs;
import kr.co.honorsville.board.dto.FrontFaq;
import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.dto.FrontQna;

 
@Controller
@Slf4j
@RequestMapping("/my")
public class MyController {
	
	@Resource(name="FrontFaq")
	private FrontFaq faq;
	
	@Resource(name="FrontQna")
	private FrontQna qna;								
	
	@Resource(name="FrontAs")
	private FrontAs as;	
	
	@Resource(name="FrontUser")
	private FrontUser user;
	
	@Resource(name="FrontParcel")
	private FrontParcel parcel;	
	
	@Resource(name="FrontUserRetire")
	private FrontUserRetire userRetire;
	
	@Resource(name="FrontFile")
	private FrontFile file;	
	
	@Autowired
	private FrontUserService userService;	
	
	@Autowired
	private FrontFaqService faqService;
	
	@Autowired
	private FrontQnaService qnaService;							
	
	@Autowired
	private FrontAsService asService;	
	
	@Autowired
	private FrontParcelService parcelService;		
	
    @Autowired
	FileUtils fileService;
    
	@Autowired
    public JavaMailSender javaMailSender;    
	
    @RequestMapping("/faq")
    public String faq(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="") String category,
			Model model) throws Exception {
			
    	
			// 검색 조건 셋팅
			faq.setSearchKey(searchKey);
			faq.setSearchValue(searchValue);
	    	faq.setSearchCategory(category);
			
			
			// 전체리스트 개수
			int listCnt = faqService.getFaqListCnt(faq);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			faq.setStartIndex(pagination.getStartIndex());
			faq.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<FrontFaq> list = faqService.getFaqList(faq);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    	if (device.isMobile())
    		return "mobile/my/faq";
    	else
    		return "my/faq";
    }
    
    @RequestMapping("/qna")
    public String qna(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/my/qna";
    	else
    		return "my/qna";
    }
    
    @RequestMapping("/qna/end")
    public String qna_end(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/my/qna_end";
    	else
    		return "my/qna_end";
    }        
    
    @RequestMapping("/qna/list")
    public String qna_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="") String searchCategory,
			Model model) throws Exception {
    		HttpSession session = request.getSession();
    		
			// 검색 조건 셋팅
			qna.setSearchKey(searchKey);
			qna.setSearchValue(searchValue);
			qna.setSearchCategory(searchCategory);
			
			if(session.getAttribute("userId") == null)
				qna.setUserId("");
			else
				qna.setUserId(session.getAttribute("userId").toString());
			// 전체리스트 개수
			int listCnt = qnaService.getQnaListCnt(qna);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			qna.setStartIndex(pagination.getStartIndex());
			qna.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<FrontQna> list = qnaService.getQnaList(qna);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    	if (device.isMobile())
    		return "mobile/my/qna_list";
    	else
    		return "my/qna_list";
    }    
    
    @RequestMapping("/qna/view")
    public String qna_view(Device device, HttpServletRequest request, Model model) throws Exception {
    	List<FrontFile> fileList = null;
    	
    	if(!CommonUtils.isEmpty(request.getParameter("qna_id"))) {
    		qna.setQnaId(Long.valueOf(request.getParameter("qna_id")));
    		qna = qnaService.getQnaIdx(qna);
    		
    		file.setBoardCode("qna");
    		file.setBoardId(Long.valueOf(request.getParameter("qna_id")));
    		try {
				fileList = qnaService.getFileList(file);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
		
		model.addAttribute("data", qna);
		model.addAttribute("file", fileList);
		
    	if (device.isMobile())
    		return "mobile/my/qna_view";
    	else
    		return "my/qna_view";
    }            
    
    
    @RequestMapping("/as")
    public String as(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/my/as";
    	else
    		return "my/as";
    }
    
    @RequestMapping("/as/end")
    public String as_end(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/my/as_end";
    	else
    		return "my/as_end";
    }    
    
    @RequestMapping("/as/list")
    public String as_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Model model) throws Exception {
    		HttpSession session = request.getSession();
    	
			// 검색 조건 셋팅
			as.setSearchKey(searchKey);
			as.setSearchValue(searchValue);
			
			// 검색 조건 셋팅
			if(session.getAttribute("userId") == null)
				as.setUserId("");
			else			
				as.setUserId(session.getAttribute("userId").toString());			
			
			// 전체리스트 개수
			int listCnt = asService.getAsListCnt(as);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			as.setStartIndex(pagination.getStartIndex());
			as.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<FrontAs> list = asService.getAsList(as);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    	if (device.isMobile())
    		return "mobile/my/as_list";
    	else
    		return "my/as_list";
    }

    @RequestMapping("/as/view")
    public String as_view(Device device, HttpServletRequest request, Model model) throws Exception {
    	List<FrontFile> fileList = null;
    	
    	if(!CommonUtils.isEmpty(request.getParameter("as_id"))) {
    		as.setAsId(Long.valueOf(request.getParameter("as_id")));
    		as = asService.getAsIdx(as);
    		
    		file.setBoardCode("as");
    		file.setBoardId(Long.valueOf(request.getParameter("as_id")));
    		try {
				fileList = asService.getFileList(file);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
		
		model.addAttribute("data", as);
		model.addAttribute("file", fileList);
		
		
    	if (device.isMobile())
    		return "mobile/my/as_view";
    	else
    		return "my/as_view";
    }
    
    
    @RequestMapping("/interest")
    public String interest(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="") String searchArea,
			Model model) throws Exception {
			
			HttpSession session = request.getSession();
	    	
			// 검색 조건 셋팅
			if(session.getAttribute("userId") == null)
				parcel.setUserIdx(Long.valueOf(0));
			else
				parcel.setUserIdx(Long.valueOf(session.getAttribute("userIdx")+""));
			
			// 전체리스트 개수
			int listCnt = parcelService.getParcelInterestListCnt(parcel);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			parcel.setStartIndex(pagination.getStartIndex());
			parcel.setCntPerPage(6);
			
			// 전체리스트 출력
			List<FrontParcel> list = parcelService.getParcelInterestList(parcel);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
			
    	if (device.isMobile())
    		return "mobile/my/interest";
    	else
    		return "my/interest";
    }
    
    @RequestMapping("/myinfo")
    public String myinfo(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/my/myinfo";
    	else
    		return "my/myinfo";
    }                
    
    /*
     * 비밀번호 확인
     */    
    @RequestMapping(value="/user_password_check", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> user_id_check(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();

		user.setUserId(session.getAttribute("userId")+"");
		user.setPassword(request.getParameter("password"));
		user.setCellPhone("");
		FrontUser doc = userService.getUserCheck(user);
		Map<String, String> data = new HashMap<String, String>();
		
		if(doc != null) {
			// 사용가능
			data.put("result", "0");
			data.put("location", "myinfo/modify");
			return (HashMap<String, String>) data;
		} else {
			// 사용중
			data.put("result", "1");
			return (HashMap<String, String>) data;
		}		
    }    
    
    @RequestMapping("/myinfo/modify")
    public String myinfo_modify(Device device, HttpServletRequest request, Model model) throws Exception {
	    HttpSession session = request.getSession();

		user.setUserId(session.getAttribute("userId")+"");
		FrontUser data = userService.getUserId(user);
		
		
		model.addAttribute("data", data);
		
    	if (device.isMobile())
    		return "mobile/my/myinfo_modify";
    	else
    		return "my/myinfo_modify";
    }
    
    /*
     * 사용자 등록
     */    
    @RequestMapping(value="/myinfo/edit_user", method=RequestMethod.POST)
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
			Long result = userService.updateUser(user);
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
    
    @RequestMapping("/myinfo/password")
    public String myinfo_password(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/my/myinfo_password";
    	else
    		return "my/myinfo_password";
    }
    
    /*
     * 비밀번호 변경
     */    
    @RequestMapping(value="/myinfo/edit_passowrd", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> editPassword(FrontUser user, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	  	    
	    // 현재 시간
	    String datetime = CommonUtils.datetime();
	    Map<String, String> data = new HashMap<String, String>();
	    
	    // 정보 확인
	    user.setUserId(session.getAttribute("userId")+"");
	    user.setPassword(request.getParameter("password"));
	    user.setCellPhone("");
	    FrontUser doc = userService.getUserCheck(user);

		if(doc != null) {
			user.setPassword(request.getParameter("new_password"));
			// 사용가능
			Long result = userService.updateUserPassword(user);
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
    
    
    @RequestMapping("/myinfo/withdrawal")
    public String myinfo_withdrawal(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/my/myinfo_withdrawal";
    	else
    		return "my/myinfo_withdrawal";
    }
    
    
    /*
     * 회원 탈퇴
     */    
    @RequestMapping(value="/myinfo/withdraw_user", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> withdrawUser(FrontUser user, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	  	    
	    // 현재 시간
	    String datetime = CommonUtils.datetime();
	    Map<String, String> data = new HashMap<String, String>();
	    
	    // 정보 확인
	    user.setUserId(session.getAttribute("userId")+"");
	    user.setPassword(request.getParameter("password"));
	    user.setCellPhone("");
	    FrontUser doc = userService.getUserCheck(user);

		if(doc != null) {
			// 사용자 탈퇴 사유 등록
			userRetire.setUserId(session.getAttribute("userId")+"");
			userRetire.setRetireReason(request.getParameter("userRetire"));
			Long result = userService.insertUserRetire(userRetire);
			
			// 사용자 삭제
			result = userService.deleteUser(user);
			if(result != null) {
				data.put("result", "0");
				data.put("location", "withdrawal-end");
				request.getSession().setAttribute("userId", null);
				request.getSession().setAttribute("userName", null);
				request.getSession().invalidate();
								
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
    
    @RequestMapping("/myinfo/withdrawal-end")
    public String myinfo_withdrawal_end(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/my/myinfo_withdrawal-end";
    	else
    		return "my/myinfo_withdrawal-end";
    }    
    
    @RequestMapping("/interest_list")
    public  @ResponseBody Object interest_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="") String parcelStage,
			@RequestParam(defaultValue="") String searchArea,
			Model model) throws Exception {

			HttpSession session = request.getSession();
	    	
			// 검색 조건 셋팅
			parcel.setUserIdx(Long.valueOf(session.getAttribute("userIdx")+""));
			parcel.setSearchKey(searchKey);
			parcel.setSearchValue(searchValue);
			parcel.setParcelStage(parcelStage);
			parcel.setParcelArea(searchArea);
			
			// 전체리스트 개수
			int listCnt = parcelService.getParcelInterestListCnt(parcel);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			parcel.setStartIndex((curPage-1)*6);
			parcel.setCntPerPage(6);

			
			// 전체리스트 출력
			List<FrontParcel> list = parcelService.getParcelInterestList(parcel);
			
			//model.addAttribute("list", list);
			//model.addAttribute("listCnt", listCnt);
			
			return  list;
    }   
    
    /*
     * 파일 업로드
     */
    
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
     * Q&A  등록 / 수정
     */        
    @RequestMapping("/qna_save")
    public @ResponseBody HashMap<String, String> qna_save(Device device, 
    		Model model, 
    		HttpSession httpSession, 
    		HttpServletRequest request, 
    		FrontQna qna,
    		@RequestParam(value="fileSeq") String[] fileSeq,
    		@RequestParam(value="fileName") String[] fileName,
    		@RequestParam(value="filePath") String[] filePath,
    		@RequestParam(value="fileExt") String[] fileExt,
    		@RequestParam(value="fileSize") String[] fileSize
    		) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
			
 
			qna.setUserId(httpSession.getAttribute("userId").toString());
			qna.setEmail(httpSession.getAttribute("userEmail").toString());
			qna.setCellPhone(httpSession.getAttribute("userCell").toString());
			
			//등록
			Long result = qnaService.insertQna(qna);

			// 파일 등록
			for(int i=0;filePath.length > i;i++) {
				if(!filePath[i].equals("")) {
					file.setBoardCode("qna");
					file.setBoardId(qna.getQnaId());
					file.setFileSeq(i);
					file.setFileExt(fileExt[i]);
					file.setFilePath(filePath[i]);
					file.setFileName(fileName[i]);
					file.setFileSize(Integer.parseInt(fileSize[i]));
					result = qnaService.insertFile(file);
				}
			}
			
			data.put("result", "0");
			data.put("msg", "정보가 등록되었습니다.");
			
	    	ClassPathResource resource = new ClassPathResource("templates/email_template/customer_inquiry_admin_notice.html");
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
		    // 현재 시간
		    String datetime = CommonUtils.datetime();			
	    	String content = mail_content;
	    	
	    	content = content.replace("[_NAME_]", httpSession.getAttribute("userName").toString());
	    	content = content.replace("[_DATE_]", datetime);
	    	   
		    MimeMessage message = javaMailSender.createMimeMessage();  
		   
		    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
		    helper.setTo(httpSession.getAttribute("userEmail").toString());  
		    helper.setSubject("[경남아너스빌] 문의접수 안내");  
		    helper.setText(content, true);  
		    javaMailSender.send(helper.getMimeMessage());			
			
			return (HashMap<String, String>) data;
    }	
    
	
    /*
     * A/S  등록 / 수정
     */        
    @RequestMapping("/as_save")
    public @ResponseBody HashMap<String, String> as_save(Device device, 
    		Model model, 
    		HttpSession httpSession, 
    		HttpServletRequest request, 
    		FrontAs as,
    		@RequestParam(value="fileSeq") String[] fileSeq,
    		@RequestParam(value="fileName") String[] fileName,
    		@RequestParam(value="filePath") String[] filePath,
    		@RequestParam(value="fileExt") String[] fileExt,
    		@RequestParam(value="fileSize") String[] fileSize
    		) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
			
    		as.setParcelAddress(request.getParameter("dong")+"동 "+request.getParameter("ho")+"호");
			as.setUserId(httpSession.getAttribute("userId").toString());
			as.setEmail(httpSession.getAttribute("userEmail").toString());
			as.setCellPhone(httpSession.getAttribute("userCell").toString());			
			//등록
			Long result = asService.insertAs(as);

			// 파일 등록
			for(int i=0;filePath.length > i;i++) {
				if(!filePath[i].equals("")) {
					file.setBoardCode("as");
					file.setBoardId(as.getAsId());
					file.setFileSeq(i);
					file.setFileExt(fileExt[i]);
					file.setFilePath(filePath[i]);
					file.setFileName(fileName[i]);
					file.setFileSize(Integer.parseInt(fileSize[i]));
					result = asService.insertFile(file);
				}
			}
			
			data.put("result", "0");
			data.put("msg", "정보가 등록되었습니다.");
			
	    	ClassPathResource resource = new ClassPathResource("templates/email_template/customer_inquiry_admin_notice.html");
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
		    // 현재 시간
		    String datetime = CommonUtils.datetime();			
	    	String content = mail_content;
	    	
	    	content = content.replace("[_NAME_]", httpSession.getAttribute("userName").toString());
	    	content = content.replace("[_DATE_]", datetime);
	    	   
		    MimeMessage message = javaMailSender.createMimeMessage();  
		   
		    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
		    helper.setTo(httpSession.getAttribute("userEmail").toString());  
		    helper.setSubject("[경남아너스빌] 문의접수 안내");  
		    helper.setText(content, true);  
		    javaMailSender.send(helper.getMimeMessage());			
			
			return (HashMap<String, String>) data;
    }	    
}