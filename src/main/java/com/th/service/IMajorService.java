package com.th.service;

import com.github.pagehelper.PageInfo;

import com.mysql.fabric.xmlrpc.base.Params;
import com.th.entity.Major;
import com.th.entity.Parameters;

import java.io.Serializable;
import java.util.List;

public interface IMajorService {
    void insert(Major major);

    Major findById(Serializable id);

    void update(Major major);

    void delete(Serializable id);

    List<Major> findByPage(Parameters parameters);

    PageInfo<Major> getPageInfo(String page, Integer limit, Parameters parameters); //String cid,String mname,String minCredit,String maxCredit

    void deleteMany(int[] ids);


}
