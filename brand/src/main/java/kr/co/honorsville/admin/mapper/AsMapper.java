package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.As;

@Repository
public interface AsMapper {
 
    public As getAsIdx(As as) throws Exception;
    
    public int getAsListCnt(As as) throws Exception;
    
    public List<As> getAsList(As as) throws Exception;
    
    public Long insertAs(As as) throws Exception;
    
    public Long updateAs(As as) throws Exception;
    
    public Long replyUpdateAs(As as) throws Exception;
    
    public Long deleteAs(As as) throws Exception;
}


