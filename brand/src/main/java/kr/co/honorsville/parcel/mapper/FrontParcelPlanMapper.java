package kr.co.honorsville.parcel.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.parcel.dto.FrontParcelPlan;

@Repository
public interface FrontParcelPlanMapper {
 
    public FrontParcelPlan getParcelPlanIdx(FrontParcelPlan parcelPlan) throws Exception;
    
    public int getParcelPlanListCnt(FrontParcelPlan parcelPlan) throws Exception;
    
    public List<FrontParcelPlan> getParcelPlanList(FrontParcelPlan parcelPlan) throws Exception;
}


