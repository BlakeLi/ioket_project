package com.ietok.project.service.implz;

import com.ietok.project.dao.TrainingDao;
import com.ietok.project.entity.Training;
import com.ietok.project.service.service.TrainingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
}
