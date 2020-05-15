package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.File;
import kr.co.honorsville.admin.dto.News;

@Repository
public interface NewsMapper {
 
    public News getNewsIdx(News news) throws Exception;
    
    public int getNewsListCnt(News news) throws Exception;
    
    public List<News> getNewsList(News news) throws Exception;
    
    public Long insertNews(News news) throws Exception;
    
    public Long updateNews(News news) throws Exception;
    
    public Long deleteNews(News news) throws Exception;
    
    public Long insertFile(File file) throws Exception;
    
    public Long updateFile(File file) throws Exception;
    
    public Long deleteFile(File file) throws Exception;    
    
    public List<File> getFileList(File file) throws Exception;
}


