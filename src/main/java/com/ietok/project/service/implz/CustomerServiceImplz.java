package com.ietok.project.service.implz;

import com.ietok.project.dao.CustomerDao;
import com.ietok.project.entity.Customer;
import com.ietok.project.service.service.CustomerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("customerService")
public class CustomerServiceImplz implements CustomerService {
    @Resource
    private CustomerDao customerDao;

    @Override
    public boolean addCustomer(String name, String pass) {
        if(name==null||pass==null){
            return false;
        }
        Customer customer = new Customer();
        customer.setC_account(name);
        customer.setC_pass(name);
        return customerDao.addCustomer(customer);
    }

    @Override
    public Customer getCustomer(String name, String pass) {
        if(name==null||pass==null){
            return null;
        }
        Customer customer = new Customer();
        customer.setC_account(name);
        customer.setC_pass(pass);
        return customerDao.getCustomer(customer);
    }
}
