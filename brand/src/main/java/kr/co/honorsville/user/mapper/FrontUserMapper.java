package kr.co.honorsville.user.mapper;
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import kr.co.honorsville.user.dto.FrontUser;
import kr.co.honorsville.user.dto.FrontUserRetire;

@Repository
public interface FrontUserMapper {
 
    public FrontUser getUserId(FrontUser user) throws Exception;
    
    public FrontUser getUserIdx(FrontUser user) throws Exception;
    
    public FrontUser getUserCheck(FrontUser user) throws Exception;
    
    public Long insertUser(FrontUser user) throws Exception;
    
    public Long updateUser(FrontUser user) throws Exception;
    
    public Long updateUserPassword(FrontUser user) throws Exception;
    
    public Long deleteUser(FrontUser user) throws Exception;
    
    public Long insertUserRetire(FrontUserRetire userRetire) throws Exception;
    
    public Long updateUserUpTime(FrontUser user) throws Exception;
}


