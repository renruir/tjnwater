<%--
  Created by IntelliJ IDEA.
  User: skyworth
  Date: 2016/12/12
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>咨询留言</title>
    <script type="text/javascript" src="/web/js/geo.js?v=1.0"></script>
    <link href="/web/css/jsq_home_new.css" rel="stylesheet"/>
    <meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">

    <style>

        p {
            font-size: 15px;
        }

        input {
            width: 100%;
            font-size: 15px;
        }

        input[type="text"], #btn1 {
            border-radius: 4px;
            border: 1px solid #c8cccf;
            color: #6a6f77;
            -web-kit-appearance: none;
            -moz-appearance: none;
            display: block;
            outline: 0;
            padding: 0 1em;
            text-decoration: none;
        }

        input[type="text"]:focus {
            border: 1px solid rgba(22, 155, 213, 1);
        }

        textarea {
            font-size: 15px;
            width: 100%;
            border-radius: 4px;
            border: 1px solid #c8cccf;
            color: #6a6f77;
            -web-kit-appearance: none;
            -moz-appearance: none;
            display: block;
            outline: 0;
            padding: 0 1em;
            text-decoration: none;
        }

        textarea:focus {
            border: 1px solid rgba(22, 155, 213, 1);
        }

        input::-webkit-input-placeholder {
            color: #6a6f77;
        }
    </style>
</head>
<body onload="setup();">
<form name="建议与投诉" action="/web/wechat/userdetail.html" method="post" onsubmit="return toVaild()">
    <input name="openid" value="${openid}" style="display:none"/>
    <select style="width:100%" name="sugtype" id="sugtype" onchange="type_change()">
        <option value="产品反馈">产品反馈</option>
        <option value="投诉建议">投诉建议</option>
    </select>

    <div id="product-list">
        <p class="">产品型号：</p>
        <select style="width:100%" name="protype" id="protype">
            <option value="CR400D1">CR400D1</option>
            <option value="X5">X5</option>
            <option value="CW-RO75G-10A">CW-RO75G-10A</option>
            <option value="CW-RO75G-12A">CW-RO75G-12A</option>
            <option value="CW-RO50G-2B">CW-RO50G-2B</option>
            <option value="CW-RO75G-106A">CW-RO75G-106A</option>
            <option value="CW-RO75G-108">CW-RO75G-108</option>
        </select>
    </div>


    <p>手机号码：</p>
    <input type="text" name="usertel" id="usertel"/>
    <p>真实姓名：</p>
    <input type="text" name="username" id="username"/>

    <p>省市县区：</p>
    <select class="item-select" name="s1" id="s1">
        <option></option>
    </select>
    <select class="item-select" name="s2" id="s2">
        <option></option>
    </select>
    <select class="item-select" name="s3" id="s3">
        <option></option>
    </select>

    <p>详细地址：</p>
    <input type="text" name="addrdetail" id="addrdetail"/>

    <p>详细内容：</p>
    <textarea rows=3 maxlength="100" name="sugdetail" id="sugdetail"></textarea>

    <p></p>
    <input style="text-align: center" type="submit" id="submit_" value="提交"/>
</form>

<script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script>

    function type_change() {
        var sugtype = $("#sugtype").val();
        if (sugtype == '投诉建议') {
            $("#product-list").hide();
        } else {
            $("#product-list").show();
        }
    }


    function toVaild() {

        var protype = $("#protype").val();
        if (protype == null || protype == "") {
            alert("请选择产品型号");
            return false;
        }

        var usertel = $("#usertel").val();
        if (usertel == null || usertel == "") {
            alert("请输入手机号码");
            return false;
        } else if (isNaN(usertel) || usertel.length != 11) {
            alert("请输入正确的手机号码");
            return false;
        }

        var username = $("#username").val();
        if (username == null || username == "") {
            alert("请输入您的真实姓名");
            return false;
        }
        var province = $("#s1").val();
        if (province == null || province == "" || province == "省份") {
            alert("请选择您所在的省份");
            return false;
        }
        var city = $("#s2").val();
        if (city == null || city == "" || city == "地级市") {
            alert("请选择您所在的城市");
            return false;
        }
        var area = $("#s3").val();
        if (area == null || area == "" || area == "市、县级市、县") {
            alert("请选择您所在的地区");
            return false;
        }
        var addrdetail = $("#addrdetail").val();
        if (addrdetail == null || addrdetail == "") {
            alert("请输入详细地址");
            return false;
        }
        var sugdetail = $("#sugdetail").val();
        if (sugdetail == null || sugdetail == "") {
            alert("这样啥也不说挺好的^^，感谢您对我们的支持");
            return false;
        }

        var address = sugtype + " " + protype + " 电话:" + usertel + " 姓名:" + username + " 地址:" + province + city + area + addrdetail + " 详细内容:" + sugdetail;
        return address;
    }

</script>
</body>
</html>
