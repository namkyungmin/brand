package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.Qna;

@Repository
public interface QnaMapper {
 
    public Qna getQnaIdx(Qna qna) throws Exception;
    
    public int getQnaListCnt(Qna qna) throws Exception;
    
    public List<Qna> getQnaList(Qna qna) throws Exception;
    
    public Long insertQna(Qna qna) throws Exception;
    
    public Long updateQna(Qna qna) throws Exception;
    
    public Long replyUpdateQna(Qna qna) throws Exception;
    
    public Long deleteQna(Qna qna) throws Exception;
}


