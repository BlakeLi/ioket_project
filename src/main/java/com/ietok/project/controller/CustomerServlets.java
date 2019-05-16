package com.ietok.project.controller;

import com.ietok.project.entity.Cv;
import com.ietok.project.entity.Fifs;
import com.ietok.project.entity.Recruit;
import com.ietok.project.service.service.CustomerService;
import com.ietok.project.service.service.CvService;
import com.ietok.project.service.service.FifsService;
import com.ietok.project.service.service.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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

    //游客注册控制器
    @RequestMapping("registerCustomer")
    public String registerCustomer(String name,String pass){
        if(customerService.addCustomer(name,pass)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    //游客登陆控制器
    @RequestMapping("loginCustomer")
    public String loginCustomer(String name,String pass){
        if(customerService.getCustomer(name,pass)!=null){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
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
    public String addCv(Cv cv){
        if(cvService.addCv(cv)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    //简历展示控制器（游客ID查询）
    @RequestMapping("getCvs")
    public String getCvs(HttpSession session){
        List<Cv> cvs = cvService.getCvs(1);
        session.setAttribute("cvs",cvs);
        return "index";
    }

    //简历选择控制器
    @RequestMapping("getCv")
    public String getCv(HttpSession session){
        Cv cv = cvService.getCv(1);
        session.setAttribute("cv",cv);
        return "index";
    }

    //简历修改控制器
    @RequestMapping("updateCv")
    public String getCv(Cv cv){
        if(cvService.update(cv)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    //申请面试
    @RequestMapping("addFifs")
    public String addFifs(Fifs fifs){
        if(fifsService.addFifs(fifs)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }
}
