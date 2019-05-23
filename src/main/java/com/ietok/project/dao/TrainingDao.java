package com.ietok.project.dao;

import com.ietok.project.entity.Training;

import java.util.List;

public interface TrainingDao {
    boolean delT(Training training);
    boolean addT(Training training);

    List<Training> getUnpublishTraining();


    boolean updateTraining(Training training);

    boolean updatePublishT(Training training);

    Training getTraining(Training training);
}
