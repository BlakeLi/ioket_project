package com.ietok.project.service.service;

import com.ietok.project.entity.Cv;

import java.util.List;

public interface CvService {
    boolean addCv(Cv cv);
    boolean delCv(Integer cv_id);
    boolean update(Cv cv);

    Cv getCv(Integer cv_id);
    List<Cv> getCvs(Integer c_id);
}
