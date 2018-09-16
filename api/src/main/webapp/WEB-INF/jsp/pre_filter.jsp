<%--
  Created by IntelliJ IDEA.
  User: 18042425
  Date: 2018/9/15 0015
  Time: 10:21
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

    <script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>

    <title>前置过滤器</title>

    <link href="/web/css/materialize.min.css" rel="stylesheet"/>
    <link href="/web/css/jsq_home_new.css" rel="stylesheet"/>
    <link href="/web/css/weui.min.css" rel="stylesheet"/>
    <link href="/web/css/main_1.css" rel="stylesheet"/>
    <link href="/web/css/normalize.css" rel="stylesheet"/>
    <link href="/web/css/normalize.css" rel="stylesheet"/>
    <%--<link href="/web/css/htmleaf-demo.css" rel="stylesheet"/>--%>
    <style type="text/css">

        .progress_zone {
            background-image: url('/web/image/general_bg_blue.png');
            background-size: cover;
            position: fixed;
            width: 100%;
            height: 60%;
        }

        .myButton {
            display: inline-block;
            position: relative;
            padding: 0.1rem 0.8rem 0.1rem 0.8rem;
            text-align: center;
            text-decoration: none;
            font-size: 0.25rem;
            color: #0077c1;
            background-color: #ffffff;
            /*box-shadow: 0px 0 10px #5a91c4;*/
            letter-spacing: 3px;
            border-radius: 10px !important;
            border-width: 2px;
            border-color: #0077c1;
        }

        .Chart_text {
            position: absolute;
            line-height: 250px;
            top: 0px;
            width: 100%;
            margin: 0px;
            padding: 0px;
            text-align: center;
            font-size: 10px;
            font-weight: normal;
            font-family: sans-serif;
        }

    </style>

</head>
<body style="margin: 0px; font-family: 'Microsoft YaHei'; font-weight: 500;">

<div id="cz_page_1" class="progress_zone">

    <div class="circleChart" id="0" style="margin-top: 1rem"></div>

</div>

<div style="position: fixed; bottom: 0.5rem; left: 0; right: 0; text-align: center">
    <div onclick="select_circle()">
        <input type="button" value="选择" class="waves-effect waves-green myButton">
    </div>

    <div style="margin-top: 0.2rem">
        <input type="button" value="复位" class="waves-effect waves-green myButton">
    </div>

</div>

<script src="/web/js/circleChart.min.js"></script>
<script type="text/javascript">

    var generalInfo = {
        "nickName": "${generalInfo.nick_name}",
        "reminderCircle": "${generalInfo.reminder_circle}",
        "lastResetDate": "${generalInfo.reset_date}"
    }

    var consumeDay = 0;

    $(function () {
        initCircle();
        console.log("nickname: " + generalInfo.nickName);
        console.log("install data: " + generalInfo.lastResetDate);
        console.log("reminder: " + dateMinus(generalInfo.lastResetDate));
        consumeDay = dateMinus(generalInfo.lastResetDate)
    });

    function initCircle() {
        $(".circleChart").circleChart({
            color: "#21eb00",
            backgroundColor: "#e6e6e6",
            size: 250,
            value: 50,
            startAngle: -25,
            text: 0,
            textSize: 50,
            onDraw: function (el, circle) {
                circle.text((generalInfo.reminderCircle - consumeDay) + "/" + generalInfo.reminderCircle);
                // circle.text(Math.round(circle.value));
            }
        });
    }

    function select_circle() {
        $(".circleChart_text").css('color', '#fff');
    }

    function dateMinus(sDate) {
        var sdate = new Date(sDate.replace(/-/g, "/"));
        var now = new Date();
        var days = now.getTime() - sdate.getTime();
        var day = parseInt(days / (1000 * 60 * 60 * 24));
        return day;
    }

</script>


</body>
</html>
