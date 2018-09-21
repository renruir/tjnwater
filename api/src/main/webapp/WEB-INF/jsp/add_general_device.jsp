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

    <meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">

    <title>添加设备</title>

    <link href="/web/css/materialize.min.css" rel="stylesheet"/>
    <link href="/web/css/jsq_home_new.css" rel="stylesheet"/>
    <link href="/web/css/weui.min.css" rel="stylesheet"/>

    <style>

        .pre-filter-image {
            width: 3rem;
            height: 7rem;
            left: 0;
            right: 0;
            margin: 0 auto;
            align-items: center;
            display: flex;
        }

    </style>

</head>
<body>

<div class="jsqHomeNewBackground">
    <div style="margin-left:1rem; margin-top:1rem; width: 30%; border: 2px solid #57b8cf;">
        <img src="/web/image/pre_filter_image.png" class="pre-filter-image">
    </div>


    <div class="weui-cells__title">选择设备型号</div>
    <div class="weui-cells">
        <div class="weui-cell weui-cell_select">
            <div class="weui-cell__bd">
                <select class="weui-select" name="select1" id="model_selected_name" style="display: block">
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
    </div>

    <div class="weui-cells__title">请给设备起一个名字</div>
    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <input class="weui-input" id="device_byname" type="text" placeholder="请输入设备名称，以便以后查看">
            </div>
        </div>
    </div>

    <div class="weui-cells__title">安装日期</div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input class="weui-input" id="install_date" type="date" value="">
        </div>
    </div>

    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips" onclick="addGeneralDevice()">确定</a>
    </div>
</div>


<script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript">

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
