package com.ietok.project.service.service;

import com.ietok.project.entity.Department;

import java.util.List;

public interface DepartmentService {
    boolean addDep(Department department);
    boolean delDep(Department department);
    boolean updateDep(Department department);

    List<Department> getDepartments();
}
