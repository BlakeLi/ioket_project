package com.ietok.project.entity;

import java.io.Serializable;
import java.sql.Date;

public class Attendance implements Serializable {
    private Integer atd_id;
    private Integer e_id;
    private java.util.Date atd_start_time;
    private java.util.Date atd_end_time;
    private Integer atd_start_info;
    private Integer atd_end_info;
    private Integer atd_state;
    private Date atd_system_time;


    public Integer getAtd_id() {
        return atd_id;
    }

    public void setAtd_id(Integer atd_id) {
        this.atd_id = atd_id;
    }

    public Integer getE_id() {
        return e_id;
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    public java.util.Date getAtd_start_time() {
        return atd_start_time;
    }

    public void setAtd_start_time(java.util.Date atd_start_time) {
        this.atd_start_time = atd_start_time;
    }

    public java.util.Date getAtd_end_time() {
        return atd_end_time;
    }

    public void setAtd_end_time(java.util.Date atd_end_time) {
        this.atd_end_time = atd_end_time;
    }

    public Integer getAtd_start_info() {
        return atd_start_info;
    }

    public void setAtd_start_info(Integer atd_start_info) {
        this.atd_start_info = atd_start_info;
    }

    public Integer getAtd_end_info() {
        return atd_end_info;
    }

    public void setAtd_end_info(Integer atd_end_info) {
        this.atd_end_info = atd_end_info;
    }

    public Integer getAtd_state() {
        return atd_state;
    }

    public void setAtd_state(Integer atd_state) {
        this.atd_state = atd_state;
    }

    public Date getAtd_system_time() {
        return atd_system_time;
    }

    public void setAtd_system_time(Date atd_system_time) {
        this.atd_system_time = atd_system_time;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "atd_id=" + atd_id +
                ", e_id=" + e_id +
                ", atd_start_time=" + atd_start_time +
                ", atd_end_time=" + atd_end_time +
                ", atd_start_info=" + atd_start_info +
                ", atd_end_info=" + atd_end_info +
                ", atd_state=" + atd_state +
                '}';
    }
}
