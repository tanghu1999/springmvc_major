<%--
  Created by IntelliJ IDEA.
  User: tanghu1999
  Date: 2020/10/28
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="/layui/css/layui.css" />
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.js"></script>
    <script type="text/javascript">
        layui.use('upload',function(){
            var upload = layui.upload;

            //实现文件上传
            var uploadInst = upload.render({
                elem:'#upload',  // 绑定按钮元素
                url:'/major/uploadOne', // 上传接口,默认传过去的参数名为：file
                done:function(result){ //上传完毕后回调
                    var img = $('<img />');
                    $(img).prop('src','images/'+result.fileName);
                    $('body').append($(img));

                }

            });



        });




    </script>


</head>
<body>
    <button type="button" class="layui-btn" id="upload">
        <i class="layui-icon">&#xe67c;</i>上传图片
    </button>

</body>
</html>
