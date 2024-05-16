package com.itheima.service.impl;

import com.itheima.dao.StusionDao;
import com.itheima.po.PageInfo;
import com.itheima.po.Student;
import com.itheima.po.Stusion;
import com.itheima.service.StuSionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("stusionSevice")
@Transactional
public class StuSionServiceImpl implements StuSionService {
    @Autowired
    private StusionDao ssd;

    @Override
    public PageInfo<Stusion> findPageInfo(String ss_name, Integer ss_id, String ss_info, String ss_reult, Date ss_time, Integer pageIndex, Integer pageSize) {
        PageInfo<Stusion> pi = new PageInfo<Stusion>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = ssd.totalCount(ss_name,ss_id);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Stusion> stusionstList =	ssd.getStusionList(ss_name,ss_id,
                    (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(stusionstList);
        }
        return pi;
    }

    @Override
    public int deleteStusion(Integer ss_id) {

        return ssd.deleteStusion(ss_id);
    }

    @Override
    public int addStusion(Stusion stusion) {
        return ssd.addStusion(stusion);
    }

    @Override
    public int updateStusion(Stusion stusion) {
        return ssd.updateStusion(stusion);
    }

    @Override
    public Stusion findStusionById(Integer ss_id) {
        Stusion stusionById = ssd.findStusionById(ss_id);
        return stusionById;
    }

    @Override
    public List<Stusion> getAll() {
        List<Stusion> all = ssd.getAll();
        return all;
    }
}
