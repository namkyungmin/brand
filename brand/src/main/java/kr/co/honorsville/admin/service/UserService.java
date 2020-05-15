package kr.co.honorsville.admin.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.User;
import kr.co.honorsville.admin.dto.UserRetire;
import kr.co.honorsville.admin.mapper.UserMapper;
 
@Service
public class UserService {
 
    @Autowired
    UserMapper userMapper;
    
    public  User getUserId(User user) throws Exception{
    	return userMapper.getUserId(user);
    }    
    
    public  User getUserIdx(User user) throws Exception{
    	return userMapper.getUserIdx(user);
    }    
    
    public  int getUserListCnt(User user) throws Exception{
    	return userMapper.getUserListCnt(user);
    }
    
    public  int InsertUserRetireSchedule(UserRetire userRetire) throws Exception{
    	return userMapper.InsertUserRetireSchedule(userRetire);
    }
    
    public  int deleteUserRetireSchedule(UserRetire userRetire) throws Exception{
    	return userMapper.deleteUserRetireSchedule(userRetire);
    }    
    
    public  List<User> getUserList(User user) throws Exception{
    	return userMapper.getUserList(user);
    }
    
    public  int getUserRetireListCnt(UserRetire userRetire) throws Exception{
    	return userMapper.getUserRetireListCnt(userRetire);
    }            

    public  List<UserRetire> getUserRetireList(UserRetire userRetire) throws Exception{
    	return userMapper.getUserRetireList(userRetire);
    }
    
    public  List<User> getUserScheduleList(User user) throws Exception{
    	return userMapper.getUserList(user);
    }    
    
    public  Long insertUser(User user) throws Exception{
    	return userMapper.insertUser(user);
    }        
    
    public  Long updateUser(User user) throws Exception{
    	return userMapper.updateUser(user);
    }    
    
    public  Long deleteUser(User user) throws Exception{
    	return userMapper.deleteUser(user);
    }        
    
}
