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
    <h2>添加专业</h2>
    <form action="/major/insert" method="post" >
        <table width="600" border="1" style="text-align: center" >
            <tr>
                <td>专业名称:</td>
                <td>
                    <input type="text" name="mname" id="mname" />
                </td>
            </tr>
            <tr>
                <td>学分：</td>
                <td><input type="text" name="credit" /></td>
            </tr>
            <tr>
                <td>毕业年限：</td>
                <td><input type="text" name="lifeYear" /></td>
            </tr>
            <tr>
                <td>专业介绍：</td>
                <td>
                    <textarea rows="5" cols="50" name="introduction"></textarea>
                </td>
            </tr>
            <tr>
                <td>学院名称:</td>
                <td>
                    <select name="cid">
                        <c:forEach items="${sessionScope.all}" var="type">
                            <option value="${type.cid}">${type.cname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="添加专业" />
                    <input type="reset" value="重置" />
                </td>
            </tr>
        </table>
    </form>
</body>


</html>
