package com.zwu.service;

import com.zwu.pojo.DormitoryClean;


import java.util.List;

public interface DormitoryCleanService {
    public List<DormitoryClean> findAll(Integer grade,String administrator);
    public Integer saveDormitoryClean(DormitoryClean dormitoryClean);
    public Integer deleteDormitoryClean(Integer id);
    public Integer updateDormitoryClean(DormitoryClean dormitoryClean);
    public DormitoryClean findDormitoryCleanById(Integer id);
}
