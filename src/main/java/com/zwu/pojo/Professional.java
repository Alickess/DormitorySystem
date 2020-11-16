package com.zwu.pojo;

import java.io.Serializable;

public class Professional implements Serializable {
    private Integer id;
    private Integer classId;
    private String className;
    private String counselor;

    @Override
    public String toString() {
        return "Professional{" +
                "id=" + id +
                ", classId=" + classId +
                ", className='" + className + '\'' +
                ", counselor='" + counselor + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getCounselor() {
        return counselor;
    }

    public void setCounselor(String counselor) {
        this.counselor = counselor;
    }
}
