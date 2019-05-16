package com.ietok.project.dao;

import com.ietok.project.entity.Customer;


public interface CustomerDao {
    //添加游客（账号，密码）
    boolean addCustomer(Customer customer);
    //查询游客（账号，密码）
    Customer getCustomer(Customer customer);
}
