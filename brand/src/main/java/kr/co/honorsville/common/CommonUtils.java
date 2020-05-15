package kr.co.honorsville.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.honorsville.config.CertificationInterceptor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CommonUtils {		

	/*
	 * 공백 또는 null 체크
	 */

	public static boolean isEmpty(Object obj) {

		if(obj == null) return true;

		if ((obj instanceof String) && (((String)obj).trim().length() == 0)) { return true; }

	        if (obj instanceof Map) { return ((Map<?, ?>) obj).isEmpty(); }

	        if (obj instanceof Map) { return ((Map<?, ?>)obj).isEmpty(); } 

	        if (obj instanceof List) { return ((List<?>)obj).isEmpty(); }

	        if (obj instanceof Object[]) { return (((Object[])obj).length == 0); }

		return false;

	}
	
	public static String getIp(HttpServletRequest request) {
		 
	        String ip = request.getHeader("X-Forwarded-For");
	 
//	        log.info(">>>> X-FORWARDED-FOR : " + ip);
	 
	        if (ip == null) {
	            ip = request.getHeader("Proxy-Client-IP");
//	            log.info(">>>> Proxy-Client-IP : " + ip);
	        }
	        if (ip == null) {
	            ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
//	            log.info(">>>> WL-Proxy-Client-IP : " + ip);
	        }
	        if (ip == null) {
	            ip = request.getHeader("HTTP_CLIENT_IP");
//	            log.info(">>>> HTTP_CLIENT_IP : " + ip);
	        }
	        if (ip == null) {
	            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//	            log.info(">>>> HTTP_X_FORWARDED_FOR : " + ip);
	        }
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }
	        
//	        log.info(">>>> Result : IP Address : "+ip);
	 
	        return ip;
	 
	}
	public static String datetime() {
	    SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	    Date time = new Date();
	    String datetime = format.format(time);
	    return datetime;
	}
	
	public static String datetimeBefore(int hour) {
	    SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	    Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.HOUR, hour);
	    
	    String datetime = format.format(cal.getTime()); 
	    return datetime;
	}	

}
