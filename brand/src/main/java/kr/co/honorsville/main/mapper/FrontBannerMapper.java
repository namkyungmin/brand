package kr.co.honorsville.main.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.main.dto.FrontBanner;

@Repository
public interface FrontBannerMapper {
 
    public List<FrontBanner> getBannerList(FrontBanner banner) throws Exception;
}


