<%--
  Created by IntelliJ IDEA.
  User: hkw
  Date: 2018/11/14
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>修改信息</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>

<body>


<div class="x-body">
    <form class="layui-form" action="/updateStusion" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.s.ss_id}" name="ss_id" id="ss_id"/>

        <div class="layui-form-item">
            <label for="ss_name" class="layui-form-label">
                <span class="f_sp">姓名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ss_name" name="s_name"
                       autocomplete="off" value="${sessionScope.s.ss_name}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="ss_info" class="layui-form-label">
                <span class="">*</span>事件
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ss_info" name="ss_info"
                       autocomplete="off" value="${sessionScope.s.ss_info}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="ss_result" class="layui-form-label">
                <span class="">*</span>结果
            </label>
            <div class="layui-input-inline">
                <input type="text" id="ss_result" name="ss_result"
                       autocomplete="off" value="${sessionScope.s.ss_result}" class="layui-input">
            </div>
        </div>

<%--        <div class="layui-form-item">--%>
<%--            <label for="ss_time" class="layui-form-label">--%>
<%--                <span class="">*</span>时间--%>
<%--            </label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="datetime-local" id="ss_time" name="ss_time"--%>
<%--                       autocomplete="off" value="${sessionScope.s.ss_time}" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>


        <div class="layui-form-item" id="btn_xg">
            <button  class="layui-btn"  id="btn_on" lay-filter="updateForm" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>

<script>
    // layui.use(['form','layer','laydate'], function(){
    //     var form = layui.form,
    //         $ = layui.jquery,
    //         laydate = layui.laydate;
    //     form.on('submit(updateForm)', function(obj,s_id) {
    //
    //         $.ajax({
    //             url: '/updateStudent',
    //             type: "post",
    //             data:{"s_id":s_id},
    //             success:function(data){
    //                 layer.msg('修改成功', {icon: 1, time: 3000});
    //                 setTimeout(function () {window.location.href='/findStudent';},2000);
    //
    //             },
    //             error:function(){
    //                 console.log($("#s_id").val());
    //                 layer.msg('修改失败',{icon:0,time:3000});
    //                 setTimeout(function () {window.location.href='/findStudent';},2000);
    //             }
    //         });
    //     })
    //
    // });

</script>
</body>
</html>
