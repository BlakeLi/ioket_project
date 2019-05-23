package com.ietok.project.controller;

import com.ietok.project.entity.*;
import com.ietok.project.service.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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


    //员工和管理员登陆
    @RequestMapping("loginEmployee")
    public String loginEmployee(String name, String pass, HttpSession session){
        Employee employee = employeeService.getEmployeeByNameAndPass(name,pass);
        List<Employee> employees = employeeService.getAllEmployee();
        List<Position> positions = positionService.getAllPosition();
        List<Department> departments = departmentService.getDepartments();
        List<Training> trainings = trainingService.getUnpublishTraining();
        List<Training> trainingP = trainingService.getTrainingPublished();
        List<Training> trainingF = trainingService.getTrainingFinished();
        session.setAttribute("position",positions);
        session.setAttribute("department",departments);
        session.setAttribute("employee",employee);
        session.setAttribute("employees",employees);
        session.setAttribute("u_trainings",trainings);
        session.setAttribute("p_trainings",trainingP);
        session.setAttribute("f_trainings",trainingF);

        if(employee==null){
            return "index";
        }else if(employee.getE_type()==1){
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
}
