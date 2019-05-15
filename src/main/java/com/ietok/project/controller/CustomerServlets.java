package com.ietok.project.controller;

import com.ietok.project.entity.Recruit;
import com.ietok.project.service.service.CustomerService;
import com.ietok.project.service.service.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CustomerServlets {

    @Resource
    private CustomerService customerService;
    @Resource
    private RecruitService recruitService;

    @RequestMapping("registerCustomer")
    public String registerCustomer(String name,String pass){
        if(customerService.addCustomer(name,pass)){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    @RequestMapping("loginCustomer")
    public String loginCustomer(String name,String pass){
        if(customerService.getCustomer(name,pass)!=null){
            return "WEB-INF/test/success";
        }
        return "WEB-INF/test/fail";
    }

    @RequestMapping("recruitPublished")
    public String recruitPublished(HttpSession session){
        List<Recruit> recruits = recruitService.getPublishedRecruits();
        System.out.println(recruits);
        session.setAttribute("p_recruits",recruits);
        return "index";
    }
}
