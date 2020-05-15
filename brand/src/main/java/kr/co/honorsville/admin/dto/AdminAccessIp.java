package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * tb_admin_access_ip 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class AdminAccessIp {
	 
		/*
		 * 고유번호
		 */
	    private Long ipId;

		/*
		 * 아이피 주소
		 */
	    private String ipAddr;
	    
		/*
		 * 등록일
		 */    
	    private String regTime;

}
