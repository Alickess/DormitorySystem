package com.zwu.service.impl;

import com.zwu.dao.DormitoryDao;
import com.zwu.dao.StudentDao;
import com.zwu.pojo.Student;
import com.zwu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private DormitoryDao dormitoryDao;
    @Override
    public List<Student> findAll(String number,String name) {
        return studentDao.findAll(number, name);
    }

    @Override
    public Integer saveStudent(Student student) {
        Integer totalBed = dormitoryDao.findTotalBedById(student.getDormitoryId());
        Integer useBed = dormitoryDao.findUseBedById(student.getDormitoryId());
        if(useBed<totalBed){
            dormitoryDao.updateUseBed(useBed+1,student.getDormitoryId());
            studentDao.saveStudent(student);
            return 1;
        }else {
            return 0;
        }
    }

    @Override
    public Integer deleteStudent(Integer id) {
        Student student = studentDao.findStudentById(id);
        Integer useBed = dormitoryDao.findUseBedById(student.getDormitoryId());
        dormitoryDao.updateUseBed(useBed-1,student.getDormitoryId());
        return studentDao.deleteStudent(id);
    }

    @Override
    public Integer updateStudent(Student student,Integer id) {
        Integer totalBed = dormitoryDao.findTotalBedById(student.getDormitoryId());
        Integer useBedNew = dormitoryDao.findUseBedById(student.getDormitoryId());

        Student studentOld = studentDao.findStudentById(id);
        Integer useBedOld = dormitoryDao.findUseBedById(studentOld.getDormitoryId());
        if (studentOld.getDormitoryId() == student.getDormitoryId()) {
            studentDao.updateStudent(student);
            return 1;
        } else if (useBedNew < totalBed){
            dormitoryDao.updateUseBed(useBedOld - 1, studentOld.getDormitoryId());
            dormitoryDao.updateUseBed(useBedNew + 1, student.getDormitoryId());
            studentDao.updateStudent(student);
            return 1;
        } else {
            return 0;
        }
    }


    @Override
    public Student findStudentById(Integer id) {
        return studentDao.findStudentById(id);
    }
}
