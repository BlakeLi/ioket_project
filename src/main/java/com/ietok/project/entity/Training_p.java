package com.ietok.project.entity;

import java.io.Serializable;

public class Training_p implements Serializable {
    private Integer tp_id;
    private Integer e_id;
    private Integer t_id;

    public Training_p() {
    }

    private Training_p (Builder builder){
        this.e_id = builder.e_id;
    }

   public static class Builder{
        private Integer tp_id;
        private Integer e_id;
        private Integer t_id;

        public Builder e_id(Integer e_id){
            this.e_id = e_id;
            return this;
        }
        public Training_p build(){
            return new Training_p(this);
        }
    }

    public Integer getTp_id() {
        return tp_id;
    }

    public void setTp_id(Integer tp_id) {
        this.tp_id = tp_id;
    }

    public Integer getE_id() {
        return e_id;
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    public Integer getT_id() {
        return t_id;
    }

    public void setT_id(Integer t_id) {
        this.t_id = t_id;
    }

    @Override
    public String toString() {
        return "Training_p{" +
                "tp_id=" + tp_id +
                ", e_id=" + e_id +
                ", t_id=" + t_id +
                '}';
    }
}
