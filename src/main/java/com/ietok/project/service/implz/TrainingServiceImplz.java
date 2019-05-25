package com.ietok.project.service.implz;

import com.ietok.project.dao.TrainingDao;
import com.ietok.project.entity.Employee;
import com.ietok.project.entity.Training;
import com.ietok.project.entity.Training_p;
import com.ietok.project.service.service.TrainingService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

@Service("trainingService")
public class TrainingServiceImplz implements TrainingService {
    @Resource
    private TrainingDao trainingDao;

    @Override
    public boolean delT(Training training) {
        return trainingDao.delT(training);
    }

    @Override
    public boolean addT(Training training) {
        return trainingDao.addT(training);
    }

    @Override
    public List<Training> getUnpublishTraining() {
        return trainingDao.getUnpublishTraining();
    }

    @Override
    public boolean updateT(Training training) {
        return trainingDao.updateTraining(training);
    }

    @Override
    public boolean updatePublishT(Training training) {
        return trainingDao.updatePublishT(training);
    }

    @Override
    public Training getTraining(Training training) {
        return trainingDao.getTraining(training);
    }

    @Override
    public List<Training> getTrainingPublished() {
        return trainingDao.getTrainingPublished();
    }

    @Override
    public List<Training> getTrainingFinished() {
        return trainingDao.getTrainingFinish();
    }

    @Override
    public List<Training> getTrainingPublishedByE_id(Integer e_id) {
        return Optional.ofNullable(e_id).map(e -> {
//            Training_p training_p = new Training_p();
//            training_p.setE_id(e);
//            BeanUtils.copyProperties();
//            return trainingDao.getTrainingPublishedByE_id(training_p);
            return trainingDao.getTrainingPublishedByE_id(new Training_p.Builder().e_id(e).build());
        }).orElse(null);
    }
}
