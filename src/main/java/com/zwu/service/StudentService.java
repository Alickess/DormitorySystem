package com.zwu.service;

import com.zwu.pojo.Student;

import java.util.List;

public interface StudentService {
    public List<Student> findAll(String number,String name);
    public Integer saveStudent(Student student);
    public Integer deleteStudent(Integer id);
    public Integer updateStudent(Student student,Integer id);
    public Student findStudentById(Integer id);
}
