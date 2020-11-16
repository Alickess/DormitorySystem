package com.zwu.service;

import com.zwu.pojo.Syslog;

import java.util.List;

public interface SyslogService {
    void save(Syslog syslog) throws Exception;

    List<Syslog> findAll() throws Exception;
}
