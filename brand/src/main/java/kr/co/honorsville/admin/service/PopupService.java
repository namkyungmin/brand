package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.Popup;
import kr.co.honorsville.admin.mapper.PopupMapper;
 
@Service
public class PopupService {
 
    @Autowired
    PopupMapper popupMapper;
    
    public  Popup getPopupIdx(Popup popup) throws Exception{
    	return popupMapper.getPopupIdx(popup);
    }    
    
    public  int getPopupListCnt(Popup popup) throws Exception{
    	return popupMapper.getPopupListCnt(popup);
    }        
    
    public  List<Popup> getPopupList(Popup popup) throws Exception{
    	return popupMapper.getPopupList(popup);
    }     
    
    public  Long insertPopup(Popup popup) throws Exception{
    	return popupMapper.insertPopup(popup);
    }                
    
    public  Long updatePopup(Popup popup) throws Exception{
    	return popupMapper.updatePopup(popup);
    }            
    
    public  Long deletePopup(Popup popup) throws Exception{
    	return popupMapper.deletePopup(popup);
    }        
    
}
