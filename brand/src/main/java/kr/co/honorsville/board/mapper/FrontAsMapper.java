package kr.co.honorsville.board.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.File;
import kr.co.honorsville.board.dto.FrontAs;
import kr.co.honorsville.board.dto.FrontFile;

@Repository
public interface FrontAsMapper {
 
    public FrontAs getAsIdx(FrontAs as) throws Exception;
    
    public int getAsListCnt(FrontAs as) throws Exception;
    
    public List<FrontAs> getAsList(FrontAs as) throws Exception;
    
    public Long insertAs(FrontAs as) throws Exception;
    
    public Long updateAs(FrontAs as) throws Exception;
    
    public Long replyUpdateAs(FrontAs as) throws Exception;
    
    public Long deleteAs(FrontAs as) throws Exception;
    
    public Long insertFile(FrontFile file) throws Exception;
    
    public List<FrontFile> getFileList(FrontFile file) throws Exception;
}


