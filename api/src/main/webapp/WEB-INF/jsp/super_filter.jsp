<%--
  Created by IntelliJ IDEA.
  User: 18042425
  Date: 2018/10/4 0004
  Time: 11:43
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

    <title>特洁恩纯水机</title>

    <script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>

    <link rel="shortcut icon" href="/web/images/favicon.ico" type="image/x-icon"/>
    <link href="/web/css/weui.min.css" rel="stylesheet"/>
    <style type="text/css">
        html {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            font-size: 100px;
        }

        body {
            -webkit-touch-callout: none;
            font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB", "Microsoft YaHei", Arial, sans-serif;
            background-color: #fff;
            line-height: inherit;
            margin: 0;
            padding: 0;
            color: #444444;
            font-size: 0.24rem;
        }

        a {
            text-decoration: none;
        }

        ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        a,
        input, div {
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }

        .index_module_page {
            display: none;
        }

        .home_main {
            width: 7.20rem;
            height: 100%;
            min-height: 10rem;
            position: absolute;
            margin-left: -3.6rem;
            top: 0;
            left: 50%;
        }

        .home_content {
            width: 7.20rem;
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        .home_content_bg {
            width: 7.20rem;
            height: 100%;
            top: 0;
            left: 0;
            position: absolute;
            background: url("/web/tjn_imgs/home_bg.png") no-repeat;
            background-size: cover;
        }

        .home_filter_list {
            margin-top: 0.4rem;
        }

        .home_filter_content {
            width: 5.5rem;
            margin: 0 auto;
            margin-bottom: 0.5rem;
            overflow: hidden;
            display: none;
        }

        .home_filter_div {
            float: left;
        }

        .number_icon {
            width: 0.6rem;
            height: 0.6rem;
            background: url("/web/tjn_imgs/home_filter_circle_text.png") no-repeat;
            background-size: 0.6rem 0.6rem;
            background-color: #fff;
            border-radius: 0.3rem;
            line-height: 0.55rem;
            text-align: center;
            color: rgb(0, 99, 161);
            font-size: 0.24rem;
            z-index: 100;
        }

        .progress_bar {
            width: 4.5rem;
            height: 0.42rem;
            margin-left: -0.3rem;
            background-color: rgb(219, 219, 219);
            background-size: 4.5rem 0.42rem;
            border: 1px solid rgb(0, 99, 161);
            border-radius: 2.25rem;
        }

        .progress_bar_value {
            width: 50%;
            height: 0.3rem;
            border-top-right-radius: 0.1rem;
            border-bottom-right-radius: 0.1rem;
            margin-top: 0.06rem;
            margin-left: 0.06rem;
            background: url("/web/tjn_imgs/home_progressbar_blue_unselected.png") no-repeat;
            background-size: 4.35rem 0.3rem;
            overflow: hidden;
        }

        .filter_value {
            width: 0.5rem;
            height: 0.42rem;
            margin-left: 0.1rem;
            line-height: 0.42rem;
            text-align: center;
            color: #0567A3;
            font-size: 0.25rem;
        }

        .filter_next {
            width: 0.42rem;
            height: 0.43rem;
            background: url("/web/tjn_imgs/home_filter_next.png") no-repeat;
            background-size: 0.42rem 0.43rem;
        }

        .add_device_main {
            width: 7.20rem;
            height: 100%;
            min-height: 10rem;
            position: absolute;
            margin-left: -3.6rem;
            top: 0;
            left: 50%;
        }

        .add_device_content {
            width: 7.20rem;
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        .device_content_bg {
            width: 7.20rem;
            height: 100%;
            top: 0;
            left: 0;
            position: absolute;
            background: url("/web/tjn_imgs/shebeibroken_bg.png") no-repeat;
            background-size: cover;
        }

        .select_device_text {
            color: yellow;
            font-size: 0.28rem;
            margin-top: 1.4rem;
            text-align: center;
        }

        .js_btn {
            width: 3.7rem;
            height: 1.02rem;
            margin: 0 auto;
            margin-top: 5.2rem;
            line-height: 1.02rem;
            text-align: center;
            font-size: 0.35rem;
            color: #fff;
            background: url("/web/tjn_imgs/add_device_btn.png") no-repeat;
            background-size: 3.7rem 1.02rem;
        }

        .kj_btn {
            width: 3.7rem;
            height: 1.02rem;
            margin: 0 auto;
            margin-top: 6.4rem;
            line-height: 1.02rem;
            text-align: center;
            font-size: 0.35rem;
            color: #fff;
            background: url("/web/tjn_imgs/add_device_btn.png") no-repeat;
            background-size: 3.7rem 1.02rem;
        }

        .r_date {
            color: #f8f8f8;
            font-size: 2.5rem;
            font-weight: 700;
            font-family: "Arial";
        }

        .f_str {
            color: #f8f8f8;
            font-size: 0.15rem;
            font-weight: 700;
            line-height: 0px;
            margin-top: 0px;
        }

        .days_str {
            color: #f8f8f8;
            font-size: 0.3rem;
            top: -10px;
            font-family: "Arial";
        }

        .progress_zone {
            background-image: url('/web/image/pre_filter_bg.png');
            background-size: cover;
            position: fixed;
            width: 100%;
            height: 100%;
        }

        .progress-circle {
            position: fixed;
            right: 0;
            left: 0;
            height: 60%;
            display: flex;
            align-items: center
        }

        .progress-circle-bg {
            position: fixed;
            background: #0C99B4;
            height: 4.8rem;
            z-index: -1;
            width: 4.8rem;
            left: 0;
            right: 0;
            margin: 0 auto;
            border-radius: 2.4rem;
        }

        .myButton {
            width: 60%;
            background: #fff;
            border: 2px solid #57b8cf;
            color: #005b9e;
            font-size: 0.21rem;
            letter-spacing: 5px;
            border-radius: 1rem;
            font-weight: 600;
        }


    </style>


    <link rel="stylesheet" href="/web/css/main_1.css?v=1.3">
    <!-- 引入popup dailog css -->
    <link rel="stylesheet" href="/web/css/popup_dialog.css">

    <script>(function (doc, win) {
        var docEl = doc.documentElement, resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth) return;
                if (clientWidth > 560) {
                    clientWidth = 560;
                }
                docEl.style.fontSize = 100 * (clientWidth / 720) + 'px';
            };
        recalc();
        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        /* doc.addEventListener('DOMContentLoaded', recalc, false); */
    })(document, window);
    </script>
</head>
<body>

<div class="progress_zone">
    <div id="cz_page_1" style="height: 60%">

        <div class="circleChart progress-circle">
            <span class="progress-circle-bg"></span>
        </div>

    </div>

    <div class="home_filter_list">
        <div class="home_filter_content" id="home_filter_id_1" onclick="showFilterDetail('1')">
            <div class="home_filter_div number_icon">1<br>DAYS</div>
            <div class="home_filter_div progress_bar">
                <div class="progress_bar_value" id="filter-progress-1"></div>
            </div>
            <div class="home_filter_div filter_value" id="filter-surplus-1">50%</div>
        </div>

        <div class="home_filter_content" id="home_filter_id_2" onclick="showFilterDetail('2')">
            <div class="home_filter_div number_icon">2</div>
            <div class="home_filter_div progress_bar">
                <div class="progress_bar_value" id="filter-progress-2"></div>
            </div>
            <div class="home_filter_div filter_value" id="filter-surplus-2">50%</div>
        </div>

        <div class="home_filter_content" id="home_filter_id_3" onclick="showFilterDetail('3')">
            <div class="home_filter_div number_icon">3</div>
            <div class="home_filter_div progress_bar">
                <div class="progress_bar_value" id="filter-progress-3"></div>
            </div>
            <div class="home_filter_div filter_value" id="filter-surplus-3">50%</div>
        </div>

        <div class="home_filter_content" id="home_filter_id_4" onclick="showFilterDetail('4')">
            <div class="home_filter_div number_icon">4</div>
            <div class="home_filter_div progress_bar">
                <div class="progress_bar_value" id="filter-progress-4"></div>
            </div>
            <div class="home_filter_div filter_value" id="filter-surplus-4">50%</div>
        </div>

        <div class="home_filter_content" id="home_filter_id_5" onclick="showFilterDetail('5')">
            <div class="home_filter_div number_icon">5</div>
            <div class="home_filter_div progress_bar">
                <div class="progress_bar_value" id="filter-progress-5"></div>
            </div>
            <div class="home_filter_div filter_value" id="filter-surplus-5">50%</div>
        </div>
    </div>

    <div>
        <a href="javascript:;" class="weui-btn weui-btn_primary myButton" style="margin-top: 0.5rem"
           id="resetState" onclick="showResetDialog()">复位</a>
    </div>

</div>

<script src="/web/js/circleChart.min.js"></script>

<%--<script src="/web/js/popup_dialgo.js?v=1.3"></script>--%>
<script type="text/javascript">

    var consumeDay = 10;

    $(function () {
        init();
        initCircle(55)
    });

    function init() {
        for (var i = 0; i < 3; i++) {
            $("#home_filter_id_" + (i + 1)).show();
            $("#home_filter_id_" + (i + 1)).css("display", 'flex');
            $("#home_filter_id_" + (i + 1)).css("align-items", 'center');
        }
        $('#filter-progress-3').css('width', 100 + '%');
    }

    function initCircle(day) {
        $(".circleChart").circleChart({
            color: "#e6e6e6",
            backgroundColor: "#21eb00",
            size: 280,
            value: 45,
            startAngle: -25,
            text: 0,
            textSize: 50,
            onDraw: function (el, circle) {
                circle.text('<span class="r_date">' + day + '</span>'
                    + '<span class="days_str">Days</span>'
                    + "<br>" + "<span class=\"f_str\">滤网冲洗天数</span>");
            }
        });

        $(".circleChart").css('position', 'fixed');
        $(".circleChart_canvas").css('width', '5rem');
        $(".circleChart_canvas").css('height', '5rem');
        $(".circleChart_text").css('line-height', '2rem');
        $(".circleChart_text").css('top', '');

    }
</script>
</body>


</html>
