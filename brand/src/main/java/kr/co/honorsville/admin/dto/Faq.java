package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * tb_faq 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class Faq {
 
	/*
	 * 고유키
	 */
    private Long faqId;
    
    /*
     * 제목
     */
    private String title;

    /*
     * 카테고리
     */    
    private String category;
    
    /*
     * 내용
     */    
    private String contents;
    
    /*
     * 장성자 ID
     */    
    private String adminId;    

    /*
     * 노출여부
     */    
    private String displayYn;

    /*
     * 등록일자
     */    
    private String regTime;
    
    /* 페이징 */
    private int startIndex;
    
    private int cntPerPage;
    
    /* 검색 */
    private String searchKey;
    
    private String searchValue;     
    
    private String searchCategory;
}
