package com.ietok.project.dao;

import com.ietok.project.entity.Department;
import com.ietok.project.entity.Employee;

import java.util.List;

public interface EmployeeDao {
    boolean addEmployee(Employee employee);
    boolean updateEmployee(Employee employee);
    boolean delEmployee(Employee employee);

    Employee getEmployeeByNameAndPass(Employee employee);
    Employee getEmployee(Employee employee);
    List<Employee> getEmployeesByPosID(Integer pos_id);
    List<Employee> getEmpNotInPos(Employee employee);
    List<Employee> getEmpByDep(Department department);
    List<Employee> getEmpNotInDep(Department department);
    List<Employee> getAllEmployee();

    List<Employee> getAllEmployeeWork();
}
