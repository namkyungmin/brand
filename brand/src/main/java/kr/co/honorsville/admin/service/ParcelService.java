package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.Parcel;

import kr.co.honorsville.admin.mapper.ParcelMapper;
 
@Service
public class ParcelService {
 
    @Autowired
    ParcelMapper parcelMapper;
    
    public  Parcel getParcelIdx(Parcel parcel) throws Exception{
    	return parcelMapper.getParcelIdx(parcel);
    }    
    
    public  int getParcelListCnt(Parcel parcel) throws Exception{
    	return parcelMapper.getParcelListCnt(parcel);
    }        
    
    public  List<Parcel> getParcelList(Parcel parcel) throws Exception{
    	return parcelMapper.getParcelList(parcel);
    }     
    
    public  Long insertParcel(Parcel parcel) throws Exception{
    	return parcelMapper.insertParcel(parcel);
    }                
    
    public  Long updateParcel(Parcel parcel) throws Exception{
    	return parcelMapper.updateParcel(parcel);
    }            
    
    public  Long deleteParcel(Parcel parcel) throws Exception{
    	return parcelMapper.deleteParcel(parcel);
    }        
    
}
