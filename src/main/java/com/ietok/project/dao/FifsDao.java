package com.ietok.project.dao;

import com.ietok.project.entity.Fifs;

import java.util.List;

public interface FifsDao {
    boolean addFifs(Fifs fifs);
    boolean updateFifs(Fifs fifs);
    boolean delFifs(Fifs fifs);

    Fifs getFifs(Fifs fifs);
    List<Fifs> getFifssByCv_id(Fifs fifs);
    List<Fifs> getFifssByRCT_id(Fifs fifs);
}
