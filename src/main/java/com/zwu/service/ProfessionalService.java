package com.zwu.service;

import com.zwu.pojo.Professional;


import java.util.List;

public interface ProfessionalService {
    public List<Professional> findAll(Integer classId,String className);
    public int saveProfessional(Professional professional);
    public int deleteProfessional(Integer id);
    public int updateProfessional(Professional professional);
    public Professional findProfessionalById(Integer id);
}
