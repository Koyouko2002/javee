package com.itheima.controller;

import com.itheima.po.PageInfo;
import com.itheima.po.Stusion;
import com.itheima.service.StuSionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class StusionController {
    @Autowired
    private StuSionService sss;
    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findStusion")
    public String findStusion(String ss_name, Integer ss_id, String ss_info, String ss_reult, Date ss_time, Integer pageIndex, Integer pageSize, Model model) {

        PageInfo<Stusion> pi = sss.findPageInfo(ss_name,ss_id,ss_info,ss_reult,ss_time,pageIndex,pageSize);
        model.addAttribute("pi",pi);
        model.addAttribute("ss_name",ss_name);
        return "stusion_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportstusionlist", method = RequestMethod.POST)
    @ResponseBody
    public List<Stusion> exportStusion(){
        List<Stusion> stusionList = sss.getAll();
        return stusionList;
    }

    /**
     * 删除学生信息
     */
    @RequestMapping( "/deleteStusion")
    @ResponseBody
    public String deleteStusion(Integer ss_id) {
        int s = sss.deleteStusion(ss_id);
        return "stusion_list";
    }

    /**
     * 添加学生信息
     */

    @RequestMapping(value = "/addStusion" ,method = RequestMethod.POST)
    @ResponseBody
    public String addStusion(@RequestBody Stusion stusion) {
        int s = sss.addStusion(stusion);
        return "stusion_list";
    }

    /**
     * 修改学生信息
     */
    @RequestMapping(value = "/updateStusion" ,method = RequestMethod.POST )
    public String updateStusion( Stusion stusion) {
        int s = sss.updateStusion(stusion);
        return "redirect:/findStusion";
    }


    @RequestMapping( "/findStusionById")
    public String findStusionById(Integer ss_id, HttpSession session) {

        Stusion s= sss.findStusionById(ss_id);
        session.setAttribute("s",s);
        return "stusion_edit";
    }
}
