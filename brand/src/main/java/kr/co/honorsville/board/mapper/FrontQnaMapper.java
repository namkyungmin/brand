package kr.co.honorsville.board.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.dto.FrontQna;

@Repository
public interface FrontQnaMapper {
 
    public FrontQna getQnaIdx(FrontQna qna) throws Exception;
    
    public int getQnaListCnt(FrontQna qna) throws Exception;
    
    public List<FrontQna> getQnaList(FrontQna qna) throws Exception;
    
    public Long insertQna(FrontQna qna) throws Exception;
    
    public Long updateQna(FrontQna qna) throws Exception;
    
    public Long replyUpdateQna(FrontQna qna) throws Exception;
    
    public Long deleteQna(FrontQna qna) throws Exception;
    
    public Long insertFile(FrontFile file) throws Exception;
    
    public List<FrontFile> getFileList(FrontFile file) throws Exception;
    
    public FrontFile getFileIdx(FrontFile file) throws Exception;
}


