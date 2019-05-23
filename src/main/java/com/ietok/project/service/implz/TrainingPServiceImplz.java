package com.ietok.project.service.implz;

import com.ietok.project.dao.TrainingPDao;
import com.ietok.project.entity.Training_p;
import com.ietok.project.service.service.TrainingPService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("trainingPService")
public class TrainingPServiceImplz implements TrainingPService {
    @Resource
    private TrainingPDao trainingPDao;

    @Override
    public boolean addTraining(Training_p training_p) {
        return trainingPDao.addTraining_p(training_p);
    }
}
