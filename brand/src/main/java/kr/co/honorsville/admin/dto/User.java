package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * tb_user 테이블
 * 
 * @author CooperEom
 * 
 *
 */
@Getter
@Setter
@Component
public class User {

	/* 
	 * 고유키
	 * */
    private Long userIdx;

	/* 
	 * 사용자명
	 * */
    private String userName;

	/* 
	 * 아이디
	 * */
    private String userId;
    
	/* 
	 * 비밀번호
	 * */
    private String password;    
    
	/* 
	 * 연락처
	 * */    
    private String cellPhone;
    
	/* 
	 * 이메일
	 * */    
    private String email;

	/* 
	 * 우편번호
	 * */
    private String zipcode;
    
	/* 
	 * 주소
	 * */    
    private String address;
    
	/* 
	 * 우편물 수신여부
	 * */    
    private String mailYn;
    
	/* 
	 * 에메일 수신 여부
	 * */    
    private String emailYn;
    
	/* 
	 * 문자 수신여부
	 * */    
    private String smsYn;
    
	/* 
	 * 로그인 시간
	 * */    
    private String loginTime;

	/* 
	 * 상태
	 * */
    private String status;
    
	/* 
	 * 탈퇴 이유
	 * */    
    private String retireReason;
    
	/* 
	 * 탈퇴 시간
	 * */    
    private String retireTime;
    
	/* 
	 * 등록 시간
	 * */    
    private String regTime;
    
    /* 페이징 */
    private int startIndex;
    
    private int cntPerPage;
    
    /* 검색 */
    private String searchKey;
    
    private String searchValue;     
}
