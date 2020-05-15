package kr.co.honorsville.user.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.user.dto.FrontUser;
import kr.co.honorsville.user.dto.FrontUserRetire;
import kr.co.honorsville.user.mapper.FrontUserMapper;
 
@Service
public class FrontUserService {
 
    @Autowired
    FrontUserMapper userMapper;
    
    public  FrontUser getUserId(FrontUser user) throws Exception{
    	return userMapper.getUserId(user);
    }    
    
    public  FrontUser getUserIdx(FrontUser user) throws Exception{
    	return userMapper.getUserIdx(user);
    }    

    public  FrontUser getUserCheck(FrontUser user) throws Exception{
    	return userMapper.getUserCheck(user);
    }    
    
    public  Long insertUser(FrontUser user) throws Exception{
    	return userMapper.insertUser(user);
    }        
    
    public  Long updateUser(FrontUser user) throws Exception{
    	return userMapper.updateUser(user);
    }    
    
    public  Long updateUserPassword(FrontUser user) throws Exception{
    	return userMapper.updateUserPassword(user);
    }    
    
    public  Long deleteUser(FrontUser user) throws Exception{
    	return userMapper.deleteUser(user);
    }       
    
    public  Long insertUserRetire(FrontUserRetire userRetire) throws Exception{
    	return userMapper.insertUserRetire(userRetire);
    }         
    
    public  Long updateUserUpTime(FrontUser user) throws Exception{
    	return userMapper.updateUserUpTime(user);
    }        
}
