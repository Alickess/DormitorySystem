package com.zwu.dao;

import com.zwu.pojo.Role;

public interface RoleDao {
    public Role findRoleById(Integer id);
    public String findRoleNameById(Integer id);
}
