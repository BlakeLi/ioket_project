package com.ietok.project.dao;

import com.ietok.project.entity.Fifs;

import java.util.List;

public interface FifsDao {
    boolean addFifs(Fifs fifs);
    boolean updateFifs(Fifs fifs);
    Fifs getFifs(Fifs fifs);
    List<Fifs> getFifss(Fifs fifs);
}
