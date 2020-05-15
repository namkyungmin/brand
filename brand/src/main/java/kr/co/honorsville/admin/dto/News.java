package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * tb_news 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class News {
 
	/*
	 * 고유키
	 */
    private Long newsId;
    
    /*
     * 제목
     */
    private String title;

    /*
     * 뉴스 종류
     */    
    private String newsType;
    
    /*
     * 내용
     */    
    private String contents;

    /*
     * URL
     */    
    private String url;
    
    /*
     * 노출일자
     */    
    private String displayDate;
    
    /*
     * 노출여부
     */    
    private String displayYn;
    
    /*
     * 노출여부
     */    
    private String adminId;    
    
    /*
     * 노출여부
     */    
    private String readCnt; 

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
}
