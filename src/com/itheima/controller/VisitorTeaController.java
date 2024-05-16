package com.itheima.controller;

import com.itheima.po.PageInfo;
import com.itheima.po.VisitorTea;
import com.itheima.service.VisitorTeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.util.List;







@Controller
public class VisitorTeaController {
    //依赖注入
    @Autowired
    private VisitorTeaService visitorteaService;
    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findVisitorTea")
    public String findVisitorTea(String vt_name, String vt_dormbuilding , Integer pageIndex,
                                 Integer pageSize, Model model) {

        PageInfo<VisitorTea> pi = visitorteaService.findPageInfo(vt_name,vt_dormbuilding,
                pageIndex,pageSize);
        model.addAttribute("pi",pi);
        model.addAttribute("vt_name",vt_name);
        return "visitortea_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportvisitortealist", method = RequestMethod.POST)
    @ResponseBody
    public List<VisitorTea> exportVisitorTea(){
        List<VisitorTea> visitorteaList = visitorteaService.getAll();
        return visitorteaList;
    }

    /**
     * 添加学生信息
     */

    @RequestMapping(value = "/addVisitorTea" ,method = RequestMethod.POST)
    @ResponseBody
    public String addStudent(@RequestBody VisitorTea visitortea) {
        int v = visitorteaService.addVisitorTea(visitortea);
        return "visitortea_list";
    }

}
