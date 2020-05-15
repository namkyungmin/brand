package kr.co.honorsville.parcel.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.parcel.dto.FrontParcel;

import kr.co.honorsville.parcel.mapper.FrontParcelMapper;
 
@Service
public class FrontParcelService {
 
    @Autowired
    FrontParcelMapper parcelMapper;
    
    public  FrontParcel getParcelIdx(FrontParcel parcel) throws Exception{
    	return parcelMapper.getParcelIdx(parcel);
    }    
    
    public  int getParcelListCnt(FrontParcel parcel) throws Exception{
    	return parcelMapper.getParcelListCnt(parcel);
    }        
    
    public  List<FrontParcel> getParcelList(FrontParcel parcel) throws Exception{
    	return parcelMapper.getParcelList(parcel);
    }      
    
    public  FrontParcel getParcelInterest(FrontParcel parcel) throws Exception{
    	return parcelMapper.getParcelInterest(parcel);
    }
    
    public  Long insertParcelInterest(FrontParcel parcel) throws Exception{
    	return parcelMapper.insertParcelInterest(parcel);
    }
    
    public  Long deleteParcelInterest(FrontParcel parcel) throws Exception{
    	return parcelMapper.deleteParcelInterest(parcel);
    }
    
    public  int getParcelInterestListCnt(FrontParcel parcel) throws Exception{
    	return parcelMapper.getParcelInterestListCnt(parcel);
    }            
    
    public  List<FrontParcel> getParcelInterestList(FrontParcel parcel) throws Exception{
    	return parcelMapper.getParcelInterestList(parcel);
    }      
        
    
}
