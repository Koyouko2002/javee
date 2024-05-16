package com.itheima.service;

import com.itheima.po.PageInfo;
import com.itheima.po.VisitorTea;

import java.sql.Date;
import java.util.List;

/**
 * @program: dormitorySystem
 * @description: 教职工访客
 * @author: Joyrocky
 * @create: 2019-05-14 12:39
 **/
public interface VisitorTeaService {
    //分页查询
    public PageInfo<VisitorTea> findPageInfo(String vt_name, String vt_dormbuilding , Integer pageIndex, Integer pageSize);
    public int addVisitorTea(VisitorTea visitortea);   //添加访客信息
    public List<VisitorTea> getAll();
}
