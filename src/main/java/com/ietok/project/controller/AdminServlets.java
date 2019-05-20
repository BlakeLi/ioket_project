package com.ietok.project.controller;

import com.ietok.project.entity.*;
import com.ietok.project.service.service.*;
import com.ietok.project.util.Method_name;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Date;
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
    public String enrollEmployee(Employee employee, String f_id){
        if(f_id==null){
            return "WEB-INF/test/fail";
        }
        Fifs fifs = fifsService.getFifsByID(Integer.parseInt(f_id));
        if(employeeService.addEmployee(employee,fifs.getCv_id(),fifs.getRct_id())){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    //修改面试信息
    //注意需要修改时间
    @RequestMapping("acceptFifs")
    public String updateFifs(Fifs fifs){
        fifs.setF_is_accept(1);
        if(fifsService.updateFifs(fifs)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
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
    //在招聘信息是草稿的情况下修改招聘信息，否则撤销已经发布的招聘信息
    //删除招聘信息，在发布的情况下不可删除
    @RequestMapping("changeRct")
    public  String changeRct(Recruit recruit,String method){
        if(Method_name.INSERT.equals(method)){
            if(recruitService.addRecruit(recruit)){
                return "WEB-INF/test/success";
            }
        }else if(Method_name.UPDATE.equals(method)){
            if(recruitService.updateRecruit(recruit)){
                return "WEB-INF/test/success";
            }
        }else if(Method_name.DELETE.equals(method)){
            if(recruitService.deleteRecruit(recruit)){
                return "WEB-INF/test/success";
            }
        }
        return "WEB-INF/test/fail";
    }

    //通过ID查找招聘信息
    @RequestMapping("findRct")
    public String findRct(Recruit recruit, String method,HttpSession session){
        if(Method_name.SELECT_BY_RCT_ID.equals(method)){
            Recruit rct = recruitService.getRecruitByID(recruit);
            if(rct!=null){
                session.setAttribute("rct",rct);
                return "WEB-INF/test/success";
            }
        }
        return "WEB-INF/test/fail";
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

    //查询department
    @RequestMapping("findDep")
    public String findDep(Department department, HttpSession session){
        if(department!=null){
            List<Department> departments = departmentService.getDepartments();
            if(departments.size()!=0){
                session.setAttribute("departments",departments);
                return "WEB-INF/test/success";
            }
        }
        return "WEB-INF/test/fail";
    }

    //查询position
    @RequestMapping("findPos")
    public String findPos(Position position,String method,HttpSession session){
        if(Method_name.SELECT_BY_DEP_ID.equals(method)){
            if(position!=null&&position.getDep_id()!=null){
                List<Position> positions = positionService.getPositionByDep(position);
                if(positions.size()!=0){
                    session.setAttribute("positionsByDep",positions);
                    return "WEB-INF/test/success";
                }
            }
        }else if(Method_name.SELECT_BY_ID.equals(method)){
            if(position!=null&&position.getPos_id()!=null){
                Position pos = positionService.getPositionByID(position);
                if(pos.getPos_name()!=null){
                    session.setAttribute("positionByID",pos);
                    return "WEB-INF/test/success";
                }
            }
        }
        return "WEB-INF/test/fail";
    }
}
