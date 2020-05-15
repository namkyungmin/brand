package kr.co.honorsville.admin.controller;


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
import kr.co.honorsville.admin.dto.As;
import kr.co.honorsville.admin.dto.Faq;
import kr.co.honorsville.admin.dto.File;
import kr.co.honorsville.admin.dto.News;
import kr.co.honorsville.admin.dto.Qna;
import kr.co.honorsville.admin.service.AsService;
import kr.co.honorsville.admin.service.FaqService;
import kr.co.honorsville.admin.service.NewsService;
import kr.co.honorsville.admin.service.QnaService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.FileUtils;
import kr.co.honorsville.common.Pagination;
import lombok.extern.slf4j.Slf4j;
 
@Controller
@Slf4j
@RequestMapping("/smadmin")
public class BoardController {

	@Resource
	private Admin admin;
 
	@Resource
	private News news;							

	@Resource
	private Faq faq;							
	
	@Resource
	private Qna qna;								
	
	@Resource
	private As as;
	
	@Resource
	private File file;		
 
	@Autowired
	private NewsService newsService;					
	
	@Autowired
	private FaqService faqService;						
	
	@Autowired
	private QnaService qnaService;							
	
	@Autowired
	private AsService asService;
	
	@Autowired
    public JavaMailSender javaMailSender;
    
    @Autowired
	FileUtils fileService;    
    
    /*
     * 아너스빌 뉴스 리스트
     */    
    @RequestMapping("/board/news_list")
    public String news_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Model model) throws Exception {
			
			// 검색 조건 셋팅
			news.setSearchKey(searchKey);
			news.setSearchValue(searchValue);
			
			// 전체리스트 개수
			int listCnt = newsService.getNewsListCnt(news);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			news.setStartIndex(pagination.getStartIndex());
			news.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<News> list = newsService.getNewsList(news);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    		return "admin/board/news_list";
    }   
    
    /*
     * 아너스빌 뉴스 상세
     */
    @RequestMapping("/board/news_detail")
    public String news_detail(Device device, HttpServletRequest request,News news, Model model) throws Exception {
    	List<File> fileList = null;
    	if(!CommonUtils.isEmpty(request.getParameter("news_id"))) {
    		news.setNewsId(Long.valueOf(request.getParameter("news_id")));
    		news = newsService.getNewsIdx(news);
    		file.setBoardCode("news");
    		file.setBoardId(Long.valueOf(request.getParameter("news_id")));
    		fileList = newsService.getFileList(file);
    	}
		
		if(news != null) {
			model.addAttribute("data", news);
			model.addAttribute("file", fileList);
		} else {
			model.addAttribute("data", news);
			model.addAttribute("file", fileList);
		}
		
		
    		return "admin/board/news_detail";
    }     
    
    /*
     * 아너스빌 뉴스 등록 / 수정
     */        
    @RequestMapping("/board/news_save")
    public @ResponseBody HashMap<String, String> news_save(Device device, 
    		Model model, 
    		HttpSession httpSession, 
    		HttpServletRequest request, 
    		News news,
    		@RequestParam(value="fileSeq") String[] fileSeq,
    		@RequestParam(value="fileName") String[] fileName,
    		@RequestParam(value="filePath") String[] filePath,
    		@RequestParam(value="fileExt") String[] fileExt,
    		@RequestParam(value="fileSize") String[] fileSize
    		) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
			
    		// 수정
			if(news.getNewsId() != null) {
				// 고유번호 게시 정보 Load
				News doc = newsService.getNewsIdx(news);
				if(doc.getNewsId() != null) {
					Long result = newsService.updateNews(news);
					
					data.put("result", "0");
					
					file.setBoardCode("news");
					file.setBoardId(doc.getNewsId());
					result = newsService.deleteFile(file);
					
					// 파일 등록
					for(int i=0;filePath.length > i;i++) {
						if(!filePath[i].equals("")) {
							file.setFileSeq(i);
							file.setFileExt(fileExt[i]);
							file.setFilePath(filePath[i]);
							file.setFileName(fileName[i]);
							file.setFileSize(Integer.parseInt(fileSize[i]));
							result = newsService.insertFile(file);
						}
					}					
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					
					return (HashMap<String, String>) data;					
				}
			} else {
				news.setAdminId(httpSession.getAttribute("adminId").toString());
				//등록
				Long result = newsService.insertNews(news);

				// 파일 등록
				for(int i=0;filePath.length > i;i++) {
					if(!filePath[i].equals("")) {
						file.setBoardCode("news");
						file.setBoardId(news.getNewsId());
						file.setFileSeq(i);
						file.setFileExt(fileExt[i]);
						file.setFilePath(filePath[i]);
						file.setFileName(fileName[i]);
						file.setFileSize(Integer.parseInt(fileSize[i]));
						result = newsService.insertFile(file);
					}
				}
				
				data.put("result", "0");
				
				return (HashMap<String, String>) data;
			}			
    }
    
    /*
     * News 삭제
     */    
    @RequestMapping(value="/board/delete_news", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> deleteNews(News news, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    news.setNewsId(Long.valueOf(request.getParameter("newsId")));
	    // 첨부파일 Load
	    List<File> fileList = null;
		file.setBoardCode("news");
		file.setBoardId(Long.valueOf(request.getParameter("newsId")));
		fileList = newsService.getFileList(file);
		// 첨부파일 삭제
		for(int i=0;fileList.size() > i;i++  ) {
			FileUtils.delete(fileList.get(i).getFilePath(), request);
		}
		// 첨부 파일 디비 삭제
		Long result = newsService.deleteFile(file);
	    
		// 게시물 삭제
	    result = newsService.deleteNews(news);
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
     * 자주묻는 질문 리스트
     */    
    @RequestMapping("/board/faq_list")
    public String faq_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="") String searchCategory,
			Model model) throws Exception {
			
			// 검색 조건 셋팅
			faq.setSearchKey(searchKey);
			faq.setSearchValue(searchValue);
			faq.setSearchCategory(searchCategory);
			
			// 전체리스트 개수
			int listCnt = faqService.getFaqListCnt(faq);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			faq.setStartIndex(pagination.getStartIndex());
			faq.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<Faq> list = faqService.getFaqList(faq);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    		return "admin/board/faq_list";
    }   
    
    /*
     * 자주묻는 질문 상세
     */
    @RequestMapping("/board/faq_detail")
    public String faq_detail(Device device, HttpServletRequest request,Faq faq, Model model) throws Exception {
    	if(!CommonUtils.isEmpty(request.getParameter("faq_id"))) {
    		faq.setFaqId(Long.valueOf(request.getParameter("faq_id")));
    		faq = faqService.getFaqIdx(faq);    	
    	}
		
		if(faq != null) {
			model.addAttribute("data", faq);
		} else
			model.addAttribute("data", faq);
		
    		return "admin/board/faq_detail";
    }     
    
    /*
     * FAQ 등록 / 수정
     */        
    @RequestMapping("/board/faq_save")
    public @ResponseBody HashMap<String, String> faq_save(Device device, Model model, HttpSession httpSession, Faq faq) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
			
    		// 수정
			if(faq.getFaqId() != null) {
				// 고유번호 게시 정보 Load
				Faq doc = faqService.getFaqIdx(faq);
				if(doc.getFaqId() != null) {
					Long result = faqService.updateFaq(faq);
					
					data.put("result", "0");
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					
					return (HashMap<String, String>) data;					
				}
			} else {
				faq.setAdminId(httpSession.getAttribute("adminId").toString());
				//등록
				Long result = faqService.insertFaq(faq);
				
				data.put("result", "0");
				
				return (HashMap<String, String>) data;
			}
	}
    
    /*
     * FAQ 삭제
     */    
    @RequestMapping(value="/board/delete_faq", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, String> deleteFaq(Faq faq, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    faq.setFaqId(Long.valueOf(request.getParameter("faqId")));
	    
	    Long result = faqService.deleteFaq(faq);
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
     * QNA 질문 리스트  / 1:1 문의
     */    
    @RequestMapping("/board/qna_list")
    public String qna_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam(defaultValue="") String searchCategory,
			Model model) throws Exception {
			
			// 검색 조건 셋팅
			qna.setSearchKey(searchKey);
			qna.setSearchValue(searchValue);
			qna.setSearchCategory(searchCategory);
			
			// 전체리스트 개수
			int listCnt = qnaService.getQnaListCnt(qna);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			qna.setStartIndex(pagination.getStartIndex());
			qna.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<Qna> list = qnaService.getQnaList(qna);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    		return "admin/board/qna_list";
    }   
    
    /*
     * QNA 질문 상세 / 1:1 문의
     */
    @RequestMapping(value = {"/board/qna_detail", "/board/qna_reply"})
    public String qna_detail(Device device, HttpServletRequest request,Qna qna, Model model) throws Exception {
    	List<File> fileList = null;
    	if(!CommonUtils.isEmpty(request.getParameter("qna_id"))) {
    		qna.setQnaId(Long.valueOf(request.getParameter("qna_id")));
    		qna = qnaService.getQnaIdx(qna);
    		file.setBoardCode("qna");
    		file.setBoardId(Long.valueOf(request.getParameter("qna_id")));
    		fileList = newsService.getFileList(file);    		
    	}
 
		if(qna != null) {
			model.addAttribute("data", qna);
			model.addAttribute("file", fileList);
		} else {
			model.addAttribute("data", qna);
			model.addAttribute("file", fileList);
		}
		
		if(!CommonUtils.isEmpty(request.getParameter("mode"))) 
			return "admin/board/qna_reply";
		else 
			return "admin/board/qna_detail";
    }   
    
    /*
     * QNA 답변 등록
     */        
    @RequestMapping("/board/qna_reply_save")
    public @ResponseBody HashMap<String, String> qna_reply_save(Device device, Model model, HttpSession httpSession, Qna qna) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
    		
    	    // 현재 시간
    		String datetime = CommonUtils.datetime();    		
			
    		// 수정
			if(qna.getQnaId() != null) {
				// 고유번호 게시 정보 Load
				Qna doc = qnaService.getQnaIdx(qna);
				if(doc.getQnaId() != null) {
					Long result = qnaService.replyUpdateQna(qna);
					
					data.put("result", "0");
					
					if(doc.getEmail() != null) {
						ClassPathResource resource = null;
						if(doc.getReplyCnt() < 1 )
							resource = new ClassPathResource("templates/email_template/customer_answer.html");
						else
							resource = new ClassPathResource("templates/email_template/customer_modify_answer.html");
						
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
				    	content = content.replace("[_NAME_]", doc.getUserId());
				    	content = content.replace("[_DATE_]", datetime);
				    	   
					    MimeMessage message = javaMailSender.createMimeMessage();  
					   
					    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
					    helper.setTo(doc.getEmail());
					    if(doc.getReplyCnt() < 1 )
					    	helper.setSubject("[경남아너스빌] 문의하신 내용에 답변이 등록되었습니다.");
					    else
					    	helper.setSubject("[경남아너스빌] 문의하신 내용에 답변이 수정되어 등록되었습니다.");
					    	
					    helper.setText(content, true);
					    
					    
					    javaMailSender.send(helper.getMimeMessage());
					}
				    
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					data.put("msg", "정보를 확인해 주세요.");						
					
					return (HashMap<String, String>) data;					
				}
			} else {
				data.put("result", "1");
				data.put("msg", "정보를 확인해 주세요.");															
				
				return (HashMap<String, String>) data;
			}
	}      
    
    /*
     * 아너스빌 뉴스 등록 / 수정
     */        
    @RequestMapping("/board/qna_save")
    public @ResponseBody HashMap<String, String> qna_save(Device device, Model model, HttpSession httpSession, Qna qna) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();
			
    		// 수정
			if(qna.getQnaId() != null) {
				// 고유번호 게시 정보 Load
				Qna doc = qnaService.getQnaIdx(qna);
				if(doc.getQnaId() != null) {
					Long result = qnaService.updateQna(qna);
					
					data.put("result", "0");
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					
					return (HashMap<String, String>) data;					
				}
			} else {
				//등록
				Long result = qnaService.insertQna(qna);
				
				data.put("result", "0");
				
				return (HashMap<String, String>) data;
			}
	}      
    
    /*
     * AS 리스트  
     */    
    @RequestMapping("/board/as_list")
    public String as_list(Device device, HttpServletRequest request, 
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue="") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			Model model) throws Exception {
			
			// 검색 조건 셋팅
			as.setSearchKey(searchKey);
			as.setSearchValue(searchValue);
			
			// 전체리스트 개수
			int listCnt = asService.getAsListCnt(as);    	
			
			// 페이징 셋팅
			Pagination pagination = new Pagination(listCnt, curPage);
			
			as.setStartIndex(pagination.getStartIndex());
			as.setCntPerPage(pagination.getPageSize());
			
			// 전체리스트 출력
			List<As> list = asService.getAsList(as);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    		return "admin/board/as_list";
    }  
    
    /*
     * AS 상세
     */
    @RequestMapping(value = {"/board/as_detail", "/board/as_reply"})
    public String as_detail(Device device, HttpServletRequest request,As as, Model model) throws Exception {
    	List<File> fileList = null;
    	if(!CommonUtils.isEmpty(request.getParameter("as_id"))) {
    		as.setAsId(Long.valueOf(request.getParameter("as_id")));
    		as = asService.getAsIdx(as);
    		file.setBoardCode("as");
    		file.setBoardId(Long.valueOf(request.getParameter("as_id")));
    		fileList = newsService.getFileList(file);    		
    	}
    	
		
		if(qna != null) {
			model.addAttribute("data", as);
			model.addAttribute("file", fileList);
		} else {
			model.addAttribute("data", as);
			model.addAttribute("file", fileList);
		}
		
		if(!CommonUtils.isEmpty(request.getParameter("mode"))) 
			return "admin/board/as_reply";
		else 
			return "admin/board/as_detail";
    }             
    
    /*
     * A/S 답변 등록
     */        
    @RequestMapping("/board/as_reply_save")
    public @ResponseBody HashMap<String, String> as_reply_save(Device device, Model model, HttpSession httpSession, As as) throws Exception {
    	
    		Map<String, String> data = new HashMap<String, String>();

    	    // 현재 시간
    	    String datetime = CommonUtils.datetime();    		
			
			
    		// 수정
			if(as.getAsId() != null) {
				// 고유번호 게시 정보 Load
				As doc = asService.getAsIdx(as);
				if(doc.getAsId() != null) {
					Long result = asService.replyUpdateAs(as);
					
					data.put("result", "0");
					ClassPathResource resource = null;
					
					if(doc.getEmail() != null) {
						if(doc.getReplyCnt() < 1 )
							resource = new ClassPathResource("templates/email_template/customer_answer.html");
						else
							resource = new ClassPathResource("templates/email_template/customer_modify_answer.html");
						
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
				    	content = content.replace("[_NAME_]", doc.getUserId());
				    	content = content.replace("[_DATE_]", datetime);
				    	   
					    MimeMessage message = javaMailSender.createMimeMessage();  
					   
					    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
					    //helper.setTo(admin.getEmail());
					    helper.setTo(doc.getEmail());
					    
					    
					    if(doc.getReplyCnt() < 1 )
					    	helper.setSubject("[경남아너스빌] 문의하신 내용에 답변이 등록되었습니다.");
					    else
					    	helper.setSubject("[경남아너스빌] 문의하신 내용에 답변이 수정되어 등록되었습니다.");
					    	
					    helper.setText(content, true);
				    
				    
				    	javaMailSender.send(helper.getMimeMessage());
					}
					
					return (HashMap<String, String>) data;
				} else {
					data.put("result", "1");
					
					return (HashMap<String, String>) data;					
				}
			} else {
				data.put("result", "1");
				
				return (HashMap<String, String>) data;
			}
	}       
        
}
