package kr.co.honorsville.members.controller;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.dto.FrontNews;
import kr.co.honorsville.board.service.FrontNewsService;
import kr.co.honorsville.common.CommonUtils;
import kr.co.honorsville.common.FileUtils;
import kr.co.honorsville.common.Pagination;
import kr.co.honorsville.user.dto.FrontUser;
import kr.co.honorsville.user.service.FrontUserService;

 
@Controller
@RequestMapping("/members")
public class MembersController {
	
	@Resource(name="FrontNews")
	private FrontNews news;
	
	@Resource(name="FrontFile")
	private FrontFile file;
	
	
	@Autowired
	private FrontNewsService newsService;

 
    @RequestMapping("/news")
    public String news(Device device, HttpServletRequest request, 
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
			List<FrontNews> list = newsService.getNewsList(news);
			    
			model.addAttribute("list", list);
			model.addAttribute("listCnt", listCnt);
			
			model.addAttribute("pagination", pagination);
    		
    	if (device.isMobile())
    		return "mobile/members/news";
    	else
    		return "members/news";
    }
    
    @RequestMapping("/view")
    public String view_dangjin(Device device, HttpServletRequest request, FrontNews news, Model model) throws Exception {
        	List<FrontFile> fileList = null;
        	if(!CommonUtils.isEmpty(request.getParameter("news_id"))) {
        		news.setNewsId(Long.valueOf(request.getParameter("news_id")));
        		news = newsService.getNewsIdx(news);
        		file.setBoardCode("news");
        		file.setBoardId(Long.valueOf(request.getParameter("news_id")));
        		fileList = newsService.getFileList(file);
        		
        		// 조회수 
        		Long result = newsService.updateNewsCnt(news);
        	}
    		
    		if(news != null) {
    			model.addAttribute("data", news);
    			model.addAttribute("file", fileList);
    		} else {
    			model.addAttribute("data", news);
    			model.addAttribute("file", fileList);
    		}    	
    		
    	if (device.isMobile())
    		return "mobile/members/view";
    	else
    		return "members/view";
    }
    
    @RequestMapping("/guide")
    public String view_bukhansan(Device device, HttpServletRequest request) {
    	if (device.isMobile())
    		return "mobile/members/guide";
    	else
    		return "members/guide";
    }    
    
    
    
    
}
