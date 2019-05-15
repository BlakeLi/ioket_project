package com.ietok.project.dao;

import com.ietok.project.entity.Customer;


public interface CustomerDao {
    boolean addCustomer(Customer customer);
    Customer getCustomer(Customer customer);
}
