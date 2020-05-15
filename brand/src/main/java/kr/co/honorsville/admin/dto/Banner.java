package kr.co.honorsville.admin.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * tb_banner 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class Banner {
 
	/*
	 * 배너 고유키
	 */
    private Long bannerId;

	/*
	 * 제목
	 */
    private String title;
    
    private String title2;

	/*
	 * 서브제목
	 */
    private String subTitle;
    
    private String subTitle2;

	/*
	 * 플래그
	 */
    private String flag;

	/*
	 * 플래그 기타 내용
	 */
    private String flagInfo;
    
	/*
	 * 시작일자
	 */    
    private String startDate;
    
	/*
	 * 종료일자
	 */    
    private String endDate;
    
	/*
	 * 설명
	 */    
    private String description;

	/*
	 * 위치
	 */    
    private String descPlace;
    
	/*
	 * 규모
	 */    
    private String descSize;    
    
	/*
	 * 분양
	 */    
    private String descPlan;    
    
	/*
	 * 연락처
	 */    
    private String contactNumber;
    
	/*
	 * 이미지
	 */    
    private String image;
    
	/*
	 * url
	 */    
    private String url;
    
	/*
	 * url_target
	 */    
    private String urlTarget;

	/*
	 * 우선순위
	 */    
    private int sortOrder;

	/*
	 * 노출여부
	 */        
    private String displayYn;
    
	/*
	 * 작성자
	 */        
    private String adminId;    
    
	/*
	 * 등록일
	 */        
    private String regTime;
    
    /* 페이징 */
    private int startIndex;
    
    private int cntPerPage;
    
    /* 검색 */
    private String searchKey;
    
    private String searchValue;     
    
    private ArrayList<Banner> list;
}
