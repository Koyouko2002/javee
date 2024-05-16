package com.itheima.dao;

import com.itheima.po.VisitorTea;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

public interface VisitorTeaDao {
    /**
     * 进行分页查询
     */

    //获取总条数
    public Integer totalCount(@Param("vt_name") String vt_name, @Param("vt_dormbuilding")String vt_dormbuilding);
    //获取用户列表
    public List<VisitorTea> getVisitorTeaList(@Param("vt_name") String vt_name, @Param("vt_dormbuilding")String vt_dormbuilding, @Param("currentPage")Integer currentPage, @Param("pageSize")Integer pageSize);

    public int addVisitorTea(VisitorTea visitortea);   //添加学生信息
    public List<VisitorTea> getAll();
}

