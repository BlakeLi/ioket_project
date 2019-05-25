package com.ietok.project.entity;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.sql.Date;

public class Employee implements Serializable {
//    @NotNull(groups = {group_1.class},message = "NIDEHOH")
    private Integer e_id;
    private String e_account;
    private String e_pass;
    private Integer e_type;
    private String e_name;
    private String e_gender;
    private String e_address;
    private Long e_phone;
    private Long e_debit;
    private Date e_enroll_date;
    private Integer e_state;
    private Double e_salary;
    private Integer pos_id;
//    public interface group_1 {
//    };


    public Integer getE_id() {
        return e_id;
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    public String getE_account() {
        return e_account;
    }

    public void setE_account(String e_account) {
        this.e_account = e_account;
    }

    public String getE_pass() {
        return e_pass;
    }

    public void setE_pass(String e_pass) {
        this.e_pass = e_pass;
    }

    public Integer getE_type() {
        return e_type;
    }

    public void setE_type(Integer e_type) {
        this.e_type = e_type;
    }

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public String getE_gender() {
        return e_gender;
    }

    public void setE_gender(String e_gender) {
        this.e_gender = e_gender;
    }

    public String getE_address() {
        return e_address;
    }

    public void setE_address(String e_address) {
        this.e_address = e_address;
    }

    public Long getE_phone() {
        return e_phone;
    }

    public void setE_phone(Long e_phone) {
        this.e_phone = e_phone;
    }

    public Long getE_debit() {
        return e_debit;
    }

    public void setE_debit(Long e_debit) {
        this.e_debit = e_debit;
    }

    public Date getE_enroll_date() {
        return e_enroll_date;
    }

    public void setE_enroll_date(Date e_enroll_date) {
        this.e_enroll_date = e_enroll_date;
    }

    public Integer getE_state() {
        return e_state;
    }

    public void setE_state(Integer e_state) {
        this.e_state = e_state;
    }

    public Double getE_salary() {
        return e_salary;
    }

    public void setE_salary(Double e_salary) {
        this.e_salary = e_salary;
    }

    public Integer getPos_id() {
        return pos_id;
    }

    public void setPos_id(Integer pos_id) {
        this.pos_id = pos_id;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "e_id=" + e_id +
                ", e_account='" + e_account + '\'' +
                ", e_pass='" + e_pass + '\'' +
                ", e_type=" + e_type +
                ", e_name='" + e_name + '\'' +
                ", e_gender='" + e_gender + '\'' +
                ", e_address='" + e_address + '\'' +
                ", e_phone=" + e_phone +
                ", e_debit=" + e_debit +
                ", e_enroll_date=" + e_enroll_date +
                ", e_state=" + e_state +
                ", e_salary=" + e_salary +
                ", pos_id=" + pos_id +
                '}';
    }
}
