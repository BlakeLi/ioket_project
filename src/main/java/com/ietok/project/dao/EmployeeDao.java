package com.ietok.project.dao;

import com.ietok.project.entity.Employee;

import java.util.List;

public interface EmployeeDao {
    boolean addEmployee(Employee employee);
    boolean updateEmployee(Employee employee);
    boolean delEmployee(Employee employee);

    Employee getEmployee(Employee employee);
    List<Employee> getEmployeesByPosID(Integer pos_id);
}
