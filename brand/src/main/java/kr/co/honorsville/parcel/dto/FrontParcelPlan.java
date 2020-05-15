package kr.co.honorsville.parcel.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * tb_parcel_annual_plan 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component("FrontParcelPlan")
public class FrontParcelPlan {

	/*
	 * 고유번호
	 */
    private Long planId;

	/*
	 * 분양 단지 명
	 */
    private String parcelName;
    
	/*
	 * 분양 시기
	 */    
    private String parcelPlan;
    
	/*
	 * 분양 시기 년
	 */    
    private String parcelPlanYear;    
    
	/*
	 * 분양 시기 월
	 */    
    private String parcelPlanMonth;        
    
	/*
	 * 홈페이지 URL
	 */    
    private String homepageUrl;
    
	/*
	 * 홈페이지 URL 타겟
	 */    
    private String homepageUrlTarget;    
    
	/*
	 * 노출여부
	 */    
    private String displayYn;
    
	/*
	 * 월 갯수
	 */    
    private int parcelPlanCnt;    

	/*
	 * 연락처
	 */    
    private String inquiry;
    
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
}
