package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * tb_user_retire 테이블
 * 
 * @author CooperEom
 * 
 *
 */
@Getter
@Setter
@Component
public class UserRetire {

	/* 
	 * 고유키
	 * */
    private Long userIdx;
 
	/* 
	 * 아이디
	 * */
    private String userId;
    
	/* 
	 * 탈퇴 이유
	 * */    
    private String retireReason;
    
	/* 
	 * 탈퇴 시간
	 * */    
    private String retireTime;
    
    /* 페이징 */
    private int startIndex;
    
    private int cntPerPage;
    
    /* 검색 */
    private String searchKey;
    
    private String searchValue;     
}
