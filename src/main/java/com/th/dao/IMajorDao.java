package com.th.dao;

import com.th.entity.Major;
import com.th.entity.Parameters;

import java.io.Serializable;
import java.util.List;

public interface IMajorDao {
    void insert(Major major);

    Major findById(Serializable id);

    void update(Major major);

    void delete(Serializable id);

    List<Major> findByPage(Parameters parameters);

    void deleteMany(int[] ids);

}
