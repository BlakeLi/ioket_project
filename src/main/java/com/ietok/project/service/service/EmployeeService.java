package com.ietok.project.service.service;

import com.ietok.project.entity.Employee;

public interface EmployeeService {
    boolean addEmployee(Employee employee,Integer cv_id,Integer rct_id);
}
