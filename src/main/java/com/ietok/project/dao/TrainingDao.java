package com.ietok.project.dao;

import com.ietok.project.entity.Training;
import com.ietok.project.entity.Training_p;

import java.util.List;

public interface TrainingDao {
    boolean delT(Training training);
    boolean addT(Training training);

    List<Training> getUnpublishTraining();


    boolean updateTraining(Training training);

    boolean updatePublishT(Training training);

    Training getTraining(Training training);

    List<Training> getTrainingPublished();

    List<Training> getTrainingFinish();

    List<Training> getTrainingPublishedByE_id(Training_p training_p);
}
