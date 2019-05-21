package com.ietok.project.service.service;

import com.ietok.project.entity.Employee;

import java.util.List;

public interface EmployeeService {
    boolean addEmployee(Employee employee,Integer cv_id,Integer rct_id);
    boolean updateEmployee(Employee employee);
    boolean delEmployee(Integer E_id);

    Employee getEmployeeByNameAndPass(String name,String pass);
    Employee getEmployee(Integer E_id);
    List<Employee> getEmployeesByPosID(Integer pos_id);
}
