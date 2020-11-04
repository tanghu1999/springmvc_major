<%--
  Created by IntelliJ IDEA.
  User: tanghu1999
  Date: 2020/11/3
  Time: 17:06
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
        layui.use(['tree'],function(){
            var tree = layui.tree;
            //复选框被点击的回调
            var treeIns=tree.render({
                elem: '#tree1',
                data:[], // 数据源
                oncheck: function(obj){
                    console.log(obj.data); //得到当前点击的节点数据
                    console.log(obj.checked); //得到当前节点的展开状态：open、close、normal
                    console.log(obj.elem); //得到当前节点元素
                }
            });
            $.ajax({
                type:'post',
                url:'/dept/list',
                success:function(result){
                    treeIns.reload({
                        data:result
                    });
                },
                dataType:'json'
            });

        });



    </script>
</head>
<body>
    <div id="tree1"></div>



</body>
</html>
