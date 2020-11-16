package com.zwu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwu.pojo.Admin;
import com.zwu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROLE_SUPER')")
    public String findAll(ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo")Integer pageNo, @RequestParam(defaultValue="12",required=true,value="pageSize")Integer pageSize,Integer id,String username,String roleId) throws Exception {
        Integer pageNo1 =pageNo;
        Integer pageSize1 =pageSize;
        //分页查询
        PageHelper.startPage(pageNo1, pageSize1);
        List<Admin> adminList = adminService.findAll(id,username,roleId);//获取所有用户信息
        PageInfo<Admin> pageInfo=new PageInfo<Admin>(adminList);
        map.addAttribute("pageInfo", pageInfo);
        return "admin-list";
    }

    @RequestMapping("/findAdminByUserName.do")
    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    public String findAdminByUsername(String username,Model model){
        Admin admin = adminService.findAdminByUsername(username);
        model.addAttribute("admin",admin);
        return "information-detail";
    }

    @PreAuthorize("hasRole('ROLE_SUPER')")
    @RequestMapping("/saveAdmin.do")
    public String saveAdmin(Admin admin){
        adminService.saveAdmin(admin);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasRole('ROLE_SUPER')")
    @RequestMapping("/deleteAdmin.do")
    public String deleteAdmin(Integer id){
        adminService.deleteAdmin(id);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasRole('ROLE_SUPER')")
    @RequestMapping("/findAdminById.do")
    public String findAdminById(Model model, Integer id){
        Admin admin = adminService.findAdminById(id);
        model.addAttribute("admin",admin);
        return "admin-detail";
    }

    @PreAuthorize("hasRole('ROLE_SUPER')")
    @RequestMapping("/updateAdmin.do")
    public String updateAdmin(Admin admin){
        adminService.updateAdmin(admin);
        System.out.println("更改过后的admin为"+admin);
        return "redirect:findAdminById.do?id="+admin.getId();
    }

    @PreAuthorize("hasRole('ROLE_SUPER')")
    @RequestMapping("/updateAdminToInformational.do")
    public String updateAdminToInformational(Admin admin){
        adminService.updateAdmin(admin);
        return "redirect:findAdminByUserName.do?username="+admin.getUsername();
    }
}
