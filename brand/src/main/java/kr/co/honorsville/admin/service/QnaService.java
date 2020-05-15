package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.Qna;
import kr.co.honorsville.admin.mapper.QnaMapper;
 
@Service
public class QnaService {
 
    @Autowired
    QnaMapper qnaMapper;
    
    public  Qna getQnaIdx(Qna qna) throws Exception{
    	return qnaMapper.getQnaIdx(qna);
    }    
    
    public  int getQnaListCnt(Qna qna) throws Exception{
    	return qnaMapper.getQnaListCnt(qna);
    }        
    
    public  List<Qna> getQnaList(Qna qna) throws Exception{
    	return qnaMapper.getQnaList(qna);
    }     
    
    public  Long insertQna(Qna qna) throws Exception{
    	return qnaMapper.insertQna(qna);
    }                
    
    public  Long updateQna(Qna qna) throws Exception{
    	return qnaMapper.updateQna(qna);
    }            
    
    public  Long replyUpdateQna(Qna qna) throws Exception{
    	return qnaMapper.replyUpdateQna(qna);
    }                
    
    public  Long deleteQna(Qna qna) throws Exception{
    	return qnaMapper.deleteQna(qna);
    }        
    
}
