package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.ParcelPlan;

@Repository
public interface ParcelPlanMapper {
 
    public ParcelPlan getParcelPlanIdx(ParcelPlan parcelPlan) throws Exception;
    
    public int getParcelPlanListCnt(ParcelPlan parcelPlan) throws Exception;
    
    public List<ParcelPlan> getParcelPlanList(ParcelPlan parcelPlan) throws Exception;
    
    public Long insertParcelPlan(ParcelPlan parcelPlan) throws Exception;
    
    public Long updateParcelPlan(ParcelPlan parcelPlan) throws Exception;
    
    public Long deleteParcelPlan(ParcelPlan parcelPlan) throws Exception;
}


