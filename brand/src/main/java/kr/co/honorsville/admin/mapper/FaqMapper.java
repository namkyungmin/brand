package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.Faq;

@Repository
public interface FaqMapper {
 
    public Faq getFaqIdx(Faq faq) throws Exception;
    
    public int getFaqListCnt(Faq faq) throws Exception;
    
    public List<Faq> getFaqList(Faq faq) throws Exception;
    
    public Long insertFaq(Faq faq) throws Exception;
    
    public Long updateFaq(Faq faq) throws Exception;
    
    public Long deleteFaq(Faq faq) throws Exception;
}


