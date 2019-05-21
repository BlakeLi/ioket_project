package com.ietok.project.controller;

import com.ietok.project.entity.*;
import com.ietok.project.service.service.*;
import com.ietok.project.util.Method_name;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@Controller
public class AdminServlets {
    @Resource
    private DepartmentService departmentService;
    @Resource
    private PositionService positionService;
    @Resource
    private RecruitService recruitService;
    @Resource
    private EmployeeService employeeService;
    @Resource
    private FifsService fifsService;
    @Resource
    private SalaryService salaryService;
    @Resource
    private RewardService rewardService;

    //修改-薪资-复议状态
    //入参需求S_ID
    @RequestMapping("updateSalary")
    public String updateSalary(Salary salary){
        if(salaryService.updateSalary(salary)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    //薪资结算
    @RequestMapping("addSalary")
    public String addSalary(String e_id){
        if(e_id!=null){
            Date date = new Date(System.currentTimeMillis());
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            if(cal.get(Calendar.DATE)>=5){
                Salary salary = new Salary();
                salary.setS_date(date);
                salary.setE_id(Integer.parseInt(e_id));
                List<Salary> salaries = salaryService.getSalarysByDateAndE_id(salary);
                if(salaries.size()==0){
                    if(salaryService.addSalary(salary)){
                        return "WEB-INF/test/success";
                    }
                }
            }
        }
        return "WEB-INF/test/fail";
    }

    //奖罚记录生成
    //入参需求r_reason，r_money
    @RequestMapping("addReward")
    public String addReward(Reward reward){
        if(rewardService.addReward(reward)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    //奖罚记录修改
    @RequestMapping("updateReward")
    public String updateReward(Reward reward){
        if(rewardService.updateReward(reward)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }


    //录用
    @RequestMapping("enroll")
    public String enrollEmployee(String e_phone, String e_debit, String f_id,HttpSession session){
        if(f_id==null){
            return "admin";
        }
        Fifs fifs = fifsService.getFifsByID(Integer.parseInt(f_id));
        Employee employee = new Employee();
        employee.setE_debit(Long.parseLong(e_debit));
        employee.setE_phone(Long.parseLong(e_phone));
        if(employeeService.addEmployee(employee,fifs.getCv_id(),fifs.getRct_id())){
            if(fifsService.delFifs(fifs)){
                List<Employee> employees = employeeService.getAllEmployee();
                session.setAttribute("employees",employees);
            }
        }
        return "admin";
    }


    //修改面试信息
    //注意需要修改时间
    @RequestMapping("acceptFifs")
    public String updateFifs(String f_id,String f_date,HttpSession session) throws ParseException {
        Fifs fs = fifsService.getFifsByID(Integer.parseInt(f_id));
        fs.setF_is_accept(1);
        System.out.println(f_date);
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
        java.util.Date utilD= format.parse(f_date);
        System.out.println(utilD);
        fs.setF_date(utilD);
        if(fifsService.updateFifs(fs)){
            List<Fifs> fifs = fifsService.getFifsAll();
            session.setAttribute("fifs",fifs);
        }
        return "admin";
    }


    //读取指定的面试申请，并且标记为已读
    @RequestMapping("chooseFifs")
    public String getFifs(Fifs fifs,HttpSession session){
        if(fifs!=null&&fifs.getF_id()!=null){
            Fifs ffs = fifsService.getFifsByID(fifs.getF_id());
            ffs.setF_is_read(1);
            if(fifsService.updateFifs(ffs)){
                System.out.println("已读");
            }
            session.setAttribute("ffs",ffs);
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    //生成新的招聘信息
    @RequestMapping("addRct")
    public String addRct(Recruit recruit,HttpSession session){
        if(recruitService.addRecruit(recruit)){
            List<Recruit> u_recruits = recruitService.getUnpublishedRecruits();
            List<Recruit> p_recruits = recruitService.getPublishedRecruits();
            session.setAttribute("p_recruits",p_recruits);
            session.setAttribute("u_recruits",u_recruits);
        }
        return "admin";
    }

    //修改招聘状态，如果招聘状态是草稿就改为可以修改
    @RequestMapping("updateRct")
    public String updateRct(Recruit recruit,HttpSession session){
        if (recruitService.updateRecruit(recruit)) {
            List<Recruit> u_recruits = recruitService.getUnpublishedRecruits();
            List<Recruit> p_recruits = recruitService.getPublishedRecruits();
            session.setAttribute("p_recruits", p_recruits);
            session.setAttribute("u_recruits", u_recruits);
        }
        return "admin";
    }

    //删除招聘信息
    @RequestMapping("delRct")
    public String delRct(Recruit recruit,HttpSession session){
        if(recruitService.deleteRecruit(recruit)){
            List<Recruit> u_recruits = recruitService.getUnpublishedRecruits();
            List<Recruit> p_recruits = recruitService.getPublishedRecruits();
            session.setAttribute("p_recruits", p_recruits);
            session.setAttribute("u_recruits", u_recruits);
        }
        return "admin";
    }

    //发布招聘信息
    @RequestMapping("publishRecruit")
    public String publishRecruit(Recruit recruit,HttpSession session){
        if(recruitService.publishRecruit(recruit)){
            List<Recruit> u_recruits = recruitService.getUnpublishedRecruits();
            List<Recruit> p_recruits = recruitService.getPublishedRecruits();
            session.setAttribute("p_recruits", p_recruits);
            session.setAttribute("u_recruits", u_recruits);
        }
        return "admin";
    }


    //通过ID查找招聘信息
    @RequestMapping("findRct")
    @ResponseBody
    public Recruit findRct(Recruit recruit){
        return recruitService.getRecruitByID(recruit);
    }

    //增删改department
    @RequestMapping("changeDep")
    public String changeDep(Department department,String method){
        if (Method_name.DELETE.equals(method)) {
            if(departmentService.delDep(department)){
                return "WEB-INF/test/success";
            }
        }else if(Method_name.INSERT.equals(method)){
            if(departmentService.addDep(department)){
                return "WEB-INF/test/success";
            }
        }else if(Method_name.UPDATE.equals(method)){
            if(departmentService.updateDep(department)){
                return "WEB-INF/test/success";
            }
        }
        return "WEB-INF/test/fail";
    }

    //增删改position
    @RequestMapping("changePos")
    public String changePos(String method, Position position){
        if (Method_name.DELETE.equals(method)) {
            if(position.getDep_id()!=null){
                if(positionService.delPositionByDep(position.getDep_id())){
                    return "WEB-INF/test/success";
                }
            }else if(position.getPos_id()!=null){
                if(positionService.delPosition(position.getPos_id())){
                    return "WEB-INF/test/success";
                }
            }
        }else if(Method_name.INSERT.equals(method)){
            if(positionService.addPosition(position)){
                return "WEB-INF/test/success";
            }
        }else if(Method_name.UPDATE.equals(method)){
            if(positionService.updatePosition(position)){
                return "WEB-INF/test/success";
            }
        }
        return "WEB-INF/test/fail";
    }

    //查询department返回Json List
    @RequestMapping("findDep")
    @ResponseBody
    public List<Department> findDep(){
        return departmentService.getDepartments();
    }

    //查询position返回Json List
    @RequestMapping("findPos")
    @ResponseBody
    public List<Position> findPos(Position position){
        return positionService.getPositionByDep(position);
    }
}
