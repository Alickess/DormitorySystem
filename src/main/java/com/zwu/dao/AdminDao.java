package com.zwu.dao;
import com.zwu.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface AdminDao {
	public List<Admin> findAll(@Param("id") Integer id,@Param("username") String username, @Param("roleId") String roleId);
	public Admin findAdminByUsername(String username);
	public int saveAdmin(Admin admin);
	public int deleteAdmin(Integer id);
	public int updateAdmin(Admin admin);
	public Admin findAdminById(Integer id);
}
