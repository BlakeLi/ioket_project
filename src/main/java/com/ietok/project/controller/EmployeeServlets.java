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

    //员工和管理员登陆
    @RequestMapping("loginEmployee")
    public String loginEmployee(String name, String pass, HttpSession session){
        Employee employee = employeeService.getEmployeeByNameAndPass(name,pass);
        List<Recruit> recruits = recruitService.getUnpublishedRecruits();
        List<Position> positions = positionService.getAllPosition();
        List<Fifs> fifs = fifsService.getFifsAll();
        List<Cv> cvs = cvService.getAllCvs();
        session.setAttribute("fifs",fifs);
        session.setAttribute("cv",cvs);
        session.setAttribute("position",positions);
        session.setAttribute("u_recruits",recruits);
        if(employee==null){
            return "index";
        }else if(employee.getE_type()==1){
            session.setAttribute("employee",employee);
            return "admin";
        }
        session.setAttribute("employee",employee);
        return "employee";
    }
}
