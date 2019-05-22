package com.ietok.project.dao;

import com.ietok.project.entity.Department;

import java.util.List;

public interface DepartmentDao {
    boolean addDep(Department department);
    boolean delDep(Department department);
    boolean updateDep(Department department);

    Department getDepartmentByName(Department department);
    List<Department> getDepartments();
}
