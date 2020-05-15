package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * tb_admin 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class Admin {
	/* 
	 * 고유키
	 * */
    private Long adminIdx;
    
	/* 
	 * 관리자 아이디
	 * */    
    private String adminId;
    
	/* 
	 * 관리자명
	 * */    
    private String adminName;
    
	/* 
	 * 비밀번호
	 * */    
    private String password;
    
	/* 
	 * 이메일
	 * */    
    private String email;

	/* 
	 * 소속
	 * */    
    private String dept;
    
	/* 
	 * 사용일자 시작일
	 * */        
    private String useStartDate;
    
	/* 
	 * 사용일자 종료일
	 * */        
    private String useEndDate;
    
	/* 
	 * 관리자 타입
	 * */        
    private String adminType;
    
	/* 
	 * 상태
	 * */        
    private String status;
    
	/* 
	 * 권한
	 * */        
    private String role;
    
	/* 
	 * 등록일
	 * */        
    private String regTime;
    
	/* 
	 * 로그인 시도 횟수
	 * */        
    private int loginTryCnt;

	/* 
	 * 종료여부
	 * */        
    private String endDate;
    
	/* 
	 * 시간차이
	 * */        
    private Integer timeDiff;    
    
    
	/* 
	 * 로그인 시도 일자
	 * */        
    private String loginTryDate;
    
    /* 페이징 */
    private int startIndex;
    
    private int cntPerPage;
    
    /* 검색 */
    private String searchKey;
    
    private String searchValue;     
}
