package com.th.service.impl;

import com.th.dao.IDeptDao;
import com.th.entity.Dept;
import com.th.entity.TreeOne;
import com.th.entity.TreeTwo;
import com.th.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements IDeptService {

    @Autowired
    private IDeptDao iDeptDao;

    public List<TreeOne> findAll() {
        return iDeptDao.findAll();
    }

    public List<TreeTwo> findAll2() {
        return iDeptDao.findAll2();
    }
}






