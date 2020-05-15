package kr.co.honorsville.user.dto;

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
@Component("FrontUser")
public class FrontUser {

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
	 * 전화번호
	 * */    
    private String tel;    

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
	 * 인증번호
	 * */    
    private String certInfo;
    
	/* 
	 * 인증타입
	 * */    
    private String certType;
    
	/* 
	 * 계정 수정시간
	 * */    
    private Integer timeDiff;    
    
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
