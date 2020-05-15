package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.Popup;

@Repository
public interface PopupMapper {
 
    public Popup getPopupIdx(Popup popup) throws Exception;
    
    public int getPopupListCnt(Popup popup) throws Exception;
    
    public List<Popup> getPopupList(Popup popup) throws Exception;
    
    public Long insertPopup(Popup popup) throws Exception;
    
    public Long updatePopup(Popup popup) throws Exception;
    
    public Long deletePopup(Popup popup) throws Exception;
}


