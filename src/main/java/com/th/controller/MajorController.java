package com.th.controller;

import com.github.pagehelper.PageInfo;
import com.mysql.fabric.xmlrpc.base.Params;
import com.th.entity.College;
import com.th.entity.Major;
import com.th.entity.Parameters;
import com.th.service.ICollegeService;
import com.th.service.IMajorService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("major")
public class MajorController {

    @Autowired
    private IMajorService iMajorService;
    @Autowired
    private ICollegeService iCollegeService;


    @RequestMapping("findByPage")
    @ResponseBody
    public Map findByPage(@RequestParam(value="page",required = false,defaultValue = "1") String page,
                          @RequestParam(value="limit",required = false,defaultValue = "3")Integer limit,
                          Parameters parameters, Model model, HttpSession session){
        PageInfo<Major> pageInfo = iMajorService.getPageInfo(page, limit, parameters);

       // List<College> all = iCollegeService.findAll();
       // session.setAttribute("all",all);

        Map map = new HashMap();
        map.put("code",0); //解析接口状态
        map.put("msg",""); //解析提示文本
        map.put("count",pageInfo.getTotal()); //解析数据长度
        map.put("data",pageInfo.getList()); // 解析数据列表

        model.addAttribute("parameters",parameters);

        return map;

    }

    @RequestMapping("insert")
    @ResponseBody
    public Map insert(Major major){
        iMajorService.insert(major);

        Map map = new HashMap();
        map.put("msg","增加成功");

        return map;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Map delete(String mid){
        iMajorService.delete(mid);

        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","删除成功");

        return map;
    }

    @RequestMapping("findById")
    @ResponseBody
    public Major findById(String mid){
        Major byId = iMajorService.findById(mid);
        return byId;
    }

    @RequestMapping("findById1")
    public String findById1(String mid,String page,Model model){
        Major byId1 = iMajorService.findById(mid);
        model.addAttribute("byId1", byId1);
        model.addAttribute("page",page);
        return "update";
    }

    @RequestMapping("update")
    @ResponseBody
    public Map update(Major major){
        iMajorService.update(major);
        Map map = new HashMap();
        map.put("msg","修改成功");

        return map;
    }

    @RequestMapping("deleteMany")
    @ResponseBody
    public Map deleteMany(int[] ids){
        iMajorService.deleteMany(ids);

        Map map = new HashMap();
        map.put("msg","删除成功");

        return map;
    }

    @RequestMapping("uploadOne")
    @ResponseBody
    public Map uploadOne(@RequestParam("file") MultipartFile multipartFile,HttpSession session) throws Exception{
        //得到文件夹所在位置
        String path = session.getServletContext().getRealPath("/images");
        File dir = new File(path);
        //判断文件夹是否存在
        if(!dir.exists()){
            dir.mkdirs();
        }
        //创建新的文件名
        String fileName = UUID.randomUUID().toString().replaceAll("-","")+multipartFile.getOriginalFilename();
        //在指定目录下创建新的文件
        File newFile = new File(path+"//"+fileName);
        //写入文件
        multipartFile.transferTo(newFile);

        Map map = new HashMap();
        map.put("msg","上传成功");
        map.put("fileName",fileName);

        return map;
    }

    @RequestMapping("uploadMultiple")
    @ResponseBody
    public Map uploadMultiple(HttpServletRequest request,HttpSession session) throws Exception{
        Map map = new HashMap();

        String path = session.getServletContext().getRealPath("/images");
        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdirs();
        }

        List<String> list = new ArrayList<String>();

        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(session.getServletContext());

        if(multipartResolver.isMultipart(request)){
            //转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // get the parameter names of the multipart files contained in this request
            Iterator<String> iter = multiRequest.getFileNames();
            while(iter.hasNext()){
                //取得上传文件
                List<MultipartFile> multipartFiles = multiRequest.getFiles(iter.next());

                for (MultipartFile multipartFile : multipartFiles) {
                    String originalFileName = UUID.randomUUID().toString().replaceAll("-","")+multipartFile.getOriginalFilename();
                    if(originalFileName!=null){
                        multipartFile.transferTo(new File(dir+"\\"+originalFileName));
                        list.add(dir+originalFileName);  //上传的文件的路径+文件名
                    }
                }
            }

        }
        map.put("code",0);
        map.put("data",list);

        return map;

    }





}
