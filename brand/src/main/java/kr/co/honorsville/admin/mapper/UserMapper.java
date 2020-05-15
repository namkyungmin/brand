package kr.co.honorsville.admin.mapper;
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.admin.dto.User;
import kr.co.honorsville.admin.dto.UserRetire;

@Repository
public interface UserMapper {
 
    public User getUserId(User user) throws Exception;
    
    public User getUserIdx(User user) throws Exception;
    
    public int getUserListCnt(User user) throws Exception;
    
    public int InsertUserRetireSchedule(UserRetire userRetire) throws Exception;
    
    public int deleteUserRetireSchedule(UserRetire userRetire) throws Exception;
    
    public List<User> getUserList(User user) throws Exception;
    
    public int getUserRetireListCnt(UserRetire userRetire) throws Exception;
    
    public List<UserRetire> getUserRetireList(UserRetire userRetire) throws Exception;
    
    public List<User> getUserScheduleList(User user) throws Exception;
    
    public Long insertUser(User user) throws Exception;
    
    public Long updateUser(User user) throws Exception;
    
    public Long deleteUser(User user) throws Exception;
}


