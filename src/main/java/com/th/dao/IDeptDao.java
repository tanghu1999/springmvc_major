package com.th.dao;

import com.th.entity.TreeOne;
import com.th.entity.TreeTwo;

import java.util.List;

public interface IDeptDao {
    List<TreeOne> findAll();

    List<TreeTwo> findAll2();


}
