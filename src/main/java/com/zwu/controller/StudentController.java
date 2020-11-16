package com.zwu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwu.pojo.Admin;
import com.zwu.pojo.Student;
import com.zwu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/findAll.do")
    public String findAll(ModelMap map, @RequestParam(defaultValue = "1", required = true, value = "pageNo") Integer pageNo, @RequestParam(defaultValue = "12", required = true, value = "pageSize") Integer pageSize, String number, String name) throws Exception {
        Integer pageNo1 = pageNo;
        Integer pageSize1 = pageSize;
        //分页查询
        PageHelper.startPage(pageNo1, pageSize1);
        List<Student> studentList = studentService.findAll(number, name);//获取所有用户信息
        PageInfo<Student> pageInfo = new PageInfo<Student>(studentList);
        map.addAttribute("pageInfo", pageInfo);
        return "student-list";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/saveStudent.do")
    public String saveStudent(Student student){
        int flag = studentService.saveStudent(student);
        if (flag==1){
            return "redirect:findAll.do";
        }else{
            return "failer";
        }

    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/deleteStudent.do")
    public String deleteStudent(Integer id){
        studentService.deleteStudent(id);
        return "redirect:findAll.do";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/findStudentById.do")
    public String findStudentById(Model model, Integer id){
        Student student =studentService.findStudentById(id);
        model.addAttribute("student",student);
        return "student-detail";
    }

    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    @RequestMapping("/updateStudent.do")
    public String updateStudent(Student student,Integer id){
        int flag = studentService.updateStudent(student,id);
        if (flag==1){
            System.out.println("更改过后的student为"+student);
            return "redirect:findStudentById.do?id="+student.getId();
        }else {
            return "failer";
        }

    }
}
