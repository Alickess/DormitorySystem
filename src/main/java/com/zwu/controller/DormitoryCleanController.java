package com.zwu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwu.pojo.Dormitory;
import com.zwu.pojo.DormitoryClean;
import com.zwu.service.DormitoryCleanService;
import com.zwu.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/dormitoryClean")
public class DormitoryCleanController {
    @Autowired
    private DormitoryCleanService dormitoryCleanService;

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/findAll.do")
    public String findAll(ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo")Integer pageNo, @RequestParam(defaultValue="12",required=true,value="pageSize")Integer pageSize,Integer grade, String administrator){
        Integer pageNo1 =pageNo;
        Integer pageSize1 =pageSize;
        //分页查询
        PageHelper.startPage(pageNo1, pageSize1);
        List<DormitoryClean> dormitoryCleanList = dormitoryCleanService.findAll(grade, administrator);//获取所有用户信息
        PageInfo<DormitoryClean> pageInfo=new PageInfo<DormitoryClean>(dormitoryCleanList);
        map.addAttribute("pageInfo", pageInfo);
        return "dormitoryClean-list";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/saveDormitoryClean.do")
    public String saveDormitoryClean(DormitoryClean dormitoryClean){
        dormitoryCleanService.saveDormitoryClean(dormitoryClean);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/deleteDormitoryClean.do")
    public String deleteDormitoryClean(Integer id){
        dormitoryCleanService.deleteDormitoryClean(id);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/findDormitoryCleanById.do")
    public String findDormitoryCleanById(Model model,Integer id){
        DormitoryClean dormitoryClean =  dormitoryCleanService.findDormitoryCleanById(id);
        model.addAttribute("dormitoryClean",dormitoryClean);
        return "dormitoryClean-detail";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/updateDormitoryClean.do")
    public String updateDormitoryClean(DormitoryClean dormitoryClean){
        dormitoryClean.setUpdateTime(new Date());
        dormitoryCleanService.updateDormitoryClean(dormitoryClean);
        System.out.println("更改过后的dormitoryClean为"+dormitoryClean);
        return "redirect:findDormitoryCleanById.do?id="+dormitoryClean.getId();
    }
}
