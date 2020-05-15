package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * tb_customer 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class Customer {
 
	/* 고객 고유번호 */
	private Long customerId;
	
	/* 분양 고유번호 */
	private Long parcelId;
	
	/* 분양명 */
    private String parcelName;
    
	/* 이름 */
    private String name;
    
	/* 성별 */
    private String gender;
    
	/* 핸드폰 */
    private String cellPhone;
    
	/* 이메일 */
    private String email;
    
	/* 우편번호 */
    private String zipcode;
    
	/* 주소 */
    private String address;
    
	/* 개인정보 동의 */
    private String privateYn;    
    
	/* 마케팅 동의 */
    private String smsYn;
    
	/* 등록일 */
    private String regTime;
    
    /* 페이징 */
    private int startIndex;
    
    private int cntPerPage;
    
    /* 검색 */
    private String searchKey;
    
    private String searchValue;     
}
