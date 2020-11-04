package com.th.service.impl;

import com.th.dao.ICollegeDao;
import com.th.entity.College;
import com.th.service.ICollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class CollegeServiceImpl implements ICollegeService {
    @Autowired
    private ICollegeDao iCollegeDao;


    public void insert(College college) {
        iCollegeDao.insert(college);
    }

    public College findById(Serializable id) {
        return iCollegeDao.findById(id);
    }

    public void update(College college) {
        iCollegeDao.update(college);
    }

    public void delete(Serializable id) {
        iCollegeDao.delete(id);
    }

    public List<College> findAll() {
        return iCollegeDao.findAll();
    }
}
