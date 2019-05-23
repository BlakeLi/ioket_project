package com.ietok.project.service.service;

import com.ietok.project.entity.Training;

import java.util.List;

public interface TrainingService {
    boolean delT(Training training);
    boolean addT(Training training);

    List<Training> getUnpublishTraining();

    boolean updateT(Training training);

    boolean updatePublishT(Training training);

    Training getTraining(Training training);
    List<Training> getTrainingPublished();
    List<Training> getTrainingFinished();
}
