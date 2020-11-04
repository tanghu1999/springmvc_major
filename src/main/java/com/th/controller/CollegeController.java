package com.th.controller;

import com.th.entity.College;
import com.th.service.ICollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("college")
public class CollegeController {

    @Autowired
    private ICollegeService iCollegeService;


    @RequestMapping("findAll")
    @ResponseBody //@ResponseBody的作用其实是将java对象转为json格式的数据
    public Map findAll(){
        List<College> colleges = iCollegeService.findAll();

        Map map = new HashMap();
        map.put("colleges",colleges);

        return map;
    }


//    @RequestMapping("upload")
//    @ResponseBody //@ResponseBody的作用其实是将java对象转为json格式的数据
//    public String upload(@RequestParam("cpic") CommonsMultipartFile cpic,HttpSession session) throws Exception{
//        String imagesPath = session.getServletContext().getRealPath("images");
//        File dir = new File(imagesPath);
//        if(!dir.exists()){
//            dir.mkdirs();
//        }
//        String fileName = UUID.randomUUID().toString().replaceAll("-","")+cpic.getOriginalFilename();
//        File newFile = new File(imagesPath+"//"+fileName);
//        cpic.transferTo(newFile);
//        return fileName;
//    }

    @RequestMapping("upload")
    @ResponseBody
    public Map upload(@RequestParam("file")MultipartFile multipartFile, HttpSession session) throws Exception{
        //得到文件夹的目录
        String path = session.getServletContext().getRealPath("/images");
        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdirs();
        }
        String fileName = UUID.randomUUID().toString().replaceAll("-","")+multipartFile.getOriginalFilename();
        File newFile = new File(path+"\\"+fileName);
        multipartFile.transferTo(newFile);

        Map map = new HashMap();
        map.put("fileName",fileName);
        return map;  //为什么不能返回String??
    }

    @RequestMapping("insert")
    @ResponseBody
    public Map insert(College college) {

        iCollegeService.insert(college);
        Map map = new HashMap();
        map.put("msg","增加成功");

        return map;

    }



}
