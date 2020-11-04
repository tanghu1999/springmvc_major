<%--
  Created by IntelliJ IDEA.
  User: tanghu1999
  Date: 2020/10/23
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .main {
            width:1100px;
            margin:20px auto;
        }
        .layui-form-checkbox[lay-skin=primary] {
            margin-top: 5px !important;
        }

    </style>
    <link type="text/css" rel="stylesheet" href="/layui/css/layui.css" />
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.js"></script>

    <script type="text/javascript">
        layui.use(['layer','form','table','upload'],function(){
            var layer=layui.layer;
            var form = layui.form;
            var table = layui.table;
            var upload = layui.upload;

            var tabIns = table.render({
                elem:'#myTable', //设置原始table容器的选择器
                id:'myTable',
                url:'/major/findByPage', // 异步数据接口相关参数
                method:'post',
                page:true, // 开启分页
                limit:3, // 每页显示的条数
                limits:[3,4,5], // 每页条数的选择项
                even:true,  // 开启隔行背景
                cols:[[  // 设置表头，值是二位数组
                    {checkbox: true},
                    {field:'mid',title:'专业编号',width:177,sort:true,align:'center'},
                    {field:'mname',title:'专业名称',width:177,align:'center'},
                    {field:'lifeYear',title:'学制',width:177,align:'center'},
                    {field:'credit',title:'学分',width:177,sort:true,align:'center'},
                    {field:'cname',title:'学院名称',width:177,align:'center'},
                    //{field:'',title:'操作',width:177,templet:'#templetCollegeOperate'}
                    {field:'right',title:'操作',width:177,align:'center', toolbar: '#toolbar1'}
                ]]
            });
            //根据条件查询
            form.on('submit(conditionForm)',function(data){
                // console.log(data.elem); //被执行事件的元素DOM对象，一般为button对象
                // console.log(data.form); //被执行提交的form对象，一般在存在form表单时才会返回
                //console.log(data.field) //当前容器的全部表单字段，名值对应形式：{name:value}

                table.reload('myTable',{
                    method:'post',
                    //where:{cid:$('#cid').val(),mname:$('#mname').val(),minCredit:$('#minCredit').val(),maxCredit:$('#maxCredit').val()},
                    where:data.field,
                    //page:{curr:1} //重新从第一页开始
                });
                return false; //阻止表单跳转 如果需要表单跳转去掉这句话即可
            });

            //为所有的下拉框增加内容
            $.ajax({
                type:'post',
                url:'/college/findAll',
                success:function(result){
                    $.each(result.colleges,function(index,obj){
                        $('#cid').append(new Option(obj.cname,obj.cid)); //new Option(显示值,提交值)
                        $('#cidUp').append(new Option(obj.cname,obj.cid)); //new Option(显示值,提交值)
                        $('#cidAdd').append(new Option(obj.cname,obj.cid)); //new Option(显示值,提交值)
                    });
                    //增加之后刷新
                    form.render('select');
                },
                dataType:'json'
            });

            //添加学院信息
            //1.增加学院按钮
            $('#addCollege').click(function(){
                layer.open({
                    type:1,
                    title:'增加学院信息',
                    area:['700px','400px'],
                    content:$('#insertCollegeDiv')
                });
            });

            //2.上传文件
            // $('#ok').click(function(){
            //     var formData = new FormData();
            //     formData.append("cpic",$('#cpic')[0].files[0]); //对象.files[0]:获取第一个文件
            //     $.ajax({
            //         type:'post',
            //         url:'/college/upload',
            //         data:formData,
            //         success:function (result) {
            //             var img=$('<img />');
            //             $(img).prop('src','/images/'+result);
            //             $('#img').html($(img));
            //
            //         },
            //         cache:false,
            //         processData:false,
            //         contentType:false
            //     });
            //
            // });

            var uploadIns = upload.render({
                elem:'#upload',
                url:'/college/upload',
                done:function(result){
                    layer.msg(result.fileName);
                    var img= $('<img />');
                    $(img).attr({
                        'src':'images/'+result.fileName,
                        'width':'150px',
                        'height':'100px'
                    });
                    $('#imgP').append($(img));
                    $('#cpic').val(result.fileName);
                },
                error:function(){
                    alert('error');
                }

            });

            //3.提交
            form.on('submit(insertCollegeSubmit)',function(data){
                // console.log(data.elem); //被执行事件的元素DOM对象，一般为button对象
                // console.log(data.form); //被执行提交的form对象，一般在存在form表单时才会返回
                // console.log(data.field) //当前容器的全部表单字段，名值对应形式：{name:value}
                $.ajax({
                    type:'post',
                    url:'/college/insert',
                    data:'cname='+data.field.cname+'&caddress='+data.field.caddress+'&createtime='+data.field.createtime+'&cpic='+data.field.cpic,
                    success:function(result){
                        //清空表单中的数据
                        $('#insertCollegeForm')[0].reset();
                        $('#imgP').html('');
                        //关闭增加层
                        layer.closeAll();
                        //表格刷新
                        tabIns.reload();
                        //显示提示信息
                        layer.msg(result.msg);
                    },
                    dataType:'json'
                });
                return false; //false 阻止表单提交 默认不写true
            });
            //添加专业信息
            //1.增加专业按钮
            $('#addMajor').click(function(){
                layer.open({
                    type:1,
                    title:'增加专业信息',
                    area:['700px','500px'],
                    content:$('#insertMajorDiv')
                });
            });
            //2.增加专业提交按钮
            form.on('submit(insertMajorSubmit)',function(data){
                $.ajax({
                    type:'post',
                    url:'/major/insert',
                    data:data.field,
                    success:function(result){
                        //清空表单中的数据
                        $('#insertMajorForm')[0].reset();
                        //关闭增加层
                        layer.closeAll();
                        //表格刷新
                        tabIns.reload();
                        //显示提示信息
                        layer.msg(result.msg);
                    },
                    dataType:'json'
                });
                return false; //false 阻止表单提交 默认不写true
            });

            //修改、删除实现
            //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            table.on('tool(myTableFilter)',function(obj){
                //console.log(obj); //当前行
                var id=obj.data.mid; //获得当前行数据
                if(obj.event=='del'){ //删除按钮上的lay-event
                    layer.confirm('确认删除吗?',{title:'提示'},function(index){
                        //1.将id传到后台，后台删除这个编号
                        $.post('/major/delete?mid='+id,{},function(result){
                            if(result.code==0){
                                tabIns.reload();
                            }
                            layer.msg(result.msg);
                        },'json');
                        //关闭确认框
                        layer.close(index);
                    });
                }else{ //修改
                    $.post('/major/findById?mid='+id,{},function(result){
                        //为表单赋值
                        form.val('updateMajorForm',{
                            mid:result.mid,
                            mname:result.mname,
                            credit:result.credit,
                            lifeYear:result.lifeYear,
                            introduction:result.introduction,
                            cid:result.cid,
                        });
                    },'json');
                    //显示要修改的数据
                    layer.open({
                        type:1,
                        title:'修改员工信息',
                        area:['700px','500px'],
                        content:$('#updateMajorDiv')
                    });
                }

            });
            //完成数据的修改
            form.on('submit(updateMajorSubmit)',function(data){ //响应提交表单button
                $.ajax({
                    type:'post',
                    url:'/major/update',
                    data:$('#updateMajorForm').serialize(), //.serialize() 方法创建以标准 URL 编码表示的文本字符串
                    success:function(result){
                        layer.closeAll();
                        tabIns.reload();
                        layer.msg(result.msg);
                    },
                    dataType:'json'
                });
                return false; //阻止表单提交
            });

            //实现批量删除
            $('#delMany').click(function(){
                var ids=[];
                var checkStatus = table.checkStatus('myTable'); //获取表格选中行
                console.log(checkStatus);

                $.each(checkStatus.data,function(index,obj){
                    ids.push(obj.mid);
                });
                layer.confirm('确认删除吗?',{title:'提示'},function(index) {
                    $.ajax({
                        type: 'post',
                        url: '/major/deleteMany?ids=' + ids,
                        success: function (result) {
                            tabIns.reload();
                            layer.msg(result.msg);
                        },
                        dataType:'json'
                    });
                    //关闭提示框
                    layer.close(index);
                });

            });








        });



    </script>

    <script type="text/html" id="templetCollegeOperate">
        <a href="/major/delete?mid={{d.mid}}" class="del">删除</a>  <%-- 必须使用d.属性名 --%>
        <a href="/major/findById1?mid={{d.mid}}" >修改</a>
    </script>

    <!-- 表格的工具栏-->
    <script type="text/html" id="toolbar1">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>


</head>
<body>
    <div class="main">
        <form method="post" id="myForm" class="layui-form" >
            学院名称：
            <select name="cid" id="cid">
                <option value="-1">全部</option>
            </select>
            专业名称：<input type="text" name="mname" id="mname" value="${parameters.mname}" />
            学分：<input type="text" name="minCredit" id="minCredit" value="${parameters.minCredit}" />
            到 <input type="text" name="maxCredit" id="maxCredit" value="${parameters.maxCredit}" />
            <button type="button" class="layui-btn layui-btn-sm" lay-submit lay-filter="conditionForm" id="find">查找</button>
        </form>

        <button type="button" class="layui-btn layui-btn-warm" id="addCollege">添加学院信息</button>
        <button type="button" class="layui-btn" id="addMajor">添加专业信息</button><br /><br />

        <input type="button" class="layui-btn layui-btn-sm" id="delMany" value="删除选中" />

        <table id="myTable" class="layui-table" lay-filter="myTableFilter">

        </table>

    </div>
    <!-- insertCollegeForm begin -->
    <div id="insertCollegeDiv" style="display: none" >
        <form class="layui-form" id="insertCollegeForm"  style="margin: 20px 10px" >
            <div class="layui-form-item">
                <label class="layui-form-label">学院名称:</label>
                <div class="layui-input-block">
                    <input type="text" name="cname" required  lay-verify="required" placeholder="请输入学院名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学院地址:</label>
                <div class="layui-input-block">
                    <input type="text" name="caddress" required  lay-verify="required" placeholder="请输入学院地址" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">创办时间:</label>
                <div class="layui-input-block">
                    <input type="date" name="createtime" id="createtime" required  lay-verify="required" placeholder="请输入创办时间" autocomplete="off" class="layui-input">
                    <span id="createtimeSpan"></span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学院院徽:</label>
                <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-sm" id="upload">
                            <i class="layui-icon">&#xe67c;</i>上传图片
                        </button>
                    <p id="imgP"></p>
                    <input type="hidden" name="cpic" id="cpic" />

                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="insertCollegeSubmit">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    <!-- insertCollegeForm end -->

    <!-- insertMajorForm begin -->
    <div id="insertMajorDiv" style="display: none" >
        <form class="layui-form" id="insertMajorForm"  style="margin: 20px 10px" >
            <div class="layui-form-item">
                <label class="layui-form-label">专业名称:</label>
                <div class="layui-input-block">
                    <input type="text" name="mname" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学分:</label>
                <div class="layui-input-block">
                    <input type="text" name="credit" required  lay-verify="required" placeholder="请输入学分" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">毕业年限:</label>
                <div class="layui-input-block">
                    <input type="text" name="lifeYear" required  lay-verify="required" placeholder="请输入毕业年限" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">专业介绍:</label>
                <div class="layui-input-block">
                    <textarea name="introduction" cols="50" rows="5"  required  lay-verify="required" placeholder="请输入专业简介" autocomplete="off" ></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学院名称:</label>
                <div class="layui-input-block">
                    <select name="cid" id="cidAdd" required  lay-verify="required"  autocomplete="off" >

                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="insertMajorSubmit">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    <!-- insertMajorForm end -->

    <!-- updateMajorForm begin -->
    <div id="updateMajorDiv" style="display: none" >
        <form class="layui-form" id="updateMajorForm" lay-filter="updateMajorForm"  style="margin: 20px 10px" >
            <div class="layui-form-item">
                <label class="layui-form-label">专业编号:</label>
                <div class="layui-input-block">
                    <input type="text" name="mid" required readonly  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">专业名称:</label>
                <div class="layui-input-block">
                    <input type="text" name="mname" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学分:</label>
                <div class="layui-input-block">
                    <input type="text" name="credit" required  lay-verify="required" placeholder="请输入学分" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">毕业年限:</label>
                <div class="layui-input-block">
                    <input type="text" name="lifeYear" required  lay-verify="required" placeholder="请输入毕业年限" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">专业介绍:</label>
                <div class="layui-input-block">
                    <textarea name="introduction" cols="50" rows="5"  required  lay-verify="required" placeholder="请输入专业简介" autocomplete="off" ></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学院名称:</label>
                <div class="layui-input-block">
                    <select name="cid" id="cidUp" required  lay-verify="required"  autocomplete="off" >

                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updateMajorSubmit">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    <!-- updateMajorForm end -->



</body>

</html>
