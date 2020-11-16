package com.zwu.service.impl;

import com.zwu.dao.ProfessionalDao;
import com.zwu.pojo.Professional;
import com.zwu.service.ProfessionalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProfessionalServiceImpl implements ProfessionalService {
    @Autowired
    private ProfessionalDao professionalDao;
    @Override
    public List<Professional> findAll(Integer classId, String className) {
        return professionalDao.findAll(classId, className);
    }

    @Override
    public int saveProfessional(Professional professional) {
        return professionalDao.saveProfessional(professional);
    }

    @Override
    public int deleteProfessional(Integer id) {
        return professionalDao.deleteProfessional(id);
    }

    @Override
    public int updateProfessional(Professional professional) {
        return professionalDao.updateProfessional(professional);
    }

    @Override
    public Professional findProfessionalById(Integer id) {
        return professionalDao.findProfessionalById(id);
    }
}
