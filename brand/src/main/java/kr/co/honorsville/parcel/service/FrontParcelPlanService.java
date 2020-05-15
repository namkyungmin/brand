package kr.co.honorsville.parcel.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.parcel.dto.FrontParcelPlan;
import kr.co.honorsville.parcel.mapper.FrontParcelPlanMapper;
 
@Service
public class FrontParcelPlanService {
 
    @Autowired
    FrontParcelPlanMapper parcelPlanMapper;
    
    public  FrontParcelPlan getParcelPlanIdx(FrontParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.getParcelPlanIdx(parcelPlan);
    }    
    
    public  int getParcelPlanListCnt(FrontParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.getParcelPlanListCnt(parcelPlan);
    }        
    
    public List<FrontParcelPlan> getParcelPlanList(FrontParcelPlan parcelPlan) throws Exception{
    	return parcelPlanMapper.getParcelPlanList(parcelPlan);
    }
    
    
}
