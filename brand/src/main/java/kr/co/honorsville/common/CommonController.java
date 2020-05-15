package kr.co.honorsville.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
//import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.service.FrontQnaService;
import kr.co.honorsville.my.MyController;
import kr.co.honorsville.user.dto.FrontUser;
import kr.co.honorsville.user.service.FrontUserService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/")
public class CommonController {
	
	@Resource(name="FrontUser")
	private FrontUser user;		
	
	@Autowired
	private FrontUserService userService;

	@Resource(name="FrontFile")
	private FrontFile file;	
	
	@Autowired
	private FrontQnaService qnaService;		
	
	
    @RequestMapping(path = "/download")
	public ResponseEntity<ByteArrayResource> fileDown(HttpServletRequest request,
			HttpServletResponse response, String viewFileNm) throws IOException {
    	
    	String fileName = request.getParameter("fileName");
    	String filePath = request.getParameter("filePath");
    	
    	
    	String downPath = request.getSession().getServletContext().getRealPath("/file/"+filePath+"/"+fileName);
    	
    	File file = new File( downPath );
    	if (file.exists() && file.isFile()) {
	        HttpHeaders header = new HttpHeaders();
	        header.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename="+fileName);
	        header.add("Cache-Control", "no-cache, no-store, must-revalidate");
	        header.add("Pragma", "no-cache");
	        header.add("Expires", "0");
	        Path path = Paths.get(file.getAbsolutePath());
	        ByteArrayResource resource = null;
	        
	        try {
	            resource = new ByteArrayResource(Files.readAllBytes(path));
	        } catch(IOException e) {
	            e.printStackTrace();
	        }
	        return ResponseEntity.ok()
	            .headers(header)
	            .contentLength(file.length())
	            .contentType(MediaType.parseMediaType("application/octet-stream"))
	            .body(resource);

    	}
    	throw new IOException("파일이 없습니다.");
	}
    
    @RequestMapping(path = "/download_file")
	public ResponseEntity<ByteArrayResource> fileDownFile(HttpServletRequest request,
			HttpServletResponse response, String viewFileNm) throws Exception {
    	
    	String file_id = request.getParameter("file_id");
    	String board_id = request.getParameter("board_id");
    	String board_code = request.getParameter("board_code");
    	
		file.setBoardCode(board_code);
		file.setBoardId(Long.valueOf(board_id));
		file.setFileId(Long.valueOf(file_id));
		FrontFile fileData = qnaService.getFileIdx(file);
		
    	String downPath = request.getSession().getServletContext().getRealPath(fileData.getFilePath()+"");
    	
    	File file = new File( downPath );
    	if (file.exists() && file.isFile()) {
	        HttpHeaders header = new HttpHeaders();
	        header.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename="+fileData.getFileName());
	        header.add("Cache-Control", "no-cache, no-store, must-revalidate");
	        header.add("Pragma", "no-cache");
	        header.add("Expires", "0");
	        Path path = Paths.get(file.getAbsolutePath());
	        ByteArrayResource resource = null;
	        
	        try {
	            resource = new ByteArrayResource(Files.readAllBytes(path));
	        } catch(IOException e) {
	            e.printStackTrace();
	        }
	        return ResponseEntity.ok()
	            .headers(header)
	            .contentLength(file.length())
	            .contentType(MediaType.parseMediaType("application/octet-stream"))
	            .body(resource);

    	}
    	throw new IOException("파일이 없습니다.");
	}    
    /*
     * 로그인
     */      
    @RequestMapping(value="/login_proc", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody HashMap<String, String> login_proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	response.setContentType("text/html;charset=UTF-8");
    	
	    HttpSession session = request.getSession();

		user.setUserId(request.getParameter("userId"));
		user.setPassword(request.getParameter("password"));
		user.setCertInfo(null);
		user.setCellPhone("");
		
		FrontUser doc = userService.getUserCheck(user);

		Map<String, String> data = new HashMap<String, String>();
		
		if(doc != null) {
			
		    session.setAttribute("userId", doc.getUserId());
		    session.setAttribute("userName", doc.getUserName());
		    session.setAttribute("userIdx", doc.getUserIdx());
		    session.setAttribute("userEmail", doc.getEmail());
		    session.setAttribute("userCell", doc.getCellPhone());
		    
			Cookie cookie = new Cookie("Login", "Login");
			cookie.setMaxAge(30 * 60);
	        response.addCookie(cookie);		    
		    
			data.put("result", "0");
			if(doc.getTimeDiff() >= 90) {
				data.put("location", "/membership/password-info");
				return (HashMap<String, String>) data;
			}
			
			if(request.getParameter("referer") == "")
				data.put("location", "/");
			else if(request.getParameter("referer") == null)
				data.put("location", "/");
			else
				data.put("location", request.getParameter("referer"));
			
			return (HashMap<String, String>) data;
		} else {
			data.put("result", "1");
			data.put("location", "");
			
			return (HashMap<String, String>) data;
		}
		
	} 
    
    /*
     * 로그아웃
     */      
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().setAttribute("userId", null);
		request.getSession().setAttribute("userName", null);
		request.getSession().setAttribute("userIdx", null);
		request.getSession().setAttribute("userEmail", null);
		request.getSession().setAttribute("userCell", null);		
		request.getSession().invalidate();
		
		Cookie cookie = new Cookie("Login", "");
		cookie.setMaxAge(0);
        response.addCookie(cookie);		
        
		response.sendRedirect("/");
		
		
		return "redirect:/index";
	}    
}