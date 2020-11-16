package com.zwu.pojo;

import com.zwu.util.DateUtils;

import java.util.Date;

public class DormitoryClean {
    private Integer id;
    private Integer dormitoryId;
    private Integer dormitoryName;
    private Integer buildingName;
    private Date creatTime;
    private String creatTimeStr;
    private Date updateTime;
    private String updateTimeStr;
    private Integer grade;
    private String appraise;
    private String administrator;

    @Override
    public String toString() {
        return "DormitoryClean{" +
                "id=" + id +
                ", dormitoryId=" + dormitoryId +
                ", dormitoryName=" + dormitoryName +
                ", buildingName=" + buildingName +
                ", creatTime=" + creatTime +
                ", creatTimeStr='" + creatTimeStr + '\'' +
                ", updateTime=" + updateTime +
                ", updateTimeStr='" + updateTimeStr + '\'' +
                ", grade=" + grade +
                ", appraise='" + appraise + '\'' +
                ", administrator='" + administrator + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDormitoryId() {
        return dormitoryId;
    }

    public void setDormitoryId(Integer dormitoryId) {
        this.dormitoryId = dormitoryId;
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

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public String getCreatTimeStr() {
        if(creatTime!=null){
            creatTimeStr= DateUtils.date2String(creatTime,"yyyy-MM-dd HH:mm");
        }
        return creatTimeStr;
    }

    public void setCreatTimeStr(String creatTimeStr) {
        this.creatTimeStr = creatTimeStr;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateTimeStr() {
        if(updateTime!=null){
            updateTimeStr= DateUtils.date2String(updateTime,"yyyy-MM-dd HH:mm");
        }
        return updateTimeStr;
    }

    public void setUpdateTimeStr(String updateTimeStr) {
        this.updateTimeStr = updateTimeStr;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getAppraise() {
        return appraise;
    }

    public void setAppraise(String appraise) {
        this.appraise = appraise;
    }

    public String getAdministrator() {
        return administrator;
    }

    public void setAdministrator(String administrator) {
        this.administrator = administrator;
    }
}
