package com.itheima.service.impl;

import com.itheima.dao.VisitorTeaDao;
import com.itheima.po.PageInfo;
import com.itheima.po.VisitorTea;
import com.itheima.service.VisitorTeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;






@Service("visitorteaService")
@Transactional
public class VisitorTeaServiceImpl implements VisitorTeaService {
    // 注入studentDao
    @Autowired
    private VisitorTeaDao visitorTeaDao;

    //分页查询
    @Override
    public PageInfo<VisitorTea> findPageInfo(String vt_name, String vt_dormbuilding , Integer pageIndex, Integer pageSize) {
        PageInfo<VisitorTea> pi = new PageInfo<VisitorTea>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = visitorTeaDao.totalCount(vt_name,vt_dormbuilding);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<VisitorTea> visitorteaList =	visitorTeaDao.getVisitorTeaList(vt_name,vt_dormbuilding,
                    (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(visitorteaList);
        }
        return pi;
    }

    @Override
    public List<VisitorTea> getAll(){
        List<VisitorTea> visitorteaList = visitorTeaDao.getAll();
        return visitorteaList;
    }

    //添加学生信息
    @Override
    public  int addVisitorTea(VisitorTea visitortea) {
        return visitorTeaDao.addVisitorTea(visitortea);
    }
}
