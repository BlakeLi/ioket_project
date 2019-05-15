package com.ietok.project.service.service;

import com.ietok.project.entity.Customer;

public interface CustomerService {
    boolean addCustomer(String name,String pass);
    Customer getCustomer(String name,String pass);
}
