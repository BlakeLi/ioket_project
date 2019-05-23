package com.ietok.project.controller;

import com.ietok.project.entity.Training;
import com.ietok.project.entity.Training_p;
import com.ietok.project.entity.Training_p_choose;
import com.ietok.project.service.service.TrainingPService;
import com.ietok.project.service.service.TrainingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class TrainingServlets {
    @Resource
    private TrainingService trainingService;
    @Resource
    private TrainingPService trainingPService;

    //删除未发布的培训信息
    @RequestMapping("delTraining")
    public String delTraining(Training training, HttpSession session){
        if(trainingService.delT(training)){
            List<Training> trainings = trainingService.getUnpublishTraining();
            session.setAttribute("u_trainings",trainings);
        }
        return "admin";
    }

    //新增未发布的培训信息
    @RequestMapping("addTraining")
    public String addTraining(Training training,HttpSession session){
        if(trainingService.addT(training)){
            List<Training> trainings = trainingService.getUnpublishTraining();
            session.setAttribute("u_trainings",trainings);
        }
        return "admin";
    }

    //修改未发布的培训信息
    @RequestMapping("updateTraining")
    public String updateTraining(Training training,HttpSession session){
        if(trainingService.updateT(training)){
            List<Training> trainings = trainingService.getUnpublishTraining();
            session.setAttribute("u_trainings",trainings);
        }
        return "admin";
    }

    //修改发布状态
    @RequestMapping("updatePublishT")
    public String updatePublishT(Training_p_choose training_p_choose, HttpSession session){
        if(training_p_choose.getE_ids().length==0){
            return "admin";
        }
        List<Training_p> training_ps = new ArrayList<>();
        List<Integer> e_ids = new ArrayList<Integer>(Arrays.asList(training_p_choose.getE_ids()));

        for (Integer e_id : e_ids) {
            Training_p training_p = new Training_p();
            training_p.setE_id(e_id);
            training_p.setT_id(training_p_choose.getT_id());
            training_ps.add(training_p);
        }

        for (Training_p training_p : training_ps) {
            if(!trainingPService.addTraining(training_p)){
                System.out.println("失败了");
            }
        }

        Training tr = new Training();
        tr.setT_id(training_p_choose.getT_id());
        Training training = trainingService.getTraining(tr);
        if(trainingService.updatePublishT(training)){
            List<Training> trainings = trainingService.getUnpublishTraining();
            List<Training> trainingP = trainingService.getTrainingPublished();
            session.setAttribute("u_trainings",trainings);
            session.setAttribute("p_trainings",trainingP);
        }
        return "admin";
    }

    //查询指定培训信息
    @RequestMapping("findTra")
    @ResponseBody
    public Training findTra(Training training){
        return trainingService.getTraining(training);
    }
}
