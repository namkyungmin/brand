package kr.co.honorsville.admin.mapper;
 
import java.util.List;


import org.springframework.stereotype.Repository;

import kr.co.honorsville.admin.dto.Customer;

@Repository
public interface CustomerMapper {
 
    public Customer getCustomerIdx(Customer customer) throws Exception;
    
    public int getCustomerListCnt(Customer customer) throws Exception;
    
    public List<Customer> getCustomerList(Customer customer) throws Exception;
    
    public Long deleteCustomer(Customer customer) throws Exception;
}


