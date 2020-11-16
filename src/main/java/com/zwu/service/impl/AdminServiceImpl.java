package com.zwu.service.impl;

import com.zwu.dao.AdminDao;
import com.zwu.pojo.Admin;
import com.zwu.pojo.Role;
import com.zwu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public List<Admin> findAll(Integer id, String username, String roleStr) {
        return adminDao.findAll(id, username, roleStr);
    }

    @Override
    public Admin findAdminByUsername(String username) {
        return adminDao.findAdminByUsername(username);
    }

    @Override
    public int saveAdmin(Admin admin) {
        admin.setPassword(bCryptPasswordEncoder.encode(admin.getPassword()));
        return adminDao.saveAdmin(admin);
    }

    @Override
    public int deleteAdmin(Integer id) {
        return adminDao.deleteAdmin(id);
    }

    @Override
    public int updateAdmin(Admin admin) {
        return adminDao.updateAdmin(admin);
    }

    @Override
    public Admin findAdminById(Integer id) {
        return adminDao.findAdminById(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Admin admin=null;
        try {
            admin = adminDao.findAdminByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(admin);
        User user =new User(admin.getUsername(),admin.getPassword(),true,true,true,true,getAuthority(admin.getRole()));
        return user;
    }
    public List<SimpleGrantedAuthority> getAuthority(Role role){
        List<SimpleGrantedAuthority> list=new ArrayList<>();
        list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        return list;
    }
}
