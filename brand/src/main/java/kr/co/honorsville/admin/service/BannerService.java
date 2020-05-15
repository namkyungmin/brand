package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.Banner;
import kr.co.honorsville.admin.mapper.BannerMapper;
 
@Service
public class BannerService {
 
    @Autowired
    BannerMapper bannerMapper;
    
    public  Banner getBannerIdx(Banner banner) throws Exception{
    	return bannerMapper.getBannerIdx(banner);
    }    
    
    public  int getBannerListCnt(Banner banner) throws Exception{
    	return bannerMapper.getBannerListCnt(banner);
    }        
    
    public  List<Banner> getBannerList(Banner banner) throws Exception{
    	return bannerMapper.getBannerList(banner);
    }     
    
    public  Long insertBanner(Banner banner) throws Exception{
    	return bannerMapper.insertBanner(banner);
    }                
    
    public  Long updateBanner(Banner banner) throws Exception{
    	return bannerMapper.updateBanner(banner);
    }            
    
    public  Long updateSortBanner(Banner banner) throws Exception{
    	return bannerMapper.updateSortBanner(banner);
    }          
    
    public  Long deleteBanner(Banner banner) throws Exception{
    	return bannerMapper.deleteBanner(banner);
    }        
    
}
