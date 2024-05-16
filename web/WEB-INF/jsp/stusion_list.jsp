<%--
  Created by IntelliJ IDEA.
  User: hkw
  Date: 2018/10/31
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itheima.po.Stusion" %>
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
        <a href="/findStusion">小猪事件</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findStusion" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findStusion" >
            <input class="layui-input" placeholder="请输入小猪昵称" name="ss_name" id="ss_name">
            <input class="layui-input" placeholder="请输入编号" name="ss_id" id="ss_id">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addStusiontBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">输入编号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="ss_id"   class="layui-input" placeholder="请输入编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">小猪昵称：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="ss_name"  class="layui-input" placeholder="请输入小猪昵称">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">事件：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="ss_info"  class="layui-input" placeholder="请输入事件">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">结果：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="ss_result"  class="layui-input" placeholder="请输入结果">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">事件：</label>
                    <div class="layui-input-block">
                        <input type="datetime-local"  name="ss_time"  class="layui-input" placeholder="请输入时间">
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



    <%--编辑模态框--%>

    <div class="layui-row" id="updteDiv" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addUpdatForm" >
                <input value="${sessionScope.sid}" type="text"  name="ss_id" id="edit_id"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">编号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="ss_id" id="edit_stusionid"  value=""  class="layui-input" placeholder="请输入编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">小猪昵称：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="ss_name" id="edit_names"  value="" class="layui-input" placeholder="请输入小猪昵称">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="s_sex" id="edit_sex" value="雄" title="雄" checked="">
                        <input type="radio" name="s_sex" id="edit_sex" value="雌" title="雌">
                        <%--<input type="text" name="s_sex" class="layui-input" id="s_sex" placeholder="请输入性别">--%>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_age" class="layui-input" id="edit_age" value="" placeholder="请输入年龄">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">检疫编号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_phone" id="edit_phone" value="" class="layui-input" placeholder="请输入检疫编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">猪笼编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classid" id="edit_classids" value="" class="layui-input" placeholder="请输入猪笼编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">猪笼名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classname" id="edit_classname" value="" class="layui-input" placeholder="请输入猪笼名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">猪舍编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_dormitoryid"  id="edit_dormitoryids" value="" class="layui-input" placeholder="请输入猪舍编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="updateForm">更新</button>
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
            <th>小猪昵称</th>
            <th>事件</th>
            <th>处理结果</th>
            <th>时间</th>
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach items="${pi.list}" var="stusion">
        <tr>
            <%--<td>--%>
                <%--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>--%>
            <%--</td>--%>
            <td>${stusion.ss_id}</td>
            <td>${stusion.ss_name}</td>
            <td>${stusion.ss_info}</td>
            <td>${stusion.ss_result}</td>
<%--            <td>${stusion.ss_time}</td>--%>
             <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${stusion.ss_time}"/></td>

            <td>
                <a title="编辑"    id= "updateEdit"    href="/findStusionById?ss_id=${stusion.ss_id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'${stusion.ss_id}')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
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
                url: '/exportstusionlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'ss_id'
                        ,'ss_name'
                        ,'ss_info'
                        ,'ss_result'
                        ,'ss_time'

                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({ss_id: 'ID', ss_name: '小猪昵称', ss_info: '事件', ss_result: '结果', ss_time: '时间'});

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'B': 90,
                        'C': 80,
                        'F': 90
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '事件.xlsx', 'xlsx', {
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
                    setTimeout(function () {window.location.href='/findStusion';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addStusiontBtn").click(function () {
            layer.open({
                type:1,
                title:"添加事件",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                console.log(data.field)
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/addStusion',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                            layer.msg('添加成功', {icon: 1, time: 3000});
                            setTimeout(function () {window.location.href='/findStusion';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findStusion';},2000);
                    }
                });
                // return false;
            });
        });


    });



    /*删除*/
    function member_del(obj,ss_id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
           $.get("/deleteStusion",{"ss_id":ss_id},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                  setTimeout(function () {window.location.href='/findStusion';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:3000});
                    setTimeout(function () {window.location.href='/findStusion';},2000);
                }
            });
        });
    }

</script>


</body>


</html>
