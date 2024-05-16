package com.itheima.service;

import com.itheima.po.PageInfo;
import com.itheima.po.Stusion;

import java.util.Date;
import java.util.List;
//Stusion stusion

public interface StuSionService {

    //分页查询
    public PageInfo<Stusion> findPageInfo(String ss_name, Integer ss_id, String ss_info, String ss_reult,
                                          Date ss_time, Integer pageIndex, Integer pageSize);

    public int deleteStusion(Integer ss_id);   //通过id删除学生信息
    public int addStusion(Stusion stusion);   //添加学生信息
    public int updateStusion(Stusion stusion); //修改学生信息
    public Stusion findStusionById(Integer ss_id);
    public List<Stusion> getAll();

}
