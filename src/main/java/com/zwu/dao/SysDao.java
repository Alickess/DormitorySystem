package com.zwu.dao;

import com.zwu.pojo.Syslog;

import java.util.List;

public interface SysDao {
    public void save(Syslog syslog) throws Exception;
    public List<Syslog> findAll() throws Exception;
}
