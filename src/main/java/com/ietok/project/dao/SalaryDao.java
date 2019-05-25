package com.ietok.project.dao;

import com.ietok.project.entity.Salary;

import java.util.List;

public interface SalaryDao {
    boolean addSalary(Salary salary);
    boolean updateSalary(Salary salary);

    Salary getSalary(Salary salary);
    List<Salary> getSalarysByDateAndE_id(Salary salary);
    List<Salary> getSalaryByTroubleAndE_id(Salary salary);
    List<Salary> getSalaryByTrouble();

    Salary getSalaryByE_idAndDate(Salary salary);
}
