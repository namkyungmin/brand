package kr.co.honorsville.board.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.board.dto.FrontAs;
import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.mapper.FrontAsMapper;
 
@Service
public class FrontAsService {
 
    @Autowired
    FrontAsMapper asMapper;
    
    public  FrontAs getAsIdx(FrontAs as) throws Exception{
    	return asMapper.getAsIdx(as);
    }    
    
    public  int getAsListCnt(FrontAs as) throws Exception{
    	return asMapper.getAsListCnt(as);
    }        
    
    public  List<FrontAs> getAsList(FrontAs as) throws Exception{
    	return asMapper.getAsList(as);
    }     
    
    public  Long insertAs(FrontAs as) throws Exception{
    	return asMapper.insertAs(as);
    }                
    
    public  Long updateAs(FrontAs as) throws Exception{
    	return asMapper.updateAs(as);
    }            
    
    public  Long replyUpdateAs(FrontAs as) throws Exception{
    	return asMapper.replyUpdateAs(as);
    }                
    
    public  Long deleteAs(FrontAs as) throws Exception{
    	return asMapper.deleteAs(as);
    }
    
    public  Long insertFile(FrontFile file) throws Exception{
    	return asMapper.insertFile(file);
    }        
    
    public  List<FrontFile> getFileList(FrontFile file) throws Exception{
    	return asMapper.getFileList(file);
    }        
    
}
