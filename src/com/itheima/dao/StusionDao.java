package com.itheima.dao;

import com.itheima.po.Stusion;
import com.itheima.po.Stusion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StusionDao {
    /**
     * 进行分页查询
     */
    /**
     * 进行分页查询
     */

    //获取总条数
    public Integer totalCount(@Param("ss_name") String ss_name, @Param("ss_id")Integer ss_id);

    //获取用户列表
    public List<Stusion> getStusionList(@Param("ss_name") String ss_name, @Param("ss_id")Integer ss_id,
                                        @Param("currentPage")Integer currentPage, @Param("pageSize")Integer pageSize);

    public int deleteStusion(Integer ss_id);   //删除学生信息
    public int addStusion(Stusion stusion);   //添加学生信息
    public int updateStusion(Stusion stusion); //修改学生信息
    public Stusion findStusionById(Integer ss_id);  //id查询

    public List<Stusion> getAll();  //全部查询
}
