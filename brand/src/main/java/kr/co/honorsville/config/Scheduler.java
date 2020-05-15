package kr.co.honorsville.config;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/*
 * 스케줄러 
 */

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.honorsville.admin.controller.DashboardController;
import kr.co.honorsville.admin.dto.User;
import kr.co.honorsville.admin.dto.UserRetire;
import kr.co.honorsville.admin.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class Scheduler {
	@Resource
	private User user;
	
	@Resource
	private UserRetire userRetire;
	
	@Autowired
	private UserService userService;
	
	@Autowired
    public JavaMailSender javaMailSender;	
	
   @Scheduled(cron = "0 0 2 * * ?")
   public void cronJobSch() throws Exception {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
      Date now = new Date();
      String strDate = sdf.format(now);
      System.out.println("Java cron job expression:: " + strDate);
      List<User> list = null;
      User user = null;
      
      /* 1년 미그로인 회원 탈퇴처리 30일전 */
      user.setSearchKey("no_login_30");
      list = userService.getUserScheduleList(user);
      
      ClassPathResource resource = new ClassPathResource("templates/email_template/customer_answer.html");
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
		
	    for(int i=0;i < list.size();i++) {
	  		String content = mail_content;
	      	content = content.replace("[_USER_ID_]", list.get(i).getUserId());
	      	content = content.replace("[_TRUNCATE_DATE_]", "일짜");
	      	   
	  	    MimeMessage message = javaMailSender.createMimeMessage();  
	  	   
	  	    MimeMessageHelper helper = new MimeMessageHelper(message, true);  
	  	    helper.setTo(list.get(i).getEmail());  
	  	    helper.setSubject("[경남 아너스빌] 회원님의 계정이 1년 미이용으로 삭제 될 예정입니다. ");  
	  	    helper.setText(content, true);  
	  	    javaMailSender.send(helper.getMimeMessage());      	  
	    }
	      
	    /* 1년 미그로인 회원 탈퇴처리 */
	    userRetire.setSearchKey("no_login");
	    /* 미로그인 데이터 Retire 테이블로 이동 */
	    int result = userService.InsertUserRetireSchedule(userRetire);
	    
	    /* 미로그인 데이터 삭제 */
	    result = userService.deleteUserRetireSchedule(userRetire);
      
   }
}