package kr.co.honorsville.admin.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.admin.dto.AdminAccessIp;
import kr.co.honorsville.admin.mapper.AdminMapper;
 
@Service
public class AdminService {
 
    @Autowired
    AdminMapper adminMapper;
    
    public List<Admin> getAll() throws Exception{
        return adminMapper.getAll();
    }
    
    public  Admin getAdmin(Admin admin) throws Exception{
    	return adminMapper.getAdmin(admin);
    }    
    
    public  Admin getAdminId(Admin admin) throws Exception{
    	return adminMapper.getAdminId(admin);
    }    
    
    public  Admin getAdminIdx(Admin admin) throws Exception{
    	return adminMapper.getAdminIdx(admin);
    }    
    
    public  int getAdminListCnt(Admin admin) throws Exception{
    	return adminMapper.getAdminListCnt(admin);
    }        
    
    public  List<Admin> getAdminList(Admin admin) throws Exception{
    	return adminMapper.getAdminList(admin);
    }    
    
    public  Long insertAdmin(Admin admin) throws Exception{
    	return adminMapper.insertAdmin(admin);
    }        
    
    public  Long updateAdmin(Admin admin) throws Exception{
    	return adminMapper.updateAdmin(admin);
    }
    
    public  Long updateAdminLoginCnt(Admin admin) throws Exception{
    	return adminMapper.updateAdminLoginCnt(admin);
    }
    
    public  Long updateAdminLoginCntReset(Admin admin) throws Exception{
    	return adminMapper.updateAdminLoginCntReset(admin);
    }        
        
    
    public  Long deleteAdmin(Admin admin) throws Exception{
    	return adminMapper.deleteAdmin(admin);
    }        
    
    public  Long resetAdminPassword(Admin admin) throws Exception{
    	return adminMapper.resetAdminPassword(admin);
    }    
    
    public  Long updateMypage(Admin admin) throws Exception{
    	return adminMapper.updateMypage(admin);
    }            

    public  AdminAccessIp getAdminAccessIp(AdminAccessIp adminAccessIp) throws Exception{
    	return adminMapper.getAdminAccessIp(adminAccessIp);
    }    
}
