package kr.co.honorsville.admin.service;
 
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.honorsville.admin.dto.Customer;
import kr.co.honorsville.admin.mapper.CustomerMapper;
 
@Service
public class CustomerService {
 
    @Autowired
    CustomerMapper customerMapper;
    
    public  Customer getCustomerIdx(Customer customer) throws Exception{
    	return customerMapper.getCustomerIdx(customer);
    }    
    
    public  int getCustomerListCnt(Customer customer) throws Exception{
    	return customerMapper.getCustomerListCnt(customer);
    }        
    
    public  List<Customer> getCustomerList(Customer customer) throws Exception{
    	return customerMapper.getCustomerList(customer);
    }     
    
    public  Long deleteCustomer(Customer customer) throws Exception{
    	return customerMapper.deleteCustomer(customer);
    }        
    
}
