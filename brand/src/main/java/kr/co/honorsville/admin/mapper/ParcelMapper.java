package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.Parcel;

@Repository
public interface ParcelMapper {
 
    public Parcel getParcelIdx(Parcel parcel) throws Exception;
    
    public int getParcelListCnt(Parcel parcel) throws Exception;
    
    public List<Parcel> getParcelList(Parcel parcel) throws Exception;
    
    public Long insertParcel(Parcel parcel) throws Exception;
    
    public Long updateParcel(Parcel parcel) throws Exception;
    
    public Long deleteParcel(Parcel parcel) throws Exception;
}


