package kr.co.honorsville.config;

import java.io.PrintWriter;

/*
 *  인증관련 Interceptor
 */

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.honorsville.admin.controller.DashboardController;
import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.admin.dto.AdminAccessIp;
import kr.co.honorsville.admin.service.AdminService;
import kr.co.honorsville.common.CommonUtils;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CertificationInterceptor implements HandlerInterceptor{
	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        HttpSession session = request.getSession();
	        
	        if(request.getRequestURI().indexOf("/smadmin") >= 0) {
		        if(CommonUtils.isEmpty(session.getAttribute("adminId"))){
		        	request.getSession().invalidate();
		            response.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = response.getWriter();		        	
		        	out.println("<script>alert('로그인 후 이용이 가능합니다.');location='/smadmin/login';</script>");
		        	out.flush(); 
		            //response.sendRedirect("/smadmin/login");
		            return false;
		        }else{
		            session.setMaxInactiveInterval(30*60);
		            return true;
		        }
	        } else {
		        if(CommonUtils.isEmpty(session.getAttribute("userId"))){
		        	request.getSession().invalidate();
		            //response.sendRedirect("/membership/login");
		            response.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = response.getWriter();		        	
		        	out.println("<script>alert('로그인 후 이용이 가능합니다.');location='/membership/login';</script>");
		        	out.flush();		            
		            return false;
		        }else{
		            session.setMaxInactiveInterval(30*60);
		            return true;
		        }	        	
	        }
	        
	    }
	 
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {

	        // TODO Auto-generated method stub
	        
	    }
	 
	    @Override 
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
	            throws Exception {
	    	
	        // TODO Auto-generated method stub
	        
	    }
	 
	}