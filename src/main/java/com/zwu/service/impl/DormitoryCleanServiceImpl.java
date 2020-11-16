package com.zwu.service.impl;

import com.zwu.dao.DormitoryCleanDao;
import com.zwu.pojo.DormitoryClean;
import com.zwu.service.DormitoryCleanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class DormitoryCleanServiceImpl implements DormitoryCleanService {
    @Autowired
    private DormitoryCleanDao dormitoryCleanDao;

    @Override
    public List<DormitoryClean> findAll(Integer grade, String administrator) {
        return dormitoryCleanDao.findAll(grade, administrator);
    }

    @Override
    public Integer saveDormitoryClean(DormitoryClean dormitoryClean) {
        dormitoryClean.setCreatTime(new Date());
        dormitoryClean.setUpdateTime(new Date());
        return dormitoryCleanDao.saveDormitoryClean(dormitoryClean);
    }

    @Override
    public Integer deleteDormitoryClean(Integer id) {
        return dormitoryCleanDao.deleteDormitoryClean(id);
    }

    @Override
    public Integer updateDormitoryClean(DormitoryClean dormitoryClean) {
        dormitoryClean.setUpdateTime(new Date());
        return dormitoryCleanDao.updateDormitoryClean(dormitoryClean);
    }

    @Override
    public DormitoryClean findDormitoryCleanById(Integer id) {
        return dormitoryCleanDao.findDormitoryCleanById(id);
    }
}
