package com.th.controller;

import com.th.entity.TreeOne;
import com.th.entity.TreeTwo;
import com.th.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("dept")
public class DeptController {

    @Autowired
    private IDeptService iDeptService;

    @RequestMapping("list")
    @ResponseBody
    public List<TreeOne> findAll(){
        List<TreeOne> list = iDeptService.findAll();
        return list;
    }

    @RequestMapping("list2")
    @ResponseBody
    public List<TreeTwo> findAll2(){
        List<TreeTwo> list = iDeptService.findAll2();
        return list;
    }

}
