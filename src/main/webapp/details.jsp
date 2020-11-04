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
            $('#back').click(function(){
                window.location.href='/major/findByPage?page='+${page};

            });
        });


    </script>

</head>
<body>
    <h2>专业简介</h2>
        <table width="600" border="1" style="text-align: center" >
            <tr>
                <td>专业名称:</td>
                <td>
                    <input type="text" name="mname" value="${byId.mname}" />
                </td>
            </tr>
            <tr>
                <td>学分：</td>
                <td><input type="text" name="credit" value="${byId.credit}" /></td>
            </tr>
            <tr>
                <td>毕业年限：</td>
                <td><input type="text" name="lifeYear" value="${byId.lifeYear}" /></td>
            </tr>
            <tr>
                <td>专业介绍：</td>
                <td>
                    <textarea rows="5" cols="50" name="introduction" >${byId.introduction}</textarea>
                </td>
            </tr>
            <tr>
                <td>学院名称:</td>
                <td>
                    <select name="cname">
                        <c:forEach items="${sessionScope.all}" var="type">
                            <option
                                    <c:if test="${type.cid==byId.cid}">
                                        selected="selected"
                                    </c:if>
                                    value="${type.cid}">${type.cname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="返回" id="back" />
                </td>
            </tr>
        </table>
</body>


</html>
