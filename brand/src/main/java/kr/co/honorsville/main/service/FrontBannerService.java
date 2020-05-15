package kr.co.honorsville.main.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.main.dto.FrontBanner;
import kr.co.honorsville.main.mapper.FrontBannerMapper;
 
@Service
public class FrontBannerService {
 
    @Autowired
    FrontBannerMapper bannerMapper;
     
    public  List<FrontBanner> getBannerList(FrontBanner banner) throws Exception{
    	return bannerMapper.getBannerList(banner);
    }     
     
}
