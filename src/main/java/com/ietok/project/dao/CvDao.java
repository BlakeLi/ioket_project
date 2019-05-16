package com.ietok.project.dao;

import com.ietok.project.entity.Cv;

import java.util.List;

public interface CvDao {
    boolean addCv(Cv cv);
    boolean delCv(Cv cv);
    boolean updateCv(Cv cv);

    Cv getCv(Cv cv);
    List<Cv> getCvs(Cv cv);
}
