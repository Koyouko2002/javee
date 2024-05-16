package com.itheima.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
/**
 * @program: dormitorySystem
 * @description: 教职工访客
 * @author: Joyrocky
 * @create: 2019-05-14 00:37
 **/
public class VisitorTea {
    private Integer vt_id;
    private String vt_name;
    private Integer vt_phone;
    private Integer vt_dormitoryid;
    private String vt_dormbuilding;


    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date create_time;

    public Integer getVt_id() {
        return vt_id;
    }

    public void setVt_id(Integer vt_id) {
        this.vt_id = vt_id;
    }

    public String getVt_name() {
        return vt_name;
    }

    public void setVt_name(String vt_name) {
        this.vt_name = vt_name;
    }

    public Integer getVt_phone() {
        return vt_phone;
    }

    public void setVt_phone(Integer vt_phone) {
        this.vt_phone = vt_phone;
    }

    public Integer getVt_dormitoryid() {
        return vt_dormitoryid;
    }

    public void setVt_dormitoryid(Integer vt_dormitoryid) {
        this.vt_dormitoryid = vt_dormitoryid;
    }

    public String getVt_dormbuilding() {
        return vt_dormbuilding;
    }

    public void setVt_dormbuilding(String vt_dormbuilding) {
        this.vt_dormbuilding = vt_dormbuilding;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
