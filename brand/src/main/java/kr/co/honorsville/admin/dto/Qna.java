package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * tb_board_qna 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class Qna {
 
	/*
	 * 고유번호
	 */
    private Long qnaId;

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
	 * 파일
	 */    
    private String file;
    
	/*
	 * 등록 아이디
	 */    
    private String userId;
    
	/*
	 * 등록일
	 */    
    private String regTime;
    
	/*
	 * 연락처
	 */
    private String cellPhone;

	/*
	 * 이메일
	 */
    private String email;
    
	/*
	 * 답변 아이디
	 */    
    private String replyId;
    
	/*
	 * 답변시간
	 */    
    private String replyTime;
    
	/*
	 * 답변 내용
	 */    
    private String replyContents;
    
	/*
	 * 비고
	 */    
    private String comment;

	/*
	 * 상태
	 */    
    private String status;
    
    
	/*
	 * 답변횟수
	 */    
    private int replyCnt;
    
    
    /* 페이징 */
    private int startIndex;
    
    private int cntPerPage;
    
    /* 검색 */
    private String searchKey;
    
    private String searchValue;     
    
    private String searchCategory;
}
