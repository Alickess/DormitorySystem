package com.zwu.service.impl;

import com.zwu.dao.SysDao;
import com.zwu.pojo.Syslog;
import com.zwu.service.SyslogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SyslogServiceImpl implements SyslogService {
    @Autowired
    private SysDao sysDao;
    @Override
    public void save(Syslog syslog) throws Exception {
        sysDao.save(syslog);
    }

    @Override
    public List<Syslog> findAll() throws Exception {
        return sysDao.findAll();
    }
}
