<%--
  Created by IntelliJ IDEA.
  User: 周训凯
  Date: 2019/5/14
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.itheima.po.VisitorTea" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style type="text/css">
        .layui-table{
            text-align: center;
        }
        .layui-table th{
            text-align: center;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findVisitorTea">访客信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findVisitorTea" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findVisitorTea" >
            <input class="layui-input" placeholder="请输入姓名" name="vt_name" id="vt_name">
            <input class="layui-input" placeholder="请输入金额" name="vt_dormbuilding" id="vt_dormbuilding">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
<%--            <input type="date" name="create_time" id="create_time" placeholder="请选择时间" class="layui-input">--%>
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addStudnetBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">

                <div class="layui-form-item">
                    <label class="layui-form-label">顾客姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="vt_name"  class="layui-input" placeholder="请输入顾客姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">顾客电话：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="vt_phone"  class="layui-input" placeholder="请输入顾客电话">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">购买只数：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vt_dormitoryid" class="layui-input" placeholder="请输入购买只数">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">实付金额：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vt_dormbuilding"  class="layui-input" placeholder="请输入实付金额">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <%--<th>--%>
            <%--<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>--%>
            <%--</th>--%>
            <th>ID</th>
            <%--<th>学号</th>--%>
            <th>顾客姓名</th>
            <%--<th>性别</th>--%>
            <%--<th>年龄</th>--%>
            <th>顾客电话</th>
            <th>购买只数</th>
            <th>实付金额</th>
            <th>购买时间</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="visitortea">
            <tr>
                <td>${visitortea.vt_id}</td>
                <td>${visitortea.vt_name}</td>
                <td>${visitortea.vt_phone}</td>
                <td>${visitortea.vt_dormitoryid}</td>
                <td>${visitortea.vt_dormbuilding}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${visitortea.create_time}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="" >
        <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${pi.totalCount}"/>
            <c:param name="currentPageNo" value="${pi.pageIndex}"/>
            <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'excel','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        form.on('submit(toolbarDemo)', function(){

            $.ajax({
                url: '/exportvisitortealist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'vt_id'
                        ,'vt_name'
                        ,'vt_phone'
                        ,'vt_dormitoryid'
                        ,'vt_dormbuilding'
                        ,'create_time'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({vt_id: 'ID', vt_name: '顾客姓名', vt_phone: '顾客电话', vt_dormitoryid: '购买只数', vt_dormbuilding: '实付金额', create_time: '购买时间'});

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'B': 80,
                        'C': 90,
                        'D': 100,
                        'E': 100,
                        'F': 160
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '访客数据.xlsx', 'xlsx', {
                        extend: {
                            '!cols': colConf
                        }
                    });
                    var timeend = Date.now();

                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 '+spent+' s');
                    //setTimeout(function () {window.location.href='/findAdmin';},2000);
                },

                error: function () {
                    //console.log(data);
                    setTimeout(function () {window.location.href='/findVisitorTea';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addStudnetBtn").click(function () {
            layer.open({
                type:1,
                title:"添加访客",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/addVisitorTea',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='/findVisitorTea';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findVisitorTea';},2000);
                    }
                });
                // return false;
            });
        });


    });
</script>


</body>


</html>
