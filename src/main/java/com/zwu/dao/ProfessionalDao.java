package com.zwu.dao;

import com.zwu.pojo.Admin;
import com.zwu.pojo.Professional;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProfessionalDao {
    public Integer findClassIdById(Integer id);
    public String findClassNameById(Integer id);
    public List<Professional> findAll(@Param("classId") Integer classId,@Param("className") String className);
    public int saveProfessional(Professional professional);
    public int deleteProfessional(Integer id);
    public int updateProfessional(Professional professional);
    public Professional findProfessionalById(Integer id);
}
