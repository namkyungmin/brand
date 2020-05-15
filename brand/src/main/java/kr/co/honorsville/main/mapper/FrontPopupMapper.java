package kr.co.honorsville.main.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.main.dto.FrontPopup;

@Repository
public interface FrontPopupMapper {
 
    public List<FrontPopup> getPopupList(FrontPopup popup) throws Exception;
}


