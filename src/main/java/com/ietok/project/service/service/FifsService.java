package com.ietok.project.service.service;

import com.ietok.project.entity.Fifs;

import java.util.List;

public interface FifsService {
    boolean addFifs(Fifs fifs);
    boolean updateFifs(Fifs fifs);
    Fifs getFifs(Integer cv_id);
    List<Fifs> getFifss(Integer F_is_read);
}
