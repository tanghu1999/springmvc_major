<%--
  Created by IntelliJ IDEA.
  User: tanghu1999
  Date: 2020/10/24
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.js"></script>
    <script type="text/javascript">
        $(function(){

            $('#ok').click(function(){
                var formData = new FormData();
                formData.append("cpic",$('#cpic')[0].files[0]); //对象.files[0]:获取第一个文件
                $.ajax({
                    type:'post',
                    url:'/college/upload',
                    data:formData,
                    success:function (result) {
                        var img=$('<img />');
                        $(img).prop('src','/images/'+result);
                        $('#tdPic').html($(img));

                    },
                    cache:false,
                    processData:false,
                    contentType:false
                });

            });

            $('#createtime').blur(function(){
                check();
            });


        });

        function check(){
            //对日期进行验证
            var regex=/\d{4}-\d{2}-\d{2}/;
            if(!regex.test($('#createtime').val())){
                $('#createtimeSpan').text('请输入正确的日期格式，如：2020-02-17').css('color','red');
                return false;
            }else{
                $('#createtimeSpan').text('');
            }
            return true;

        }


    </script>

</head>
<body>
    <h2>添加学院信息</h2>
    <form method="post"  onsubmit="return check()">
        <table width="600" border="1" style="text-align: center" >
            <tr>
                <td>学院名称:</td>
                <td colspan="2">
                    <input type="text" name="cname" id="cname" />
                </td>
            </tr>
            <tr>
                <td>学院地址：</td>
                <td colspan="2"><input type="text" name="caddress" /></td>
            </tr>
            <tr>
                <td>创办时间:</td>
                <td colspan="2">
                    <input type="text" name="createtime" id="createtime" />(YYYY-MM-DD)
                    <span id="createtimeSpan"></span>
                </td>
            </tr>
            <tr>
                <td>学院院徽:</td>
                <td>
                    <form action="#" method="post" enctype="multipart/form-data" id="uploadForm" >
                    <input type="file" name="cpic" id="cpic" /> <!-- <input type="file" /> 标签的value属性是只读的，不可修改-->
                    <input type="button" id="ok" value="确定" />
                    </form>
                </td>
                <td id="tdPic"></td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="submit" value="添加学院信息" lay-filter="insertCollegeForm" />
                    <input type="reset" value="重置" />
                </td>
            </tr>
        </table>
    </form>
</body>


</html>
