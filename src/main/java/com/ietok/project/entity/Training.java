package com.ietok.project.entity;

import java.io.Serializable;
import java.sql.Date;

public class Training implements Serializable {
    private Integer t_id;
    private String t_title;
    private Integer e_id;
    private Date t_start_time;
    private Date t_end_time;
    private String t_address;
    private Integer t_is_publish;

    public Integer getT_id() {
        return t_id;
    }

    public void setT_id(Integer t_id) {
        this.t_id = t_id;
    }

    public String getT_title() {
        return t_title;
    }

    public void setT_title(String t_title) {
        this.t_title = t_title;
    }

    public Integer getE_id() {
        return e_id;
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    public Date getT_start_time() {
        return t_start_time;
    }

    public void setT_start_time(Date t_start_time) {
        this.t_start_time = t_start_time;
    }

    public Date getT_end_time() {
        return t_end_time;
    }

    public void setT_end_time(Date t_end_time) {
        this.t_end_time = t_end_time;
    }

    public String getT_address() {
        return t_address;
    }

    public void setT_address(String t_address) {
        this.t_address = t_address;
    }

    public Integer getT_is_publish() {
        return t_is_publish;
    }

    public void setT_is_publish(Integer t_is_publish) {
        this.t_is_publish = t_is_publish;
    }

    @Override
    public String toString() {
        return "Training{" +
                "t_id=" + t_id +
                ", t_title='" + t_title + '\'' +
                ", e_id=" + e_id +
                ", t_start_time=" + t_start_time +
                ", t_end_time=" + t_end_time +
                ", t_address='" + t_address + '\'' +
                ", t_is_publish=" + t_is_publish +
                '}';
    }
}
