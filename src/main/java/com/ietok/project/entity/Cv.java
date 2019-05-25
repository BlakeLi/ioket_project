package com.ietok.project.entity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.sql.Date;

public class Cv implements Serializable {
    private Integer cv_id;
    private Integer c_id;
    @NotBlank(message = "你好")
    private String cv_name;
    private String cv_gender;
    private Date cv_birth;
    private String cv_address;
    private String cv_school;
    private String cv_education;
    private String cv_major;
    private Date cv_enroll_date;
    private Date cv_graduation_date;
    private Double cv_salary;
    private String cv_experience;

    public Integer getCv_id() {
        return cv_id;
    }

    public void setCv_id(Integer cv_id) {
        this.cv_id = cv_id;
    }

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    public String getCv_name() {
        return cv_name;
    }

    public void setCv_name(String cv_name) {
        this.cv_name = cv_name;
    }

    public String getCv_gender() {
        return cv_gender;
    }

    public void setCv_gender(String cv_gender) {
        this.cv_gender = cv_gender;
    }

    public Date getCv_birth() {
        return cv_birth;
    }

    public void setCv_birth(Date cv_birth) {
        this.cv_birth = cv_birth;
    }

    public String getCv_address() {
        return cv_address;
    }

    public void setCv_address(String cv_address) {
        this.cv_address = cv_address;
    }

    public String getCv_school() {
        return cv_school;
    }

    public void setCv_school(String cv_school) {
        this.cv_school = cv_school;
    }

    public String getCv_education() {
        return cv_education;
    }

    public void setCv_education(String cv_education) {
        this.cv_education = cv_education;
    }

    public String getCv_major() {
        return cv_major;
    }

    public void setCv_major(String cv_major) {
        this.cv_major = cv_major;
    }

    public Date getCv_enroll_date() {
        return cv_enroll_date;
    }

    public void setCv_enroll_date(Date cv_enroll_date) {
        this.cv_enroll_date = cv_enroll_date;
    }

    public Date getCv_graduation_date() {
        return cv_graduation_date;
    }

    public void setCv_graduation_date(Date cv_graduation_date) {
        this.cv_graduation_date = cv_graduation_date;
    }

    public Double getCv_salary() {
        return cv_salary;
    }

    public void setCv_salary(Double cv_salary) {
        this.cv_salary = cv_salary;
    }

    public String getCv_experience() {
        return cv_experience;
    }

    public void setCv_experience(String cv_experience) {
        this.cv_experience = cv_experience;
    }

    @Override
    public String toString() {
        return "Cv{" +
                "cv_id=" + cv_id +
                ", c_id=" + c_id +
                ", cv_name='" + cv_name + '\'' +
                ", cv_gender='" + cv_gender + '\'' +
                ", cv_birth=" + cv_birth +
                ", cv_address='" + cv_address + '\'' +
                ", cv_school='" + cv_school + '\'' +
                ", cv_education='" + cv_education + '\'' +
                ", cv_major='" + cv_major + '\'' +
                ", cv_enroll_date=" + cv_enroll_date +
                ", cv_graduation_date=" + cv_graduation_date +
                ", cv_salary=" + cv_salary +
                ", cv_experience='" + cv_experience + '\'' +
                '}';
    }
}
