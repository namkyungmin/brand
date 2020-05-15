package kr.co.honorsville.main.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * tb_popup 테이블
 * 
 *  @author CooperEom
 *
 */
@Getter
@Setter
@Component("FrontPopup")
public class FrontPopup {

	/*
	 * 고유번호
	 */
	private Long popupId;

	/*
	 * 제목
	 */
	private String title;
	
	/*
	 * 시작일
	 */	
	private String startDate;
	
	/*
	 * 시작일 일자
	 */	
	private String startDateDate;	
	
	/*
	 * 시작일 시
	 */	
	private String startDateHour;	
	
	/*
	 * 시작일 분
	 */	
	private String startDateMin;	

	/*
	 * 종료일
	 */
	private String endDate;
	

	/*
	 * 종료일 일자
	 */
	private String endDateDate;
	
	/*
	 * 종료일 시
	 */
	private String endDateHour;	
	
	/*
	 * 종료일 분
	 */
	private String endDateMin;	
	
	/*
	 * 텍스트
	 */	
	private String description;
	
	/*
	 * PC 이미지
	 */	
	private String imagePc;
	
	/*
	 * 모바일 이미지
	 */	
	private String imageMo;
	
	/*
	 * PC URL
	 */	
	private String pcUrl;
	
	/*
	 * PC URL 타겟
	 */	
	private String pcUrlTarget;

	/*
	 * 모바일 URL
	 */
	private String moUrl;
	
	/*
	 * 모바일 URL 타겟
	 */	
	private String moUrlTarget;
	
	/*
	 * 상태
	 */	
	private String status;	
	
	/*
	 * x좌표
	 */	
	private int posX;
	
	/*
	 * Y 좌표
	 */	
	private int posY;

	/*
	 * 작성자 아이디
	 */
	private String adminId;
	
	/*
	 * 팝업종류
	 * */
	private String popupType;
	
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
