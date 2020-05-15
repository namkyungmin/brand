package kr.co.honorsville.board.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.board.dto.FrontFile;
import kr.co.honorsville.board.dto.FrontNews;
import kr.co.honorsville.board.mapper.FrontNewsMapper;
 
@Service
public class FrontNewsService {
 
    @Autowired
    FrontNewsMapper newsMapper;
    
    public  FrontNews getNewsIdx(FrontNews news) throws Exception{
    	return newsMapper.getNewsIdx(news);
    }    
    
    public  int getNewsListCnt(FrontNews news) throws Exception{
    	return newsMapper.getNewsListCnt(news);
    }        
    
    public  List<FrontNews> getNewsList(FrontNews news) throws Exception{
    	return newsMapper.getNewsList(news);
    }     
    
    public  Long updateNewsCnt(FrontNews news) throws Exception{
    	return newsMapper.updateNewsCnt(news);
    }            
 
    
    
    public  Long insertFile(FrontFile file) throws Exception{
    	return newsMapper.insertFile(file);
    }
    
    public  Long updateFile(FrontFile file) throws Exception{
    	return newsMapper.updateFile(file);
    }            
    
    public  Long deleteFile(FrontFile file) throws Exception{
    	return newsMapper.deleteFile(file);
    }        
    
    public  List<FrontFile> getFileList(FrontFile file) throws Exception{
    	return newsMapper.getFileList(file);
    }    
    
    
}
