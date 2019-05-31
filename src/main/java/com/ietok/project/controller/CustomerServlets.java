package com.ietok.project.controller;

import com.ietok.project.entity.*;
import com.ietok.project.service.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
/**
* 这个controller主要包括游客的所有主要功能，和游客相关的展示信息的查询功能
**/
@Controller
public class CustomerServlets {

    @Resource
    private CustomerService customerService;
    @Resource
    private RecruitService recruitService;
    @Resource
    private CvService cvService;
    @Resource
    private FifsService fifsService;
    @Resource
    private PositionService positionService;


    //欢迎界面
    @RequestMapping("/")
    public String controller(HttpSession session){
        List<Recruit> recruits = recruitService.getPublishedRecruits();
        session.setAttribute("p_recruits",recruits);

        return "index";
    }

    //游客注册控制器
    @RequestMapping("registerCustomer")
    public String registerCustomer(String name,String pass){
        if(customerService.addCustomer(name,pass)){
            return "index";
        }
        return "index";
    }

    //游客登陆控制器
    @RequestMapping("loginCustomer")
//    @RequestParam(required = true,defaultValue = "admin")
    public String loginCustomer(String name, String pass, HttpSession session){
        Customer customer = customerService.getCustomer(name,pass);
        if(customer!=null&&customer.getC_id()!=null){
            List<Cv> cvs = cvService.getCvs(customer.getC_id());
            List<Fifs> fifsByC_id = fifsService.getFifsByC_id(customer.getC_id());
            List<Position> positions = positionService.getAllPosition();
            List<Recruit> recruits = recruitService.getPublishedRecruits();
            List<Fifs> acceptF = new ArrayList<>();
            List<Fifs> agreeF = new ArrayList<>();
            for (Fifs fifs : fifsByC_id) {
                if(fifs.getF_is_accept()==0){
                    acceptF.add(fifs);
                }else if(fifs.getF_is_agree()==0){
                    agreeF.add(fifs);
                }
            }
            session.setAttribute("position",positions);
            session.setAttribute("customer",customer);
            session.setAttribute("acceptF",acceptF);
            session.setAttribute("agreeF",agreeF);
            session.setAttribute("p_recruits",recruits);
            session.setAttribute("cvs",cvs);
            return "customer";
        }
        return "index";
    }

    //公布招聘信息获得控制器
    @RequestMapping("recruitPublished")
    public String recruitPublished(HttpSession session){
        List<Recruit> recruits = recruitService.getPublishedRecruits();
        session.setAttribute("p_recruits",recruits);
        return "index";
    }

    //简历添加控制器
    @RequestMapping("addCv")
    public String addCv(@Validated Cv cv, HttpSession session){
        Customer c_id = (Customer) session.getAttribute("customer");
        cv.setC_id(c_id.getC_id());
        if(cvService.addCv(cv)){
            Customer customer = (Customer) session.getAttribute("customer");
            List<Cv> cvs = cvService.getCvs(customer.getC_id());
            session.setAttribute("cvs",cvs);
        }
        return "customer";
    }

    //获得简历控制器
    @RequestMapping("getCv")
    @ResponseBody
    public Cv getCv(String cv_id){
        return cvService.getCv(Integer.parseInt(cv_id));
    }

    //简历删除控制器
    @RequestMapping("delCv")
    public String delCv(String cv_id,HttpSession session){
        if(cvService.delCv(Integer.parseInt(cv_id))){
            Customer customer = (Customer) session.getAttribute("customer");
            List<Cv> cvs = cvService.getCvs(customer.getC_id());
            session.setAttribute("cvs",cvs);
        }
        return "customer";
    }

    //简历修改控制器
    @RequestMapping("updateCv")
    public String updateCv(Cv cv,HttpSession session){
        Customer customer = (Customer) session.getAttribute("customer");
        cv.setC_id(customer.getC_id());
        if(cvService.update(cv)){
            List<Cv> cvs = cvService.getCvs(customer.getC_id());
            session.setAttribute("cvs",cvs);
        }
        return "customer";
    }

    //申请面试
    @RequestMapping("addFifs")
    public String addFifs(Fifs fifs,HttpSession session){
        Cv cv = cvService.getCv(fifs.getCv_id());
        Customer customer = (Customer) session.getAttribute("customer");
        List<Fifs> acceptF = new ArrayList<>();
        List<Fifs> agreeF = new ArrayList<>();
        if(cv == null){
            return "customer";
        }
        if(fifsService.addFifs(fifs)){
            List<Fifs> fifsByC_id = fifsService.getFifsByC_id(customer.getC_id());
            for (Fifs fifss : fifsByC_id) {
                if(fifss.getF_is_accept()==0){
                    acceptF.add(fifss);
                }else if(fifss.getF_is_agree()==0){
                    agreeF.add(fifss);
                }
            }
            session.setAttribute("acceptF",acceptF);
            session.setAttribute("agreeF",agreeF);
        }
        return "customer";
    }

    //同意面试申请
    @RequestMapping("agreeFifs")
    public String updateFifs(Fifs fifs, String agree,HttpSession session){
        Customer customer = (Customer) session.getAttribute("customer");
        List<Fifs> acceptF = new ArrayList<>();
        List<Fifs> agreeF = new ArrayList<>();
        if(fifs!=null&&fifs.getF_id()!=null&&agree!=null){
            Fifs ffs = fifsService.getFifsByID(fifs.getF_id());
            if(Integer.parseInt(agree)==0){
                if(fifsService.delFifs(fifs)){
                    System.out.println("已经删除拒绝的面试申请");
                    List<Fifs> fifsByC_id = fifsService.getFifsByC_id(customer.getC_id());
                    for (Fifs fifss : fifsByC_id) {
                        if(fifss.getF_is_accept()==0){
                            acceptF.add(fifss);
                        }else if(fifss.getF_is_agree()==0){
                            agreeF.add(fifss);
                        }
                    }
                    session.setAttribute("acceptF",acceptF);
                    session.setAttribute("agreeF",agreeF);
                    return "customer";
                }
            }
            ffs.setF_is_agree(1);
            if(fifsService.updateFifs(ffs)){
                List<Fifs> fifsByC_id = fifsService.getFifsByC_id(customer.getC_id());
                for (Fifs fifss : fifsByC_id) {
                    if(fifss.getF_is_accept()==0){
                        acceptF.add(fifss);
                    }else if(fifss.getF_is_agree()==0){
                        agreeF.add(fifss);
                    }
                }
                session.setAttribute("acceptF",acceptF);
                session.setAttribute("agreeF",agreeF);
            }
        }
        return "customer";
    }

    //取消面试申请
    @RequestMapping("delFifs")
    public String delFifs(Fifs fifs,HttpSession session){
        Customer customer = (Customer) session.getAttribute("customer");
        List<Fifs> acceptF = new ArrayList<>();
        List<Fifs> agreeF = new ArrayList<>();
        if(fifsService.delFifs(fifs)){
            List<Fifs> fifsByC_id = fifsService.getFifsByC_id(customer.getC_id());
            for (Fifs fifss : fifsByC_id) {
                if(fifss.getF_is_accept()==0){
                    acceptF.add(fifss);
                }else if(fifss.getF_is_agree()==0){
                    agreeF.add(fifss);
                }
            }
            session.setAttribute("acceptF",acceptF);
            session.setAttribute("agreeF",agreeF);
        }
        return "customer";
    }
}
