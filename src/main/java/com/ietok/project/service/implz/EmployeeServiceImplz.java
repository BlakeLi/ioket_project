package com.ietok.project.service.implz;

import com.ietok.project.dao.CvDao;
import com.ietok.project.dao.EmployeeDao;
import com.ietok.project.dao.RecruitDao;
import com.ietok.project.entity.Cv;
import com.ietok.project.entity.Employee;
import com.ietok.project.entity.Recruit;
import com.ietok.project.service.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("employeeService")
public class EmployeeServiceImplz implements EmployeeService {
    @Resource
    EmployeeDao employeeDao;
    @Resource
    CvDao cvDao;
    @Resource
    RecruitDao recruitDao;

    //姓名，性别，地址通过CV得到，工资岗位ID通过招聘获得，借记卡号，电话输入
    @Override
    public boolean addEmployee(Employee employee, Integer cv_id, Integer rct_id) {
        Cv c = new Cv();
        c.setCv_id(cv_id);
        Cv cv = cvDao.getCv(c);
        Recruit recruit = new Recruit();
        recruit.setRct_id(rct_id);
        Recruit rct = recruitDao.getRecruitByID(recruit);
        if(rct!=null&&rct.getRct_id()!=null&&cv!=null&&cv.getCv_id()!=null){
            employee.setE_name(cv.getCv_name());
            employee.setE_gender(cv.getCv_gender());
            employee.setE_address(cv.getCv_address());
            employee.setPos_id(rct.getPos_id());
            employee.setE_salary(rct.getRct_salary());
            return employeeDao.addEmployee(employee);
        }
        return false;
    }
}
