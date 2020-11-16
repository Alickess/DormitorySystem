package com.zwu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwu.pojo.Professional;
import com.zwu.service.ProfessionalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/professional")
public class ProfessionalController {
    @Autowired
    private ProfessionalService professionalService;

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/findAll.do")
    public String findAll(ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo")Integer pageNo, @RequestParam(defaultValue="12",required=true,value="pageSize")Integer pageSize, Integer classId, String className){
        Integer pageNo1 =pageNo;
        Integer pageSize1 =pageSize;
        //分页查询
        PageHelper.startPage(pageNo1, pageSize1);
        List<Professional> professionalList = professionalService.findAll(classId, className);//获取所有用户信息
        PageInfo<Professional> pageInfo=new PageInfo<Professional>(professionalList);
        map.addAttribute("pageInfo", pageInfo);
        return "professional-list";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/saveProfessional.do")
    public String saveProfessional(Professional professional){
        professionalService.saveProfessional(professional);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/deleteProfessional.do")
    public String deleteProfessional(Integer id){
        professionalService.deleteProfessional(id);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/findProfessionalById.do")
    public String findProfessionalById(Model model, Integer id){
        Professional professional = professionalService.findProfessionalById(id);
        model.addAttribute("professional",professional);
        return "professional-detail";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/updateProfessional.do")
    public String updateProfessional(Professional professional){
        professionalService.updateProfessional(professional);
        System.out.println("更改过后的professional为"+professional);
        return "redirect:findProfessionalById.do?id="+professional.getId();
    }
}
