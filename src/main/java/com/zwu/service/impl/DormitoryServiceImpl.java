package com.zwu.service.impl;

import com.zwu.dao.DormitoryDao;
import com.zwu.pojo.Dormitory;
import com.zwu.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DormitoryServiceImpl implements DormitoryService {
    @Autowired
    private DormitoryDao dormitoryDao;
    @Override
    public List<Dormitory> findAll(Integer dormitoryName, Integer buildingName, String administrator) {
        return dormitoryDao.findAll(dormitoryName, buildingName, administrator);
    }

    @Override
    public Integer saveDormitory(Dormitory dormitory) {
        return dormitoryDao.saveDormitory(dormitory);
    }

    @Override
    public Integer deleteDormitory(Integer id) {
        return dormitoryDao.deleteDormitory(id);
    }

    @Override
    public Integer updateDormitory(Dormitory dormitory) {
        return dormitoryDao.updateDormitory(dormitory);
    }

    @Override
    public Dormitory findDormitoryById(Integer id) {
        return dormitoryDao.findDormitoryById(id);
    }

}
