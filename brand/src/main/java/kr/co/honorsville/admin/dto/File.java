package kr.co.honorsville.admin.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

/**
 * 
 * tb_board_file 테이블
 * 게시판 공통 파일 테이블
 * 
 * @author CooperEom
 *
 */
@Getter
@Setter
@Component
public class File {
 
	/*
	 * 고유키
	 */
    private Long fileId;
    
    /*
     * 코드
     */
    private String boardCode;
    
    /*
     * 코드
     */
    private Long boardId;    

    /*
     * 우선순위
     */    
    private int fileSeq;
    
    /*
     * 파일 내용
     */    
    private String fileName;

    /*
     * 파일 위치
     */    
    private String filePath;
    
    /*
     * 확장자
     */    
    private String fileExt;
    
    /*
     * 용량
     */    
    private int fileSize;
         
}
