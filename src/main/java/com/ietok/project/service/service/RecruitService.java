package com.ietok.project.service.service;

import com.ietok.project.entity.Recruit;

import java.util.List;

public interface RecruitService {
    boolean addRecruit(Recruit recruit);
    boolean updateRecruit(Recruit recruit);
    boolean deleteRecruit(Recruit recruit);

    Recruit getRecruitByID(Recruit recruit);
    List<Recruit> getPublishedRecruits();
}
