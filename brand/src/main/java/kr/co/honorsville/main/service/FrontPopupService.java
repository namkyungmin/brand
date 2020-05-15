package kr.co.honorsville.main.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.main.dto.FrontPopup;
import kr.co.honorsville.main.mapper.FrontPopupMapper;
 
@Service
public class FrontPopupService {
 
    @Autowired
    FrontPopupMapper popupMapper;
    
    public  List<FrontPopup> getPopupList(FrontPopup popup) throws Exception{
    	return popupMapper.getPopupList(popup);
    }      
}
