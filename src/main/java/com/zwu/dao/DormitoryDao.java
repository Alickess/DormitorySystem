package com.zwu.dao;

import com.zwu.pojo.Admin;
import com.zwu.pojo.Dormitory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DormitoryDao {
    public Integer findDormitoryNameById(Integer id);
    public Integer findBuildingNameById(Integer id);
    public List<Dormitory> findAll(@Param("dormitoryName") Integer dormitoryName, @Param("buildingName") Integer buildingName,@Param("administrator")String administrator);
    public Integer saveDormitory(Dormitory dormitory);
    public Integer deleteDormitory(Integer id);
    public Integer updateDormitory(Dormitory dormitory);
    public Dormitory findDormitoryById(Integer id);
    public Integer findTotalBedById(Integer id);
    public Integer findUseBedById(Integer id);
    public Integer updateUseBed(@Param("useBed") Integer useBed,@Param("id") Integer id);
}
