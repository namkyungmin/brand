package kr.co.honorsville.admin.mapper;
 
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.Admin;
import kr.co.honorsville.admin.dto.AdminAccessIp;

@Repository
public interface AdminMapper {
 
    public List<Admin> getAll() throws Exception;
    
    public Admin getAdmin(Admin admin) throws Exception;
    
    public Admin getAdminId(Admin admin) throws Exception;
    
    public Admin getAdminIdx(Admin admin) throws Exception;
    
    public int getAdminListCnt(Admin admin) throws Exception;
    
    public List<Admin> getAdminList(Admin admin) throws Exception;
    
    public Long insertAdmin(Admin admin) throws Exception;
    
    public Long updateAdmin(Admin admin) throws Exception;
    
    public Long deleteAdmin(Admin admin) throws Exception;
    
    public Long resetAdminPassword(Admin admin) throws Exception;
    
    public Long updateAdminLoginCnt(Admin admin) throws Exception;
    
    
    public Long updateAdminLoginCntReset(Admin admin) throws Exception;
     
    public Long updateMypage(Admin admin) throws Exception;
    
    public AdminAccessIp getAdminAccessIp(AdminAccessIp adminAccessIp) throws Exception;
    
    
    
    
}


