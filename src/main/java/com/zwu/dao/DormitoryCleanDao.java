package com.zwu.dao;

import com.zwu.pojo.Dormitory;
import com.zwu.pojo.DormitoryClean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DormitoryCleanDao {
    public List<DormitoryClean> findAll(@Param("grade")Integer grade, @Param("administrator")String administrator);
    public Integer saveDormitoryClean(DormitoryClean dormitoryClean);
    public Integer deleteDormitoryClean(Integer id);
    public Integer updateDormitoryClean(DormitoryClean dormitoryClean);
    public DormitoryClean findDormitoryCleanById(Integer id);
}
