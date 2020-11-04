<%--
  Created by IntelliJ IDEA.
  User: tanghu1999
  Date: 2020/11/4
  Time: 9:16
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
        layui.use('tree',function(){
            var tree = layui.tree;
            var treeIns = tree.render({
                elem:'#tree1',  //绑定元素
                data:[] //数据
            });
            $.ajax({
                type:'post',
                url:'/dept/list2',
                success:function(result){
                    fn(result); //对原始数据处理
                    treeIns.reload({
                       data: resultObj //将处理后的结果赋值的data
                    });
                },
                dataType:'json'
            });
            var resultObj=[];
            function fn(jsonData){  //取第一层数据
                for(var i=0;i<jsonData.length;i++) {
                    if (jsonData[i].pid == 0) {
                        resultObj.push(jsonData[i]);
                    }
                }

                getChildren(resultObj,jsonData); //第一个参数为：第一层数据，第二个参数为：所有数据

            }

            function getChildren(nodeList,jsonData){
                nodeList.forEach(function(element,index){
                    //forEach(element,index):第一个参数为：当前元素 第二个参数为：当前元素索引值
                    console.log(element)

                    //得到子元素
                   element.children=jsonData.filter(function(item,index){
                       /*
                       * filter() 方法创建一个新的数组，新数组中的元素是通过检查指定数组中符合条件的所有元素
                       *array.filter(function(currentValue,index,arr), thisValue)
                       * currentValue：必须。当前元素的值
                       * index：可选。当前元素的索引值
                       *arr：	可选。当前元素属于的数组对象
                       *
                       * thisValue：可选。对象作为该执行回调时使用，传递给函数，用作 "this" 的值。如果省略了 thisValue ，"this" 的值为 "undefined"
                       * */
                       return item.pid===element.id //所有子节点中的pid属性等于第一层数据中的id属性
                   })
                    if(element.children.length > 0){
                         getChildren(element.children,jsonData);
                     }

                })

            }


        });



    </script>
</head>
<body>
    <div id="tree1"></div>



</body>
</html>
