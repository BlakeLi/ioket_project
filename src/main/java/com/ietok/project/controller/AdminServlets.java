package com.ietok.project.controller;

import com.ietok.project.entity.*;
import com.ietok.project.service.service.*;
import com.ietok.project.util.Method_name;
import javafx.geometry.Pos;
import org.omg.PortableInterceptor.INACTIVE;
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
    @Resource
    private CvService cvService;

    //查询不在部门里面的员工
    @RequestMapping("findEmpNotInDep")
    @ResponseBody
    public List<Employee> findEmpNotInDep(Department department){
        return employeeService.getEmpNotInDep(department);
    }

    //查询部门员工
    @RequestMapping("findEmpByDep")
    @ResponseBody
    public List<Employee> findEmpByDep(Department department){
        return employeeService.getEmpByDep(department);
    }

    //查询员工ID不在POS_ID里面的
    @RequestMapping("findEmpNotInPos")
    @ResponseBody
    public List<Employee> findEmpNotInPos(Employee employee){
        return employeeService.getEmpNotInPos(employee);
    }

    //查询员工通过POS_ID
    @RequestMapping("findEmpByPos")
    @ResponseBody
    public List<Employee> findEmpByPos(Employee employee){
        return employeeService.getEmployeesByPosID(employee.getPos_id());
    }

    //查询Rewards通过E_id
    @RequestMapping("findRewByEmp")
    @ResponseBody
    public List<Reward> findRewardByEmp(Reward reward){
        return rewardService.getRewardsByE_id(reward);
    }

    //修改员工的岗位
    @RequestMapping("updateEmpPos")
    public String updateEmpPos(Employee employee,HttpSession session){
        Employee emp = employeeService.getEmployee(employee.getE_id());
        emp.setPos_id(employee.getPos_id());
        if(employeeService.updateEmployee(emp)){
            List<Employee> employees = employeeService.getAllEmployee();
            session.setAttribute("employees",employees);
        }
        return "admin";
    }

    //修改员工的岗位
    @RequestMapping("updateEmpState")
    public String updateEmpState(Employee employee,HttpSession session){
        Employee emp = employeeService.getEmployee(employee.getE_id());
        emp.setE_state(employee.getE_state());
        if(employeeService.updateEmployee(emp)){
            List<Employee> employees = employeeService.getAllEmployee();
            session.setAttribute("employees",employees);
        }
        return "admin";
    }

    //查询指定人员的复议列表
    @RequestMapping("findTrouble")
    @ResponseBody
    public List<Salary> findTrouble(Salary salary){
        return salaryService.getSalaryByTroubleAndE_id(salary);
    }

    //修改-薪资-复议状态
    //入参需求S_ID
    @RequestMapping("updateSalary")
    public String updateSalary(Salary salary){
        if(salaryService.updateSalary(salary)){
            return "admin";
        }
        return "admin";
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
                        return "admin";
                    }
                }
            }
        }
        return "admin";
    }

    //奖罚记录生成
    //入参需求r_reason，r_money
    @RequestMapping("addReward")
    public String addReward(Reward reward){
        if(rewardService.addReward(reward)){
            return "admin";
        }
        return "admin";
    }

    //奖罚记录修改
    @RequestMapping("updateReward")
    public String updateReward(Reward reward){
        if(rewardService.updateReward(reward)){
            return "admin";
        }
        return "admin";
    }


    //录用
    @RequestMapping("enroll")
    public String enrollEmployee(String e_phone, String e_debit, String e_account, String e_pass, String f_id,HttpSession session){
        if(f_id==null){
            return "admin";
        }
        Fifs fifs = fifsService.getFifsByID(Integer.parseInt(f_id));
        Employee employee = new Employee();
        employee.setE_debit(Long.parseLong(e_debit));
        employee.setE_phone(Long.parseLong(e_phone));
        employee.setE_account(e_account);
        employee.setE_pass(e_pass);
        if(employeeService.addEmployee(employee,fifs.getCv_id(),fifs.getRct_id())){
            if(fifsService.delFifs(fifs)){
                List<Employee> employees = employeeService.getAllEmployee();
                session.setAttribute("employees",employees);
                List<Fifs> fifsList = fifsService.getFifsAll();
                session.setAttribute("fifs",fifsList);
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
    @ResponseBody
    public Cv getFifs(String cv_id ,String f_id ,HttpSession session){
        Fifs ffs = fifsService.getFifsByID(Integer.parseInt(f_id));
        ffs.setF_is_read(1);
        if(fifsService.updateFifs(ffs)){
            List<Fifs> fifsList = fifsService.getFifsAll();
            session.setAttribute("fifs",fifsList);
        }
        Cv cv = cvService.getCv(Integer.parseInt(cv_id));
        return cv;
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

    //新增部门
    @RequestMapping("addDep")
    public String addDep(Department department,HttpSession session){
        if (departmentService.getDepartmentByName(department)==null) {
            if(departmentService.addDep(department)){
                List<Department> departments = departmentService.getDepartments();
                session.setAttribute("department",departments);
            }
        }
        return "admin";
    }
    //删除部门
    @RequestMapping("delDep")
    public String delDep(Department department,HttpSession session){
        if(departmentService.delDep(department)){
            List<Department> departments = departmentService.getDepartments();
            session.setAttribute("department",departments);
        }
        return "admin";
    }

    //更新部门名称
    @RequestMapping("updateDep")
    public String updateDep(Department department,HttpSession session){
        if (departmentService.getDepartmentByName(department)==null) {
            if(departmentService.updateDep(department)){
                List<Department> departments = departmentService.getDepartments();
                session.setAttribute("department",departments);
            }
        }
        return "admin";
    }

    //删除职位
    @RequestMapping("delPos")
    public String delPos(String pos_id,HttpSession session){
        Position position = new Position();
        position.setPos_id(Integer.parseInt(pos_id));
        if(positionService.delPosition(Integer.parseInt(pos_id))){
            List<Position> positions = positionService.getAllPosition();
            session.setAttribute("position",positions);
        }
        return "admin";
    }

    //更新职位
    @RequestMapping("updatePos")
    public String updatePos(Position position,HttpSession session){
        if(positionService.getPositionByNameAndDep(position)==null){
            if(positionService.updatePosition(position)){
                List<Position> positions = positionService.getAllPosition();
                session.setAttribute("position",positions);
            }
        }
        return "admin";
    }

    //增加职位
    @RequestMapping("addPos")
    public String addPos(Position position,HttpSession session){
        if(positionService.getPositionByNameAndDep(position)==null){
            if(positionService.addPosition(position)){
                List<Position> positions =positionService.getAllPosition();
                session.setAttribute("position",positions);
            }
        }
        return "admin";
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
