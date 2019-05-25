package com.ietok.project.service.implz;

import com.ietok.project.dao.AttendanceDao;
import com.ietok.project.dao.EmployeeDao;
import com.ietok.project.dao.RewardDao;
import com.ietok.project.dao.SalaryDao;
import com.ietok.project.entity.Attendance;
import com.ietok.project.entity.Employee;
import com.ietok.project.entity.Reward;
import com.ietok.project.entity.Salary;
import com.ietok.project.service.service.SalaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("salaryService")
public class SalaryServiceImplz implements SalaryService {
    @Resource
    private SalaryDao salaryDao;
    @Resource
    private EmployeeDao employeeDao;
    @Resource
    private RewardDao rewardDao;
    @Resource
    private AttendanceDao attendanceDao;

    @Override
    public boolean addSalary(Salary salary) {
        if(salary!=null&&salary.getE_id()!=null){
            Employee emp = new Employee();
            emp.setE_id(salary.getE_id());
            Employee employee = employeeDao.getEmployee(emp);
            //社保
            salary.setS_s_insurance(employee.getE_salary()*0.1);

            //奖惩
            Reward reward = new Reward();
            reward.setE_id(salary.getE_id());
            List<Reward> rewards = rewardDao.getRewardsByDateAndE_id(reward);
            salary.setS_reward(0.00);
            for (Reward rw : rewards) {
                salary.setS_reward(salary.getS_reward()+rw.getR_money());
            }

            //考勤
            Attendance attendance = new Attendance();
            attendance.setE_id(salary.getE_id());
            salary.setS_extra(0.00);
            List<Attendance> times = attendanceDao.getAttendanceByE_idAndDate(attendance);
            int count = times.size();
            for (Attendance time : times) {
                if(time.getAtd_start_time()==null||time.getAtd_end_time()==null){
                    count = count - 1;
                }
            }
            salary.setS_extra(salary.getS_extra()+(count-22)*20);

            //总额
            salary.setS_total(0.00);
            salary.setS_total(employee.getE_salary()+salary.getS_performance()+salary.getS_extra()+salary.getS_reward()-salary.getS_s_insurance());
            return salaryDao.addSalary(salary);
        }
        return false;
    }

    @Override
    public boolean updateSalary(Salary salary) {
        if(salary!=null&&salary.getS_id()!=null){
            Salary sly = salaryDao.getSalary(salary);
            if(sly.getS_is_trouble()==1){
                sly.setS_is_trouble(0);
            }else{
                sly.setS_is_trouble(1);
            }
            return salaryDao.updateSalary(sly);
        }
        return false;
    }

    //检测一个月不能2次发薪
    @Override
    public List<Salary> getSalarysByDateAndE_id(Salary salary) {
        if(salary==null||salary.getS_date()==null||salary.getE_id()==null){
            return null;
        }
        return salaryDao.getSalarysByDateAndE_id(salary);
    }

    @Override
    public List<Salary> getSalaryByTroubleAndE_id(Salary salary) {
        return salaryDao.getSalaryByTroubleAndE_id(salary);
    }

    @Override
    public Salary getSalarysByE_idAndDate(Integer e_id) {
        if(e_id == null){
            return null;
        }
        Salary salary = new Salary();
        salary.setE_id(e_id);
        return salaryDao.getSalaryByE_idAndDate(salary);
    }
}
