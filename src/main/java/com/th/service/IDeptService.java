package com.th.service;

import com.th.entity.TreeOne;
import com.th.entity.TreeTwo;

import java.util.List;

public interface IDeptService {
    List<TreeOne> findAll();

    List<TreeTwo> findAll2();
}
