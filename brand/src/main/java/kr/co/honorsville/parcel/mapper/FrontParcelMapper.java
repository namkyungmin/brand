package kr.co.honorsville.parcel.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.parcel.dto.FrontParcel;

@Repository
public interface FrontParcelMapper {
 
    public FrontParcel getParcelIdx(FrontParcel parcel) throws Exception;
    
    public int getParcelListCnt(FrontParcel parcel) throws Exception;
    
    public List<FrontParcel> getParcelList(FrontParcel parcel) throws Exception;
    
    public FrontParcel getParcelInterest(FrontParcel parcel) throws Exception;
    
    public Long insertParcelInterest(FrontParcel parcel) throws Exception;
    
    public Long deleteParcelInterest(FrontParcel parcel) throws Exception;
    
    public int getParcelInterestListCnt(FrontParcel parcel) throws Exception;
    
    public List<FrontParcel> getParcelInterestList(FrontParcel parcel) throws Exception;
    
}


