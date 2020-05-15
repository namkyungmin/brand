package kr.co.honorsville.board.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.dto.FrontNews;

@Repository
public interface FrontNewsMapper {
 
    public FrontNews getNewsIdx(FrontNews news) throws Exception;
    
    public int getNewsListCnt(FrontNews news) throws Exception;
    
    public List<FrontNews> getNewsList(FrontNews news) throws Exception;
    
    public Long updateNewsCnt(FrontNews news) throws Exception;
    
    public Long insertFile(FrontFile file) throws Exception;
    
    public Long updateFile(FrontFile file) throws Exception;
    
    public Long deleteFile(FrontFile file) throws Exception;    
    
    public List<FrontFile> getFileList(FrontFile file) throws Exception;
}


