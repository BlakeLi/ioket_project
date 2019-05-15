package com.ietok.project.entity;

import java.io.Serializable;
import java.sql.Date;

public class Recruit implements Serializable {

    //招聘信息ID
    private Integer rct_id;
    //岗位ID
    private Integer pos_id;
    //招聘信息标题
    private String rct_title;
    //招聘信息介绍
    private String rct_introduction;
    //发布时间
    private Date rct_publish_time;
    //公司地址
    private String rct_address;
    //基本薪资
    private Double rct_salary;
    //联系人ID
    private Integer e_id;
    //是否是草稿（0不是，1是）
    private Integer rct_is_draft;
    //是否已经发布（0没发布，1已发布）
    private Integer rct_is_publish;

    public Integer getRct_id() {
        return rct_id;
    }

    public void setRct_id(Integer rct_id) {
        this.rct_id = rct_id;
    }

    public Integer getPos_id() {
        return pos_id;
    }

    public void setPos_id(Integer pos_id) {
        this.pos_id = pos_id;
    }

    public String getRct_title() {
        return rct_title;
    }

    public void setRct_title(String rct_title) {
        this.rct_title = rct_title;
    }

    public String getRct_introduction() {
        return rct_introduction;
    }

    public void setRct_introduction(String rct_introduction) {
        this.rct_introduction = rct_introduction;
    }

    public Date getRct_publish_time() {
        return rct_publish_time;
    }

    public void setRct_publish_time(Date rct_publish_time) {
        this.rct_publish_time = rct_publish_time;
    }

    public String getRct_address() {
        return rct_address;
    }

    public void setRct_address(String rct_address) {
        this.rct_address = rct_address;
    }

    public Double getRct_salary() {
        return rct_salary;
    }

    public void setRct_salary(Double rct_salary) {
        this.rct_salary = rct_salary;
    }

    public Integer getE_id() {
        return e_id;
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    public Integer getRct_is_draft() {
        return rct_is_draft;
    }

    public void setRct_is_draft(Integer rct_is_draft) {
        this.rct_is_draft = rct_is_draft;
    }

    public Integer getRct_is_publish() {
        return rct_is_publish;
    }

    public void setRct_is_publish(Integer rct_is_publish) {
        this.rct_is_publish = rct_is_publish;
    }

    @Override
    public String toString() {
        return "Recruit{" +
                "rct_id=" + rct_id +
                ", pos_id=" + pos_id +
                ", rct_title='" + rct_title + '\'' +
                ", rct_introduction='" + rct_introduction + '\'' +
                ", rct_publish_time=" + rct_publish_time +
                ", rct_address='" + rct_address + '\'' +
                ", rct_salary=" + rct_salary +
                ", e_id=" + e_id +
                ", rct_is_draft=" + rct_is_draft +
                ", rct_is_publish=" + rct_is_publish +
                '}';
    }
}
