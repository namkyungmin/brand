package kr.co.honorsville.board.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.board.dto.FrontFaq;
import kr.co.honorsville.board.dto.FrontFile;

@Repository
public interface FrontFaqMapper {
 
    public FrontFaq getFaqIdx(FrontFaq faq) throws Exception;
    
    public int getFaqListCnt(FrontFaq faq) throws Exception;
    
    public List<FrontFaq> getFaqList(FrontFaq faq) throws Exception;
    
    public Long insertFaq(FrontFaq faq) throws Exception;
    
    public Long updateFaq(FrontFaq faq) throws Exception;
    
    public Long deleteFaq(FrontFaq faq) throws Exception;
    
}


