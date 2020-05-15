package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.Parcel;
import kr.co.honorsville.admin.dto.ParcelPlan;
import kr.co.honorsville.admin.mapper.ParcelMapper;
import kr.co.honorsville.admin.mapper.ParcelPlanMapper;
 
@Service
public class ParcelPlanService {
 
    @Autowired
    ParcelPlanMapper parcelPlanMapper;
    
    public  ParcelPlan getParcelPlanIdx(ParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.getParcelPlanIdx(parcelPlan);
    }    
    
    public  int getParcelPlanListCnt(ParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.getParcelPlanListCnt(parcelPlan);
    }        
    
    public List<ParcelPlan> getParcelPlanList(ParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.getParcelPlanList(parcelPlan);
    }     
    
    public  Long insertParcelPlan(ParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.insertParcelPlan(parcelPlan);
    }                
    
    public  Long updateParcelPlan(ParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.updateParcelPlan(parcelPlan);
    }            
    
    public  Long deleteParcelPlan(ParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.deleteParcelPlan(parcelPlan);
    }

    
}
