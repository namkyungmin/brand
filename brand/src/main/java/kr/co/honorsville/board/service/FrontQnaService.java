package kr.co.honorsville.board.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.dto.FrontQna;
import kr.co.honorsville.board.mapper.FrontQnaMapper;
 

@Service
public class FrontQnaService {
 
    @Autowired
    FrontQnaMapper qnaMapper;
    
    public  FrontQna getQnaIdx(FrontQna qna) throws Exception{
    	return qnaMapper.getQnaIdx(qna);
    }    
    
    public  int getQnaListCnt(FrontQna qna) throws Exception{
    	return qnaMapper.getQnaListCnt(qna);
    }        
    
    public  List<FrontQna> getQnaList(FrontQna qna) throws Exception{
    	return qnaMapper.getQnaList(qna);
    }     
    
    public  Long insertQna(FrontQna qna) throws Exception{
    	return qnaMapper.insertQna(qna);
    }                
    
    public  Long updateQna(FrontQna qna) throws Exception{
    	return qnaMapper.updateQna(qna);
    }            
    
    public  Long replyUpdateQna(FrontQna qna) throws Exception{
    	return qnaMapper.replyUpdateQna(qna);
    }                
    
    public  Long deleteQna(FrontQna qna) throws Exception{
    	return qnaMapper.deleteQna(qna);
    }    
    
    public  Long insertFile(FrontFile file) throws Exception{
    	return qnaMapper.insertFile(file);
    }    
    
    public  List<FrontFile> getFileList(FrontFile file) throws Exception{
    	return qnaMapper.getFileList(file);
    }
    
    public  FrontFile getFileIdx(FrontFile file) throws Exception{
    	return qnaMapper.getFileIdx(file);
    }          
    
}
