package com.zwu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwu.pojo.Dormitory;
import com.zwu.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/dormitory")
public class DormitoryController {
    @Autowired
    private DormitoryService dormitoryService;

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/findAll.do")
    public String findAll(ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo")Integer pageNo, @RequestParam(defaultValue="12",required=true,value="pageSize")Integer pageSize,Integer dormitoryName, Integer buildingName, String administrator){
        Integer pageNo1 =pageNo;
        Integer pageSize1 =pageSize;
        //分页查询
        PageHelper.startPage(pageNo1, pageSize1);
        List<Dormitory> dormitoryList = dormitoryService.findAll(dormitoryName, buildingName, administrator);//获取所有用户信息
        PageInfo<Dormitory> pageInfo=new PageInfo<Dormitory>(dormitoryList);
        map.addAttribute("pageInfo", pageInfo);
        return "dormitory-list";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/saveDormitory.do")
    public String saveDormitory(Dormitory dormitory){
        dormitoryService.saveDormitory(dormitory);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/deleteDormitory.do")
    public String deleteDormitory(Integer id){
        dormitoryService.deleteDormitory(id);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/findDormitoryById.do")
    public String findDormitoryById(Model model,Integer id){
        Dormitory dormitory =  dormitoryService.findDormitoryById(id);
        model.addAttribute("dormitory",dormitory);
        return "dormitory-detail";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/updateDormitory.do")
    public String updateDormitory(Dormitory dormitory){
        dormitoryService.updateDormitory(dormitory);
        System.out.println("更改过后的dormitory为"+dormitory);
        return "redirect:findDormitoryById.do?id="+dormitory.getId();
    }
}
