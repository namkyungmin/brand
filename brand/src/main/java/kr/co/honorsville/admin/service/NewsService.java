package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.File;
import kr.co.honorsville.admin.dto.News;
import kr.co.honorsville.admin.mapper.NewsMapper;
 
@Service
public class NewsService {
 
    @Autowired
    NewsMapper newsMapper;
    
    public  News getNewsIdx(News news) throws Exception{
    	return newsMapper.getNewsIdx(news);
    }    
    
    public  int getNewsListCnt(News news) throws Exception{
    	return newsMapper.getNewsListCnt(news);
    }        
    
    public  List<News> getNewsList(News news) throws Exception{
    	return newsMapper.getNewsList(news);
    }     
    
    public  Long insertNews(News news) throws Exception{
    	return newsMapper.insertNews(news);
    }
    
    public  Long updateNews(News news) throws Exception{
    	return newsMapper.updateNews(news);
    }            
    
    public  Long deleteNews(News news) throws Exception{
    	return newsMapper.deleteNews(news);
    } 
    
    
    public  Long insertFile(File file) throws Exception{
    	return newsMapper.insertFile(file);
    }
    
    public  Long updateFile(File file) throws Exception{
    	return newsMapper.updateFile(file);
    }            
    
    public  Long deleteFile(File file) throws Exception{
    	return newsMapper.deleteFile(file);
    }        
    
    public  List<File> getFileList(File file) throws Exception{
    	return newsMapper.getFileList(file);
    }    
    
    
}
