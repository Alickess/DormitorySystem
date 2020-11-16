package com.zwu.service;

import com.zwu.pojo.Dormitory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DormitoryService {
    public List<Dormitory> findAll(Integer dormitoryName, Integer buildingName, String administrator);
    public Integer saveDormitory(Dormitory dormitory);
    public Integer deleteDormitory(Integer id);
    public Integer updateDormitory(Dormitory dormitory);
    public Dormitory findDormitoryById(Integer id);
}
