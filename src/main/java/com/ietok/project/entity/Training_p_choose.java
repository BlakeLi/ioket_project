package com.ietok.project.entity;

import java.io.Serializable;
import java.util.List;

public class Training_p_choose implements Serializable {
    private Integer tp_id;
    private Integer[] e_ids;
    private Integer t_id;

    public Integer getTp_id() {
        return tp_id;
    }

    public void setTp_id(Integer tp_id) {
        this.tp_id = tp_id;
    }

    public Integer[] getE_ids() {
        return e_ids;
    }

    public void setE_ids(Integer[] e_ids) {
        this.e_ids = e_ids;
    }

    public Integer getT_id() {
        return t_id;
    }

    public void setT_id(Integer t_id) {
        this.t_id = t_id;
    }

    @Override
    public String toString() {
        return "Training_p_choose{" +
                "tp_id=" + tp_id +
                ", e_ids=" + e_ids +
                ", t_id=" + t_id +
                '}';
    }
}
