package kr.co.honorsville.board.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.board.dto.FrontFaq;
import kr.co.honorsville.board.mapper.FrontFaqMapper;
 
@Service
public class FrontFaqService {
 
    @Autowired
    FrontFaqMapper faqMapper;
    
    public  FrontFaq getFaqIdx(FrontFaq faq) throws Exception{
    	return faqMapper.getFaqIdx(faq);
    }    
    
    public  int getFaqListCnt(FrontFaq faq) throws Exception{
    	return faqMapper.getFaqListCnt(faq);
    }        
    
    public  List<FrontFaq> getFaqList(FrontFaq faq) throws Exception{
    	return faqMapper.getFaqList(faq);
    }     
    
    public  Long insertFaq(FrontFaq faq) throws Exception{
    	return faqMapper.insertFaq(faq);
    }      
    
    public  Long updateFaq(FrontFaq faq) throws Exception{
    	return faqMapper.updateFaq(faq);
    }            
    
    public  Long deleteFaq(FrontFaq faq) throws Exception{
    	return faqMapper.deleteFaq(faq);
    }        
    
}
