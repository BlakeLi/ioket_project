package com.ietok.project.dao;

import com.ietok.project.entity.Employee;

public interface EmployeeDao {
    boolean addEmployee(Employee employee);
    boolean updateEmployee(Employee employee);
    boolean delEmployee(Employee employee);

    Employee getEmployee(Employee employee);
}
