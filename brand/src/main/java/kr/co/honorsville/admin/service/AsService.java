package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.As;
import kr.co.honorsville.admin.mapper.AsMapper;
 
@Service
public class AsService {
 
    @Autowired
    AsMapper asMapper;
    
    public  As getAsIdx(As as) throws Exception{
    	return asMapper.getAsIdx(as);
    }    
    
    public  int getAsListCnt(As as) throws Exception{
    	return asMapper.getAsListCnt(as);
    }        
    
    public  List<As> getAsList(As as) throws Exception{
    	return asMapper.getAsList(as);
    }     
    
    public  Long insertAs(As as) throws Exception{
    	return asMapper.insertAs(as);
    }                
    
    public  Long updateAs(As as) throws Exception{
    	return asMapper.updateAs(as);
    }            
    
    public  Long replyUpdateAs(As as) throws Exception{
    	return asMapper.replyUpdateAs(as);
    }                
    
    public  Long deleteAs(As as) throws Exception{
    	return asMapper.deleteAs(as);
    }        
    
}
