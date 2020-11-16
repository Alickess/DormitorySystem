package com.zwu.service;

import com.zwu.pojo.Admin;

import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface AdminService extends UserDetailsService {
    public List<Admin> findAll(Integer id,String username,String roleStr);
    public Admin findAdminByUsername(String username);
    public int saveAdmin(Admin admin);
    public int deleteAdmin(Integer id);
    public int updateAdmin(Admin admin);
    public Admin findAdminById(Integer id);
}
