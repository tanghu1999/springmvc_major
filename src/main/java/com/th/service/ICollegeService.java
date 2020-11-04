package com.th.service;

import com.th.entity.College;

import java.io.Serializable;
import java.util.List;

public interface ICollegeService {
    void insert(College college);

    College findById(Serializable id);

    void update(College college);

    void delete(Serializable id);

    List<College> findAll();



}
