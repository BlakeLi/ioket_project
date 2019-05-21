package com.ietok.project.dao;

import com.ietok.project.entity.Recruit;

import java.util.List;

public interface RecruitDao {
    boolean addRecruit(Recruit recruit);
    boolean updateRecruit(Recruit recruit);
    boolean deleteRecruit(Recruit recruit);
    Recruit getRecruitByID(Recruit recruit);
    List<Recruit> getPublishedRecruit();
    List<Recruit> getUnpublishedRecruit();
}
