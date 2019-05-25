package com.ietok.project.controller;

import com.ietok.project.entity.*;
import com.ietok.project.service.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class EmployeeServlets{

    @Resource
    private EmployeeService employeeService;
    @Resource
    private RecruitService recruitService;
    @Resource
    private CvService cvService;
    @Resource
    private FifsService fifsService;
    @Resource
    private PositionService positionService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private TrainingService trainingService;
    @Resource
    private AttendanceService attendanceService;
    @Resource
    private SalaryService salaryService;
    @Resource
    private RewardService rewardService;

    //员工和管理员登陆
    @RequestMapping("loginEmployee")
    public String loginEmployee(String name, String pass, HttpSession session){
        Employee employee = employeeService.getEmployeeByNameAndPass(name,pass);
        if(employee==null) {
            return "index";
        }
        Salary salary = salaryService.getSalarysByE_idAndDate(employee.getE_id());
        List<Employee> employees = employeeService.getAllEmployee();
        List<Position> positions = positionService.getAllPosition();
        List<Department> departments = departmentService.getDepartments();
        List<Training> trainings = trainingService.getUnpublishTraining();
        List<Training> trainingP = trainingService.getTrainingPublished();
        List<Training> trainingF = trainingService.getTrainingFinished();
        List<Training> trainingEmp = trainingService.getTrainingPublishedByE_id(employee.getE_id());
        Reward reward = new Reward();
        reward.setE_id(employee.getE_id());
        //通过时间和ID获得上个月的奖惩情况
        List<Reward> rewards = rewardService.getRewardsByDAndId(employee.getE_id());
        session.setAttribute("position",positions);
        session.setAttribute("department",departments);
        session.setAttribute("employee",employee);
        session.setAttribute("salaryEmp",salary);
        session.setAttribute("employees",employees);
        session.setAttribute("u_trainings",trainings);
        session.setAttribute("p_trainings",trainingP);
        session.setAttribute("f_trainings",trainingF);
        session.setAttribute("rewards",rewards);
        session.setAttribute("trainingEmp",trainingEmp);

        if(employee.getE_type()==1){
            List<Cv> cvs = cvService.getAllCvs();
            List<Fifs> fifs = fifsService.getFifsAll();
            List<Recruit> recruits = recruitService.getUnpublishedRecruits();
            session.setAttribute("cv",cvs);
            session.setAttribute("fifs",fifs);
            session.setAttribute("u_recruits",recruits);
            return "admin";
        }
        return "employee";
    }

    //打卡系统
    @RequestMapping("checkTime")
    public String checkTime(HttpSession session){
        Date date = new Date(System.currentTimeMillis());
        Employee employee = (Employee) session.getAttribute("employee");
        Attendance attendance = attendanceService.getAttendanceByDateAndEmployee(employee.getE_id());
        //打卡记录为空说明还未打卡（包括系统检测）
        if(attendance==null){
            if(attendanceService.addAttendance(employee.getE_id())){
                System.out.println("早班打卡成功");
            }
        }else{
            //说明早班卡未打
            if(attendance.getAtd_start_time()==null){
                if(attendanceService.updateAttendanceA(attendance)){
                    System.out.println("迟到了");
                }
            }
            //检查晚班卡
            else if(attendance.getAtd_end_time()==null){
                if(attendanceService.updateAttendanceP(attendance)){
                    System.out.println("晚班打卡成功");
                    Attendance fin_attendance = attendanceService.getAttendanceByDateAndEmployee(employee.getE_id());
                }
            }
        }

        return "employee";
    }

    //员工薪资复议申请
    @RequestMapping("troubleApply")
    public String troubleApply(HttpSession session){
        Salary salary = (Salary) session.getAttribute("salaryEmp");
        if(salary!=null){
            salary.setS_is_trouble(1);//1代表有问题
            if(salaryService.updateSalary(salary)){
                session.setAttribute("salaryEmp",salary);
            }
        }
        return "employee";
    }
}
