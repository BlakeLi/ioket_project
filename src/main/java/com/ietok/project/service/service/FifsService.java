package com.ietok.project.service.service;

import com.ietok.project.entity.Fifs;

import java.util.List;

public interface FifsService {
    boolean addFifs(Fifs fifs);
    boolean updateFifs(Fifs fifs);
    boolean delFifs(Fifs fifs);

    Fifs getFifsByID(Integer f_id);
    List<Fifs> getFifsByC_id(Integer c_id);
    List<Fifs> getFifsAll();
}
