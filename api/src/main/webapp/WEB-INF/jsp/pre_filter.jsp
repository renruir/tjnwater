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
            width: 60%;
            background: #fff;
            border: 2px solid #57b8cf;
            color: #005b9e;
            font-size: 0.2rem;
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
            font-size: 0.15rem;
            font-weight: 800;
            line-height: 0px;
            margin-top: 0px;
        }

    </style>

</head>
<body style="margin: 0px; font-family: 'Microsoft YaHei'; font-weight: 500;">

<div id="cz_page_1" class="progress_zone">

    <div class="circleChart"
         style="position: fixed; right: 0; left: 0;height: 60%;display: flex;align-items: center">
    </div>

</div>

<div style="position: fixed;height: 40%;bottom: -10%; left: 0; right: 0; text-align: center">
    <div>
        <a href="javascript:;" class="weui-btn weui-btn_primary myButton" id="selectResetCircle">选择</a>
    </div>

    <div>
        <a href="javascript:;" class="weui-btn weui-btn_primary myButton" style="margin-top: 0.2rem"
           id="resetState" onclick="showResetDialog()">复位</a>
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

<div class="js_dialog" id="reset-dialog" style="opacity: 1; display: none; ">
    <div class="weui-mask"></div>
    <div class="weui-dialog weui-skin_android">
        <div class="weui-dialog__bd">
            <span>选择复位以后，计时器将重新计时。为了计时准确，请您确认冲洗以后再选择复位。</span>
            <span><br><br>确认要复位操作吗？</span>
        </div>
        <div class="weui-dialog__ft">
            <a onclick="cancelDialog()" href="javascript:;"
               class="weui-dialog__btn weui-dialog__btn_default">取消</a>
            <a id="update-confirm" onclick="resetState()" href="javascript:;"
               class="weui-dialog__btn weui-dialog__btn_primary">确认</a>
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

    var consumeDay = 0;
    var newReminderCircle;
    var surplus = generalInfo.reminderCircle - consumeDay;

    $(function () {
        consumeDay = dateMinus(generalInfo.lastResetDate);
        surplus = parseInt(generalInfo.reminderCircle - consumeDay);
        initCircle(consumeDay);
        $("p:first").css("line-height", "100px");
        // $("p:first").css("top", "0.85rem");
        refreshData(generalInfo.reminderCircle);

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
                        setTimeout(refreshData(newReminderCircle), 1000);
                    },
                    error: function () {
                        weui.alert('修改失败，请重试!');
                    }
                });
                $androidActionSheet.fadeOut(200);
            })
        });
    });

    function refreshData(newCircle) {
        generalInfo.reminderCircle = parseInt(newCircle);
        initCircle(consumeDay);
        if (parseInt(generalInfo.reminderCircle - consumeDay) <= 3) {
            $(".circleChart").circleChart({
                color: "#fe555c"
            });
        }
        $(".circleChart").css('position', 'fixed');
        $(".circleChart_canvas").css('width', '2.8rem');
        $(".circleChart_canvas").css('height', '2.8rem');
        $("p:first").css('top', '');
    }

    function initCircle(day) {
        $(".circleChart").circleChart({
            color: "#e6e6e6",
            backgroundColor: "#21eb00",
            size: 280,
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

    function showResetDialog() {
        $("#reset-dialog").fadeIn(200);
    }

    function cancelDialog() {
        $("#reset-dialog").fadeOut(200);
    }

    function resetState() {
        $("#reset-dialog").fadeOut(200);
        generalInfo.resetDate = new Date().toLocaleDateString();
        $.ajax({
            type: "POST",
            url: "/web/wechat/update_general_device_name",
            data: {
                resetDate: generalInfo.resetDate,
                reminderCircle: generalInfo.reminderCircle,
                name: generalInfo.nickName,
                generalId: generalInfo.generalId,
            },
            success: function () {
                consumeDay = 0;
                initCircle(consumeDay);
                $(".circleChart").css('position', 'fixed');
                $("p:first").css('top', '');
                weui.alert('复位成功!');
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
