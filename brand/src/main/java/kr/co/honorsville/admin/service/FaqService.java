package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.Faq;
import kr.co.honorsville.admin.mapper.FaqMapper;
 
@Service
public class FaqService {
 
    @Autowired
    FaqMapper faqMapper;
    
    public  Faq getFaqIdx(Faq faq) throws Exception{
    	return faqMapper.getFaqIdx(faq);
    }    
    
    public  int getFaqListCnt(Faq faq) throws Exception{
    	return faqMapper.getFaqListCnt(faq);
    }        
    
    public  List<Faq> getFaqList(Faq faq) throws Exception{
    	return faqMapper.getFaqList(faq);
    }     
    
    public  Long insertFaq(Faq faq) throws Exception{
    	return faqMapper.insertFaq(faq);
    }      
    
    public  Long updateFaq(Faq faq) throws Exception{
    	return faqMapper.updateFaq(faq);
    }            
    
    public  Long deleteFaq(Faq faq) throws Exception{
    	return faqMapper.deleteFaq(faq);
    }        
    
}
