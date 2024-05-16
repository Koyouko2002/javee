package com.itheima.po;

import java.util.Date;

public class Stusion {

    private int ss_id;
    private String ss_name;
    private String ss_info;
    private String ss_result;
    private Date ss_time;

    public Stusion() {
    }

    public Stusion(int ss_id, String ss_name, String ss_info, String ss_result, Date ss_time) {
        this.ss_id = ss_id;
        this.ss_name = ss_name;
        this.ss_info = ss_info;
        this.ss_result = ss_result;
        this.ss_time = ss_time;
    }

    public int getSs_id() {
        return ss_id;
    }

    public void setSs_id(int ss_id) {
        this.ss_id = ss_id;
    }

    public String getSs_name() {
        return ss_name;
    }

    public void setSs_name(String ss_name) {
        this.ss_name = ss_name;
    }

    public String getSs_info() {
        return ss_info;
    }

    public void setSs_info(String ss_info) {
        this.ss_info = ss_info;
    }

    public String getSs_result() {
        return ss_result;
    }

    public void setSs_result(String ss_result) {
        this.ss_result = ss_result;
    }

    public Date getSs_time() {
        return ss_time;
    }

    public void setSs_time(Date ss_time) {
        this.ss_time = ss_time;
    }

    @Override
    public String toString() {
        return "Stusion{" +
                "ss_id=" + ss_id +
                ", ss_name='" + ss_name + '\'' +
                ", ss_info='" + ss_info + '\'' +
                ", ss_result='" + ss_result + '\'' +
                ", ss_time=" + ss_time +
                '}';
    }
}
