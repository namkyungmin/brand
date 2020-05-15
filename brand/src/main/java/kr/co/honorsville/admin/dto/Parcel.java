package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * tb_parcel 테이블 
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class Parcel {
	/*
	 * 분양 고유번호
	 */         
	private Long parcelId;

	/*
	 * 분양명
	 */
	private String parcelName;
	
	/*
	 * 분양 단계
	 */	
	private String parcelStage;
	
	/*
	 * 분양 타입
	 */	
	private String parcelType;	
	
	/*
	 * 분양 단계 기타
	 */	
	private String parcelStageEtc;
	
	/*
	 * 지역
	 */	
	private String parcelArea;
	
	/*
	 * 썸네일 이미지 PC
	 */	
	private String parcelListImage;
	
	/*
	 * 썸네일 이미지 MO
	 */	
	private String parcelListImageMo;
	
	/*
	 * 상세 이미지 PC
	 */	
	private String parcelDetailImage;
	
	/*
	 * 상세 이미지 MO
	 */	
	private String parcelDetailImageMo;
	
	/*
	 * 분양 홈페이지 URL
	 */	
	private String homepageUrl;
	
	/*
	 * 분양 홈페이지 URL 타겟
	 */	
	private String homepageTarget;
	
	/*
	 * 모집공고 시작일
	 */	
	private String announceStartDate;
	
	/*
	 * 모집공고 종료일
	 */	
	private String announceEndDate;

	/*
	 * 당첨자발표 시작일
	 */
	private String winnerStartDate;

	/*
	 * 당첨자발표 종료일
	 */
	private String winnerEndDate;
	
	/*
	 * 청약 접수 시작일
	 */	
	private String applicationStartDate;

	/*
	 * 청약 접수 종료일
	 */	
	private String applicationEndDate;
	
	/*
	 * 게약 시작일
	 */		
	private String contractStartDate;
	
	/*
	 * 게약 종료일
	 */			
	private String contractEndDate;
	
	/*
	 * 노출 여부
	 */			
	private String displayYn;
	
	/*
	 * 위치
	 */			
	private String location;
	
	/*
	 * 문의
	 */			
	private String inquiry;
	
	/*
	 * 분양시기
	 */			
	private String period;
	
	/*
	 * 규모
	 */			
	private String scale;

	/*
	 * 시공사
	 */			
	private String constructorCompany;
	
	/*
	 * 입주 시기
	 */			
	private String admission;
	
	/*
	 * 세대수
	 */			
	private String numbers;
	
	/*
	 * 시행사
	 */			
	private String enforcementCompany;

	/*
	 * 건축면적
	 */		
	private String buildingArea;
	
	/*
	 * 건폐율
	 */			
	private String buildingRate;
	
	/*
	 * 연면적
	 */			
	private String totalArea;

	/*
	 * 용적율
	 */		
	private String floorArea;
	
	/*
	 * 대지면적
	 */			
	private String plottage;
	
	/*
	 * 현장 위치
	 */			
	private String constructionLocation;
	
	/*
	 * 현장 문의
	 */			
	private String constructionInquiry;
	
	/*
	 * 현장 PC  이미지
	 */			
	private String constructionImagePc;
	
	/*
	 * 현장 MO  이미지
	 */				
	private String constructionImageMo;

	/*
	 * 현잔위치 노출 여부
	 */				
	private String constructionDisplayYn;

	/*
	 * 견본주택 위치
	 */
	private String modelhouseLocation;
	
	/*
	 * 견본주택 문의
	 */	
	private String modelhouseInquiry;

	/*
	 * 견본주택 PC 이미지
	 */
	private String modelhouseImagePc;
	
	/*
	 * 견본주택 모바일 이미지
	 */	
	private String modelhouseImageMo;
	
	/*
	 * 견본주택 노출 여부
	 */	
	private String modelhouseDisplayYn;
	
	/*
	 * 등록시간
	 */        
    private String regTime;
    
    /* 페이징 */
    private int startIndex;
    
    private int cntPerPage;
    
    /* 검색 */
    private String searchKey;
    
    private String searchValue;    
}