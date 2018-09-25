<%--
  Created by IntelliJ IDEA.
  User: renrui
  Date: 2018/9/12 0012
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <title>添加设备</title>

    <%--<link href="/web/css/materialize.min.css" rel="stylesheet"/>--%>
    <link href="/web/css/jsq_home_new.css" rel="stylesheet"/>
    <link href="/web/css/weui.min.css" rel="stylesheet"/>

    <style>

        .pre-filter-image {
            width: 3rem;
            height: 7rem;
            left: 0;
            right: 0;
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            margin: 0 auto;
            align-items: center;
            display: flex;

        }

    </style>

</head>
<body>

<div style="margin-left:1rem; margin-top:1rem; width: 30%; height:8rem;border: 2px solid #57b8cf; border-radius: 0.5rem">
    <img src="/web/image/pre_filter_image.png" class="pre-filter-image">
    <div style="text-align: center; color: #18bbdb;">前置过滤器</div>
</div>

<%--<div class="jsqHomeNewBackground">--%>
<form name="添加设备" action="/web/wechat/registerGeneralDevice" method="post" onsubmit="return checkInput()">

    <div style="margin-top: 4rem">

        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd" style="font-weight: 600;"><label class="weui-label">产品名称</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" id="device_byname" name="deviceByName" type="text" placeholder="请输入产品名称" value="前置过滤器">
                </div>
            </div>

            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd" style="font-weight: 600;">
                    <label for="" class="weui-label">产品型号</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="selectModel" id="model_selected_name" style="display: block">
                        <option selected="" value="TJN-SF-DF35(尊享版)">TJN-SF-DF35(尊享版)</option>
                        <option value="TJN-SF-DF25(旗舰版)">TJN-SF-DF25(旗舰版)</option>
                        <option value="TJN-SF-DF25(尊享版)">TJN-SF-DF25(尊享版)</option>
                        <option value="TJN-SF-DF65(尊享版)">TJN-SF-DF65(尊享版)</option>
                        <option value="TJN-SF-DF65(自动版)">TJN-SF-DF65(自动版)</option>
                        <option value="TJN-SF-DF55(尊享版)">TJN-SF-DF55(尊享版)</option>
                        <option value="TJN-PF-AS15">TJN-PF-AS15</option>
                        <option value="TJN-PF-AS16">TJN-PF-AS16</option>
                    </select>
                </div>
            </div>

            <div class="weui-cell">
                <div class="weui-cell__hd" style="font-weight: 600;">
                    <label for="" class="weui-label">安装日期</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="installDate" type="date" id="install_date" value="">
                </div>
                <img src="/web/image/edit_icon.png" style="width: 1rem">
            </div>
        </div>
    </div>

    <input class="weui-btn weui-btn_primary" style="text-align: center; margin-top: 3rem; width: 60%"
           type="submit" id="submit_" value="提交"/>
</form>

</div>

<script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>
<script type="text/javascript">


    function checkInput() {
        var selectModel = $('#model_selected_name').val();
        var deviceByName = $('#device_byname').val();
        var installDate = $('#install_date').val();
        console.log("install date: " + installDate);
        if (installDate == "" || installDate == undefined) {
            weui.alert("请输入安装日期!")
            return false
        }
        return true;
    }

    function addGeneralDevice() {
        var selected_model = $('#model_selected_name').val();
        var device_byname = $('#device_byname').val();
        var install_date = $('#install_date').val();
        console.log("aaaaa==" + selected_model);
        console.log("bbbb==" + device_byname);
        console.log("cccc==" + install_date);
        window.location.href = "/web/wechat/registerGeneralDevice?" +
            "selectModel=" + selected_model +
            "&deviceByName=" + device_byname +
            "&installDate=" + install_date;
    }

</script>

</body>
</html>
