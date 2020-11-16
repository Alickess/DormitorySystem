package com.zwu.dao;


import com.zwu.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentDao {
    public List<Student> findAll(@Param("number") String number, @Param("name") String name);
    public int saveStudent(Student student);
    public int deleteStudent(Integer id);
    public int updateStudent(Student student);
    public Student findStudentById(Integer id);
}
