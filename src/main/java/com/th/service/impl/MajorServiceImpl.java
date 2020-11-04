package com.th.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.th.dao.IMajorDao;
import com.th.entity.Major;
import com.th.entity.Parameters;
import com.th.service.IMajorService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class MajorServiceImpl implements IMajorService {
    @Autowired
    private IMajorDao iMajorDao;


    public void insert(Major major) {
        iMajorDao.insert(major);
    }

    public Major findById(Serializable id) {
        return iMajorDao.findById(id);
    }

    public void update(Major major) {
        iMajorDao.update(major);
    }

    public void delete(Serializable id) {
        iMajorDao.delete(id);
    }

    public List<Major> findByPage(Parameters parameters) {
        return iMajorDao.findByPage(parameters);
    }

    public PageInfo<Major> getPageInfo(String page, Integer limit,Parameters parameters) {
        PageHelper.startPage(Integer.valueOf(page),limit);

//        if(parameters.getCid()!=null && !"-1".equals(parameters.getCid())){
//            parameters.setCid(parameters.getCid());
//        }
//        if(parameters.getMname()!=null && parameters.getMname().trim().length()>0 ){
//            parameters.setMname(parameters.getMname());
//        }
//        if(parameters.getMinCredit()!=null){
//            parameters.setMinCredit(parameters.getMinCredit());
//        }
//        if(parameters.getMaxCredit()!=null){
//            parameters.setMaxCredit(parameters.getMaxCredit());
//        }
        if(parameters.getMinCredit()!=null && parameters.getMaxCredit()!=null){
            if(parameters.getMinCredit()>parameters.getMaxCredit()){
                int temp=parameters.getMinCredit();
                parameters.setMinCredit(parameters.getMaxCredit());
                parameters.setMaxCredit(temp);
            }
        }

        List<Major> byPage = iMajorDao.findByPage(parameters);

        System.out.println(iMajorDao.findByPage(parameters));

        PageInfo<Major> pageInfo = new PageInfo<Major>(byPage);

        return pageInfo;
    }

    public void deleteMany(int[] ids) {
        iMajorDao.deleteMany(ids);
    }
}
