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
    <%--<link rel="stylesheet" href="/web/css/popup_dialog.css">--%>
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
            width: 75%;
            background: #fff;
            border: 2px solid #57b8cf;
            color: #005b9e;
            font-size: 0.25rem;
            letter-spacing: 5px;
            border-radius: 1rem;
        }

        .r_date {
            color: #e5f8fc;
            font-size: 0.8rem;
            font-weight: 800;
        }

        .s_date {
            color: #e5f8fc;
            font-size: 0.3rem;
            font-weight: 100;
            line-height: 0px;
        }

        .f_str {
            color: #e5f8fc;
            font-size: 0.2rem;
            font-weight: 100;
            line-height: 0px;
            margin-top: 0px;
        }

    </style>

</head>
<body style="margin: 0px; font-family: 'Microsoft YaHei'; font-weight: 500;">

<div id="cz_page_1" class="progress_zone">

    <div class="circleChart" id="0" style="margin-top: 0.8rem"></div>

</div>

<div style="position: fixed; bottom: 0.8rem; left: 0; right: 0; text-align: center">
    <div>
        <a href="javascript:;" class="weui-btn weui-btn_primary myButton" id="selectResetCircle">选择</a>
    </div>

    <div>
        <a href="javascript:;" class="weui-btn weui-btn_primary myButton" style="margin-top: 0.2rem"
           id="resetState" onclick="resetState()">复位</a>
    </div>

</div>

<div class="weui-skin_android" id="androidActionsheet" style="display: none">
    <div class="weui-mask"></div>
    <div class="weui-actionsheet">
        <div class="weui-actionsheet__menu">
            <div class="weui-actionsheet__cell">7天</div>
            <div class="weui-actionsheet__cell">15天</div>
            <div class="weui-actionsheet__cell">30天</div>
        </div>
    </div>
</div>

<script src="/web/js/circleChart.min.js"></script>
<script src="/web/js/popup_dialgo.js?v=1.3"></script>
<script src="https://res.wx.qq.com/open/libs/weuijs/1.1.1/weui.min.js" type="text/javascript"></script>
<script type="text/javascript">

    var generalInfo = {
        "nickName": "${generalInfo.nick_name}",
        "reminderCircle": "${generalInfo.reminder_circle}",
        "lastResetDate": "${generalInfo.reset_date}",
        "generalId": "${generalInfo.general_id}",
    }

    var consumeDay = 0.00001;
    var newReminderCircle;
    var surplus = generalInfo.reminderCircle - consumeDay;

    $(function () {
        console.log("generalInfo.lastResetDate: " + generalInfo.lastResetDate);
        consumeDay = dateMinus(generalInfo.lastResetDate);
        if(consumeDay == 0){
            consumeDay = 0.00001;
        }
        console.log("consumeDay: " + consumeDay);
        surplus = parseInt(generalInfo.reminderCircle - consumeDay);
        if (surplus >= 0) {
            initCircle(surplus);
        } else {
            initCircle(0);
        }
        $("p:first").css("line-height", "100px");
        $("p:first").css("top", "0.85rem");


        var $androidActionSheet = $('#androidActionsheet');
        var $androidMask = $androidActionSheet.find('.weui-mask');

        $("#selectResetCircle").on('click', function () {
            $androidActionSheet.fadeIn(200);
            $androidMask.on('click', function () {
                $androidActionSheet.fadeOut(200);
            });
            $('.weui-actionsheet__menu .weui-actionsheet__cell').on('click', function () {
                newReminderCircle = $(this).text();
                $.ajax({
                    type: "POST",
                    url: "/web/wechat/update_general_device_name",
                    data: {
                        reminderCircle: newReminderCircle,
                        name: generalInfo.nickName,
                        generalId: generalInfo.generalId,
                        resetDate: generalInfo.lastResetDate
                    },
                    success: function () {
                        setTimeout(refreshData(), 1000);
                    },
                    error: function () {
                        weui.alert('修改失败，请重试!');
                    }
                });
                $androidActionSheet.fadeOut(200);
            })
        });
    });

    function refreshData() {
        generalInfo.reminderCircle = parseInt(newReminderCircle);
        if (generalInfo.reminderCircle <= consumeDay) {
            initCircle(0);
        } else {
            initCircle(parseInt(generalInfo.reminderCircle - consumeDay));
        }
        if (parseInt(generalInfo.reminderCircle - consumeDay) <= 3) {
            $(".circleChart").circleChart({
                color: "#fe555c"
            });
        }
    }

    function initCircle(day) {
        $(".circleChart").circleChart({
            color: "#e6e6e6",
            backgroundColor: "#21eb00",
            size: 300,
            value: (consumeDay) / generalInfo.reminderCircle * 100,
            startAngle: -25,
            text: 0,
            textSize: 50,
            onDraw: function (el, circle) {
                circle.text('<span class="r_date">' + day + '</span>'
                    + '<span style="font-size: 0.6rem; color:#e5f8fc">' + '/' + '</span>'
                    + '<span class="s_date">' + generalInfo.reminderCircle + '</span>'
                    + "<br>" + "<span class=\"f_str\">滤网冲洗天数</span>");
            }
        });
    }

    function resetState() {
        console.log(111111);
        consumeDay = 0.000001;
        //
        $.ajax({
            type: "POST",
            url: "/web/wechat/update_general_device_name",
            data: {
                resetDate: new Date().toLocaleDateString(),
                reminderCircle: generalInfo.reminderCircle,
                name: generalInfo.nickName,
                generalId: generalInfo.generalId,
            },
            success: function () {
                initCircle(generalInfo.reminderCircle);
            },
            error: function () {
                weui.alert('修改失败，请重试!');
            }
        });
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
