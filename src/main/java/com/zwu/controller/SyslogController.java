package com.zwu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwu.pojo.Syslog;
import com.zwu.service.SyslogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/syslog")
public class SyslogController {
    @Autowired
    private SyslogService syslogService;

    @RequestMapping("/findAll.do")
    @PreAuthorize("hasAnyRole('ROLE_SUPER','ROLE_ROOT')")
    public String  findAll(ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo")Integer pageNo, @RequestParam(defaultValue="12",required=true,value="pageSize")Integer pageSize) throws Exception{
        Integer pageNo1 =pageNo;
        Integer pageSize1 =pageSize;

        PageHelper.startPage(pageNo1, pageSize1);
        List<Syslog> syslogList = syslogService.findAll();
        PageInfo<Syslog> pageInfo=new PageInfo<Syslog>(syslogList);
        map.addAttribute("pageInfo", pageInfo);
        return "syslog-list";
    }
}
