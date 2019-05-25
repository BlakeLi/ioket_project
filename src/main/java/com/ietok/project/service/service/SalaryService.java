package com.ietok.project.service.service;

import com.ietok.project.entity.Salary;

import java.util.List;

public interface SalaryService {
    boolean addSalary(Salary salary);
    boolean updateSalary(Salary salary);

    List<Salary> getSalarysByDateAndE_id(Salary salary);
    List<Salary> getSalaryByTroubleAndE_id(Salary salary);

    Salary getSalarysByE_idAndDate(Integer e_id);
}
