package com.ietok.project.controller;

import com.ietok.project.entity.Attendance;
import com.ietok.project.entity.Employee;
import com.ietok.project.entity.Reward;
import com.ietok.project.service.service.AttendanceService;
import com.ietok.project.service.service.EmployeeService;
import com.ietok.project.service.service.RewardService;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component
@EnableScheduling
public class ScheduleChecker {

    @Resource
    private EmployeeService employeeService;
    @Resource
    private AttendanceService attendanceService;
    @Resource
    private RewardService rewardService;

    //工作日9点零1分点检查是否有今日打卡的记录，如果有标记为正常如果没有新生成一条记录，标记为迟到
    @Scheduled(cron = "0 1 9 * * ?")
    public void AttendanceMorningChecker(){
        Attendance attendance;
        List<Employee> employeeList = employeeService.getAllEmployeeInWork();
        for (Employee employee : employeeList) {
            attendance = attendanceService.getAttendanceByDateAndEmployee(employee.getE_id());
            if(attendance==null){
                Attendance auto_atd = new Attendance();
                auto_atd.setE_id(employee.getE_id());
                auto_atd.setAtd_start_info(1);//1代表迟到
                if(attendanceService.AutoAddAttendanceAM(auto_atd)){
                    System.out.println(employee.getE_name()+"早班打卡迟到");
                }
            }else{
                attendance.setAtd_start_info(0);//0代表正常
                if(attendanceService.updateAttendanceAM(attendance)){
                    System.out.println(employee.getE_name()+"早班打卡正常");
                }
            }
        }
    }

    //工作日18点零1分检查今天的打卡记录是否有上班打卡时间，
    // 如果没有则旷工，如果有则检查是否有结束时间如果有则表示早退，如果没有则表示正常
    @Scheduled(cron = "0 1 18 * * ?")
    public void AttendanceEveningChecker(){
        Attendance attendance;
        List<Employee> employeeList = employeeService.getAllEmployeeInWork();
        for (Employee employee : employeeList) {
            attendance = attendanceService.getAttendanceByDateAndEmployee(employee.getE_id());
            if(attendance.getAtd_start_time()==null) {
                Attendance auto_atd = new Attendance();
                auto_atd.setE_id(employee.getE_id());
                auto_atd.setAtd_start_info(0);
                auto_atd.setAtd_end_info(0);
                auto_atd.setAtd_state(1);
                if (attendanceService.AutoAddAttendanceMiss(auto_atd)) {
                }
            }else if(attendance.getAtd_end_time()!=null){
                attendance.setAtd_end_info(1);
                if(attendanceService.updateAttendancePM(attendance)){
                    System.out.println(employee.getE_name()+"下班班打卡早退");
                }
            }else{
                attendance.setAtd_end_info(0);//0代表正常
                if(attendanceService.updateAttendancePM(attendance)){
                    System.out.println(employee.getE_name()+"下班打卡正常");
                }
            }
        }
    }

    @Scheduled(cron = "0 55 23 * * ?")
    public void AttendanceMidNightChecker(){
        List<Employee> employeeList = employeeService.getAllEmployeeInWork();
        for (Employee employee : employeeList) {
            Attendance auto_atd = attendanceService.getAttendanceByDateAndEmployee(employee.getE_id());
            if (auto_atd==null){
                break;
            }
            //早卡未打，或者晚卡未打为旷工,或者上班时间小于7小时
            if(auto_atd.getAtd_start_time()==null||auto_atd.getAtd_end_time()==null||(auto_atd.getAtd_end_time().getTime()-auto_atd.getAtd_start_time().getTime())/1000/60/60<7){
                Attendance attendance = new Attendance();
                attendance.setE_id(auto_atd.getE_id());
                attendance.setAtd_start_info(0);
                attendance.setAtd_end_info(0);
                attendance.setAtd_state(1);
                attendanceService.AutoAddAttendanceMiss(attendance);
            }
            if(auto_atd.getAtd_start_info()==1){
                Reward reward = new Reward();
                reward.setE_id(employee.getE_id());
                reward.setR_reason("迟到");
                reward.setR_money(-100.00);
                rewardService.addReward(reward);
            }
            if(auto_atd.getAtd_end_info()==1){
                Reward reward = new Reward();
                reward.setE_id(employee.getE_id());
                reward.setR_reason("早退");
                reward.setR_money(-100.00);
                rewardService.addReward(reward);
            }
            if(auto_atd.getAtd_state()==1){
                Reward reward = new Reward();
                reward.setE_id(employee.getE_id());
                reward.setR_reason("旷工");
                reward.setR_money(-100.00);
                rewardService.addReward(reward);
            }
        }
    }
}
