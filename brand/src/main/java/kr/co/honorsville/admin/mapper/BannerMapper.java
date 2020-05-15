package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.Banner;

@Repository
public interface BannerMapper {
 
    public Banner getBannerIdx(Banner banner) throws Exception;
    
    public int getBannerListCnt(Banner banner) throws Exception;
    
    public List<Banner> getBannerList(Banner banner) throws Exception;
    
    public Long insertBanner(Banner banner) throws Exception;
    
    public Long updateBanner(Banner banner) throws Exception;
    
    public Long updateSortBanner(Banner banner) throws Exception;
    
    public Long deleteBanner(Banner banner) throws Exception;
}


