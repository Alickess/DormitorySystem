package com.zwu.pojo;

import java.io.Serializable;

public class Dormitory implements Serializable {
    private Integer id;
    private Integer dormitoryName;
    private Integer buildingName;
    private Integer totalBed;
    private Integer useBed;
    private String administrator;

    @Override
    public String toString() {
        return "Dormitory{" +
                "id=" + id +
                ", dormitoryName=" + dormitoryName +
                ", buildingName=" + buildingName +
                ", totalBed=" + totalBed +
                ", useBed=" + useBed +
                ", administrator='" + administrator + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDormitoryName() {
        return dormitoryName;
    }

    public void setDormitoryName(Integer dormitoryName) {
        this.dormitoryName = dormitoryName;
    }

    public Integer getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(Integer buildingName) {
        this.buildingName = buildingName;
    }

    public Integer getTotalBed() {
        return totalBed;
    }

    public void setTotalBed(Integer totalBed) {
        this.totalBed = totalBed;
    }

    public Integer getUseBed() {
        return useBed;
    }

    public void setUseBed(Integer useBed) {
        this.useBed = useBed;
    }

    public String getAdministrator() {
        return administrator;
    }

    public void setAdministrator(String administrator) {
        this.administrator = administrator;
    }
}
