<%--
  Created by IntelliJ IDEA.
  User: renrui
  Date: 2017/6/26
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <title>特洁恩智能净水器</title>

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

        .home_tds_content {
            /*width: 4.1rem;*/
            /*margin:0 auto;*/
            margin-left: 1.8rem;
            margin-top: 0.2rem;
            overflow: hidden;
        }

        .tds_div {
            float: left;
        }

        .tds_word {
            width: 1.15rem;
            font-size: 0.5rem;
            line-height: 0.6rem;
            margin-top: 0.4rem;
            /*font-size: 0.2rem;
            margin-top: 1.15rem;*/
            color: #7c8892;
        }

        .ppm_word {
            width: 0.5rem;
            font-size: 0.2rem;
            margin-top: 1.15rem;
            margin-left: 0.1rem;
            color: #7c8892;
        }

        .tds_value {
            min-width: 1.5rem;
            font-size: 1.25rem;
            text-align: center;
            color: #ace8f3;
        }

        .home_status_content {
            width: 3.41rem;
            margin: 0 auto;
            margin-top: -0.4rem;
            overflow: hidden;
        }

        .status_div {
            float: left;
        }

        .status_word {
            width: 0.92rem;
            font-size: 0.2rem;
            margin-top: 0.3rem;
            color: #7c8892;
        }

        .status_value {
            width: 0.67rem;
            font-size: 0.24rem;
            margin-top: 0.25rem;
            color: #ace8f3;
        }

        .status_line {
            width: 0.2rem;
            font-size: 0.28rem;
            margin-top: 0.2rem;
            color: #7c8892;
        }

        .ystds_word {
            width: 0.92rem;
            font-size: 0.2rem;
            margin-top: 0.3rem;
            color: #7c8892;
        }

        .ystds_value {
            width: 0.7rem;
            font-size: 0.40rem;
            color: #ace8f3;
            margin-top: 0.1rem;
        }

        .home_wash_btn {
            width: 3.08rem;
            height: 1.01rem;
            margin: 0 auto;
            margin-top: 0.82rem;
            color: #384a53;
            line-height: 1.01rem;
            text-align: center;
            font-size: 0.4rem;
            letter-spacing: 0.10rem;
            background: url("/web/tjn_imgs/home_wash_button.png") no-repeat;
            background-size: 3.08rem 1.01rem;
        }

        .home_line_show_content {
            width: 6.24rem;
            margin: 0 auto;
            margin-top: 0.32rem;
            overflow: hidden;
        }

        .line_show_div {
            float: left;
        }

        .left_line, .right_line {
            width: 1.52rem;
            height: 0.06rem;
            margin-top: 0.25rem;
            background: url("/web/tjn_imgs/home_line.png") no-repeat;
            background-size: 1.52rem 0.06rem;
        }

        .status_show_word {
            color: #8ca1a7;
            font-size: 0.24rem;
            width: 1.55rem;
            padding-left: 0.3rem;
            margin-top: 0.08rem;
        }

        .status_show_split {
            width: 0.2rem;
            font-size: 0.28rem;
            color: #8ca1a7;
        }

        .five_status_word {
            color: #8ca1a7;
            font-size: 0.24rem;
            width: 1.15rem;
            margin-top: 0.08rem;
        }

        .home_filter_list {
            margin-top: 0.4rem;
        }

        .home_filter_content {
            width: 5.85rem;
            margin: 0 auto;
            margin-bottom: 0.5rem;
            overflow: hidden;
            display: none;
        }

        .home_filter_div {
            float: left;
        }

        .number_icon {
            width: 0.46rem;
            height: 0.49rem;
            margin-top: -0.03rem;
            background: url("/web/tjn_imgs/home_number_unselected.png") no-repeat;
            background-size: 0.46rem 0.49rem;
            line-height: 0.55rem;
            text-align: center;
            color: #999999;
            font-size: 0.24rem;
        }

        .progress_bar {
            width: 3.92rem;
            height: 0.42rem;
            margin-left: 0.25rem;
            background: url("/web/tjn_imgs/home_progressbar_bg.png") no-repeat;
            background-size: 3.92rem 0.42rem;
        }

        .progress_bar_value {
            /*width: 3.8rem;*/
            /*width: 2.35rem;*/
            width: 50%;
            height: 0.3rem;
            border-top-right-radius: 0.1rem;
            border-bottom-right-radius: 0.1rem;
            margin-top: 0.06rem;
            margin-left: 0.06rem;
            background: url("/web/tjn_imgs/home_progressbar_blue_unselected.png") no-repeat;
            background-size: 3.8rem 0.3rem;
            overflow: hidden;
        }

        .filter_value {
            width: 0.8rem;
            height: 0.42rem;
            line-height: 0.42rem;
            text-align: center;
            color: #f0fdff;
            font-size: 0.2rem;
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

<!-- 主页 -->
<div class="home_main index_module_page" id="home_page_id">

    <div class="home_content">
        <div class="home_content_bg">
            <div class="home_tds_content">
                <div class="tds_div tds_word">纯水<br/>TDS</div>
                <div class="tds_div tds_value" id="TDS_value">--</div>
                <div class="tds_div ppm_word">PPM</div>
            </div>

            <div class="home_status_content">
                <div class="status_div status_word">设备状态</div>
                <div class="status_div status_value" id="current_state">未知</div>
                <div class="status_div status_line">|</div>
                <div class="status_div ystds_word">原水&nbsp;TDS</div>
                <div class="status_div ystds_value" id="source_TDS_value">--</div>
            </div>

            <div class="home_wash_btn" onclick="resineFilter();">滤芯冲洗</div>

            <div class="home_line_show_content">
                <div class="line_show_div left_line"></div>
                <div class="line_show_div status_show_word">滤芯状态显示</div>
                <div class="line_show_div status_show_split">|</div>
                <div class="line_show_div five_status_word" id="stat_num_id">5级状态</div>
                <div class="line_show_div right_line"></div>
            </div>

            <div class="home_filter_list">
                <div class="home_filter_content" id="home_filter_id_1" onclick="showFilterDetail('1')">
                    <div class="home_filter_div number_icon">1</div>
                    <div class="home_filter_div progress_bar">
                        <div class="progress_bar_value" id="filter-progress-1"></div>
                    </div>
                    <div class="home_filter_div filter_value" id="filter-surplus-1">50%</div>
                    <div class="line_show_div filter_next"></div>
                </div>

                <div class="home_filter_content" id="home_filter_id_2" onclick="showFilterDetail('2')">
                    <div class="home_filter_div number_icon">2</div>
                    <div class="home_filter_div progress_bar">
                        <div class="progress_bar_value" id="filter-progress-2"></div>
                    </div>
                    <div class="home_filter_div filter_value" id="filter-surplus-2">50%</div>
                    <div class="line_show_div filter_next"></div>
                </div>

                <div class="home_filter_content" id="home_filter_id_3" onclick="showFilterDetail('3')">
                    <div class="home_filter_div number_icon">3</div>
                    <div class="home_filter_div progress_bar">
                        <div class="progress_bar_value" id="filter-progress-3"></div>
                    </div>
                    <div class="home_filter_div filter_value" id="filter-surplus-3">50%</div>
                    <div class="line_show_div filter_next"></div>
                </div>

                <div class="home_filter_content" id="home_filter_id_4" onclick="showFilterDetail('4')">
                    <div class="home_filter_div number_icon">4</div>
                    <div class="home_filter_div progress_bar">
                        <div class="progress_bar_value" id="filter-progress-4"></div>
                    </div>
                    <div class="home_filter_div filter_value" id="filter-surplus-4">50%</div>
                    <div class="line_show_div filter_next"></div>
                </div>

                <div class="home_filter_content" id="home_filter_id_5" onclick="showFilterDetail('5')">
                    <div class="home_filter_div number_icon">5</div>
                    <div class="home_filter_div progress_bar">
                        <div class="progress_bar_value" id="filter-progress-5"></div>
                    </div>
                    <div class="home_filter_div filter_value" id="filter-surplus-5">50%</div>
                    <div class="line_show_div filter_next"></div>
                </div>

                <div class="home_filter_content" id="home_filter_id_6" onclick="showFilterDetail('6')" >
                    <div class="home_filter_div number_icon">5</div>
                    <div class="home_filter_div progress_bar">
                        <div class="progress_bar_value" id="filter-progress-6"></div>
                    </div>
                    <div class="home_filter_div filter_value" id="filter-surplus-6">50%</div>
                    <div class="line_show_div filter_next"></div>
                </div>
            </div>

        </div>
    </div>

</div>

<!-- 设备故障 -->
<div class="add_device_main index_module_page" id="error_page_id">

    <div class="add_device_content">
        <div class="device_content_bg">

            <div class="select_device_text" id="fault_detail_text">设 备 缺 水</div>

            <%--<div class="js_btn">咨询在线客服</div>--%>

            <div class="kj_btn" onclick="callAfterSalesTel()">拨打售后热线</div>

        </div>

    </div>
</div>


<!-- 重置滤芯 -->
<div class="index_main index_module_page" id="cz_page_1">
    <div class="main_content">
        <div class="content_main" id="content_main_1">
            <img class="round" id="round_1" src="/web/image/icon_blue_progressbar_bg.png"/>
            <canvas class="canvas" id="canvas_1"></canvas>
            <img class="drop" src="/web/image/icon_blue_big_water%20drop.png">
            <label class="percent_label" id="percent_label_1">0%</label>
            <label class="label1" id="label_1"></label>
            <img class="icon_white1" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line1" id="func_1"></div>
            <img class="icon_white2" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line2" id="use_duration_1"></div>
            <div class="div_bottom" id="div_bottom_1_1">购买滤芯</div>
            <div class="div_bottom" id="div_bottom_1">重置滤芯</div>
        </div>
    </div>
</div>
<div class="index_main index_module_page" id="cz_page_2">
    <div class="main_content">
        <div class="content_main" id="content_main_2">
            <img class="round" id="round_2" src="/web/image/icon_deep%20blue_progressbar_bg.png"/>
            <canvas class="canvas" id="canvas_2"></canvas>
            <img class="drop" src="/web/image/icon_deep%20blue_big_water%20drop.png">
            <label class="percent_label" id="percent_label_2">0%</label>
            <label class="label1" id="label_2"></label>
            <img class="icon_white1" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line1" id="func_2"></div>
            <img class="icon_white2" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line2" id="use_duration_2"></div>
            <div class="div_bottom" id="div_bottom_2_2">购买滤芯</div>
            <div class="div_bottom" id="div_bottom_2">重置滤芯</div>
        </div>
    </div>
</div>

<%--<div class="index_main index_module_page" id="cz_page_3">--%>
<%--<div class="main_content">--%>
<%--<div class="content_main" id="content_main_3">--%>
<%--<img class="round" id="round_3" src="/web/image/icon_green_progressbar_bg.png"/>--%>
<%--<canvas class="canvas" id="canvas_3"></canvas>--%>
<%--<img class="drop" src="/web/image/icon_green_big_water%20drop.png">--%>
<%--<label class="percent_label" id="percent_label_3">0%</label>--%>
<%--<label class="label1"  id="label_3">后置PP棉</label>--%>
<%--<img class="icon_white1" src="/web/image/icon_white_small_water%20drop.png">--%>
<%--<div class="line1">进一步过滤，滤除原水中泥沙、铁锈、悬浮物等</div>--%>
<%--<img class="icon_white2" src="/web/image/icon_white_small_water%20drop.png">--%>
<%--<div class="line2">根据使用水量，一般为6-12个月</div>--%>
<%--<div class="div_bottom" id="div_bottom_3_3">购买滤芯</div>--%>
<%--<div class="div_bottom" id="div_bottom_3">重置滤芯</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<div class="index_main index_module_page" id="cz_page_3">
    <div class="main_content">
        <div class="content_main" id="content_main_3">
            <img class="round" id="round_3" src="/web/image/icon_green_progressbar_bg.png"/>
            <canvas class="canvas" id="canvas_3"></canvas>
            <img class="drop" src="/web/image/icon_green_big_water%20drop.png">
            <label class="percent_label" id="percent_label_3">0%</label>
            <label class="label1" id="label_3"></label>
            <img class="icon_white1" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line1" id="func_3"></div>
            <img class="icon_white2" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line2" id="use_duration_3"></div>
            <div class="div_bottom" id="div_bottom_3_3">购买滤芯</div>
            <div class="div_bottom" id="div_bottom_3">重置滤芯</div>
        </div>
    </div>
</div>

<%--<div class="index_main index_module_page" id="cz_page_4">--%>
<%--<div class="main_content">--%>
<%--<div class="content_main" id="content_main_4">--%>
<%--<img class="round" id="round_4" src="/web/image/icon_yellow_progressbar_bg.png"/>--%>
<%--<canvas class="canvas" id="canvas_4"></canvas>--%>
<%--<img class="drop" src="/web/image/icon_yellow_big_water%20drop.png">--%>
<%--<label class="percent_label" id="percent_label_4">0%</label>--%>
<%--<label class="label1"  id="label_4">RO反渗透</label>--%>
<%--<img class="icon_white1" src="/web/image/icon_white_small_water%20drop.png">--%>
<%--<div class="line1">过滤精度为0.0001微米，过滤水中重金属、抗生素、残留农药和水垢</div>--%>
<%--<img class="icon_white2" src="/web/image/icon_white_small_water%20drop.png">--%>
<%--<div class="line2">根据使用水量，一般为18-24个月</div>--%>
<%--<div class="div_bottom" id="div_bottom_4_4">购买滤芯</div>--%>
<%--<div class="div_bottom" id="div_bottom_4">重置滤芯</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<div class="index_main index_module_page" id="cz_page_4">
    <div class="main_content">
        <div class="content_main" id="content_main_4">
            <img class="round" id="round_4" src="/web/image/icon_yellow_progressbar_bg.png"/>
            <canvas class="canvas" id="canvas_4"></canvas>
            <img class="drop" src="/web/image/icon_yellow_big_water%20drop.png">
            <label class="percent_label" id="percent_label_4">0%</label>
            <label class="label1" id="label_4"></label>
            <img class="icon_white1" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line1" id="func_4"></div>
            <img class="icon_white2" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line2" id="use_duration_4"></div>
            <div class="div_bottom" id="div_bottom_4_4">购买滤芯</div>
            <div class="div_bottom" id="div_bottom_4">重置滤芯</div>
        </div>
    </div>
</div>


<div class="index_main index_module_page" id="cz_page_5">
    <div class="main_content">
        <div class="content_main" id="content_main_5">
            <img class="round" id="round_5" src="/web/image/icon_purple_progressbar_bg.png"/>
            <canvas class="canvas" id="canvas_5"></canvas>
            <img class="drop" src="/web/image/icon_purple_big_water%20drop.png">
            <label class="percent_label" id="percent_label_5">0%</label>
            <label class="label1" id="label_5"></label>
            <img class="icon_white1" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line1" id="func_5"></div>
            <img class="icon_white2" src="/web/image/icon_white_small_water%20drop.png">
            <div class="line2" id="use_duration_5"></div>
            <div class="div_bottom" id="div_bottom_5_5">购买滤芯</div>
            <div class="div_bottom" id="div_bottom_5">重置滤芯</div>
        </div>
    </div>
</div>

<div class="index_main index_module_page" id="cz_page_6">
    <div class="main_content">
        <div class="content_main" id="content_main_6">
            <img class="round" id="round_6" src="/web/image/icon_purple_progressbar_bg.png"/>
            <canvas class="canvas" id="canvas_6"></canvas>
            <img class="drop" src="/web/image/icon_purple_big_water%20drop.png">
            <label class="percent_label" id="percent_label_6">0%</label>
            <label class="label1" id="label_6"></label>
            <img class="icon_white1" src="/web/image/icon_white_small_water%20drop.png">
            <div class="last_line_w" id="func_6"></div>
            <img src="/web/image/icon_white_small_water%20drop.png">
            <div class="last_line_w" id="use_duration_6"></div>
            <div class="div_bottom" id="div_bottom_6_6">购买滤芯</div>
            <div class="div_bottom" id="div_bottom_6">重置滤芯</div>
        </div>
    </div>
</div>


<%--<div id="main-page" style="width: 100%; height: 100%; display: none;">
    &lt;%&ndash;<div class="swiper-wrapper">&ndash;%&gt;
    <div id="normal-page" class="jsqHomeNewBackground">
        <div class="tdsStateArea">
            <div style="position:fixed; font-size: 1rem; font-weight:400;top: 3rem; right: 1.5rem; color: #0077c1;">
                <span id="current_state" style="font-weight: 600">未知</span><br><span>TDS</span>
            </div>
            <div class="tdsValue">
                <span id="TDS_value" style="font-size: 5.5rem;">--</span>
            </div>
            <div style="position: relative; top: -2.2rem; font-size: 0.6rem; font-weight: 500; color: #8fb8ed">
                <span>原水TDS:</span>
                <span id="source_TDS_value" style="color: #4f9be2; font-size: 1rem; font-weight: 600">---</span>
                <span id="water-temperature">
                    <span>/</span>
                    <span>水温：</span>
                    <span id="source_water_temperature"
                          style="color: #4f9be2;font-size: 1rem; font-weight: 600">---</span>
                    </span>
            </div>
        </div>

        <div class="valign-wrapper"
             style="width: 100%; height: 100%;margin-top: 0.5rem; justify-content: center; text-align: center;"
             onclick="resineFilter()">
            <input type="button" value="滤芯冲洗" class="waves-effect waves-green myNewButton">
        </div>

        <div style="position: relative; font-size: 0.6rem; z-index: 3;">
            <a style="margin: 0 0.5rem; color: #ffffff;">滤芯状态(剩余百分比) :</a>
        </div>
        <div id="filter-div">
        </div>

        <div id="wave" style="position: fixed; top: 1.5rem"></div>

        <div class="device-info-text">
            <div>型号：<span id="device_model">-----</span></div>
            <div style="margin-left: 1rem">序列号：<span id="device_squm">--------</span></div>
        </div>
    </div>

</div>

<div id="filter-detail-page" class="jsqHomeBackground" style="position: relative; display: none">
    <div style="position: relative; width:100%; height: 100%">
        <div class="filter_detail_page_bg">
            <img src="../images/filter_detail_bg.png" style="width: 100%;">
            <div id="back_home_icon" class="valign-wrapper back_home_icon"
                 onclick="close_filter_detail_page()">
                <img src="../images/back_home.png" alt="返回" style="width: 1rem;" href="javascript:;">
                <span style="margin-left: 4px">首页</span>
            </div>
            <div style="width: 100%; text-align: center; position: fixed; top: 1.5rem;">
                <div id="indicatorContainerWrap"
                     style="display: flex; width: 100%; position: relative;text-align: center; margin: 0 auto">
                    <div id="indicatorContainer" style="margin: 0 auto; text-align: center; z-index: 10"></div>
                    <div class="loading wave" id="filter_detail_wave"
                         style="text-align: center; margin: 0 auto;  width: 200px; height: 200px; overflow: hidden; border-radius: 50%; top: 0.5rem">
                        <span id="filter_type"
                              style="font-size: 0.6rem; font-family: 'Microsoft YaHei'; font-weight: 500; color: #2271c9;">PP棉滤芯</span>
                    </div>
                </div>
            </div>
        </div>

        <div style="position: relative; width: 100%; text-align: center; padding: 0.1rem 1.5rem 0.5rem 1.5rem;">
            <img src="../images/filter_detail_icon.png" style="left: 0px; margin-top: 2px; float: left; width: 0.9rem;">
            <div id="filter_detail_description" class="filter-detail-description-text">

            </div>
        </div>

        <div style="position: relative; width: 100%; text-align: center; padding: 0 1.5rem;">
            <img src="../images/filter_detail_icon.png" style="left: 0px; margin-top: 2px; float: left; width: 0.9rem">
            <div id="filter_life" class="filter-detail-description-text"></div>
        </div>

        <div id="reset_filter_btn" style="position: fixed; width: 100%; bottom: 4.5rem; text-align: center">
            <a href="javascript:;" class="waves-effect waves-green myNewButton basicBtn" onclick="resetFilter()"
               style="background: #3c9cfe; color: #ffffff;padding: 0.2rem 3rem 0.2rem;">重置滤芯</a>
        </div>

        <div id="buy_filter_btn" style="position: fixed; width: 100%; bottom: 1rem; text-align: center">
            <a href="javascript:;" class="waves-effect waves-green myNewButton basicBtn"
               style="background: #ffffff; color: #3c9cfe;padding: 0.2rem 3rem 0.2rem;">购买滤芯</a>
        </div>

    </div>

</div>


<div id="error-page" class="jsqHomeBackground" style="position: relative; display: none;">
    <div style="position: relative; width: 100%; height: 100%;">
        <div style="position: relative; width: 100%; margin: auto;text-align: center;">
            <img src="/web/images/error_image.png" style="width: 100%;">
            <div style="position: fixed; top: 1rem; text-align: center; width: 100%;">
                <span style="display: inline-block; vertical-align: middle"></span>
                <img src="/web/images/device_error_icon.png" alt="故障图片" style="vertical-align: middle; width: 1.2rem">
                <span style="vertical-align: middle">设备故障</span>
                <div style="text-align: center;position: relative; margin-top: -0.4rem">
                    <span id="fault_detail_text"
                          style="text-align: center; font-size: 0.7rem; letter-spacing: 1px; color: #5a91c4; font-family: 'Microsoft YaHei UI'">电磁阀K1故障</span>
                </div>
            </div>
        </div>

        <div style="position: fixed; width: 100%; bottom: 6rem; text-align: center">
            <a href="javascript:;" class="waves-effect waves-green myNewButton basicBtn"
               style="background: #3c9cfe; color: #ffffff;">咨询在线客服</a>
        </div>

        <div style="position: fixed; width: 100%; bottom: 2rem; text-align: center">
            <a href="javascript:;" class="waves-effect waves-green myNewButton basicBtn"
               onclick="callAfterSalesTel()">拨打售后热线</a>
        </div>
    </div>
</div>

<div id="filter_reset_dialog" class="weui-mask" style="display: none;">
    <div class="basic-dialog">
        <div class="basic-dialog-title-bg">
            <div class="basic-dialog-title">
                <span id="filter_reset_dialog_title" class="basic-dialog-title-text">滤芯复位</span>
            </div>
        </div>
        <div class="basic-dialog-content" id="reset_filter_dialog_content"
             style="display: inherit; margin: 0.5rem 1.4rem; text-align: left; font-size: 0.75rem;">
            <span id="resetfilter_content_text"></span>
        </div>
        <div style="display: flex; width: 100%; margin-bottom: 0.5rem" id="reset_before_btn">
            <div class="valign-wrapper" style="text-align: center; margin: 0 auto">
                <a class="waves-effect waves-green basic-dialog-btn reset-filter-dialog-btn"
                   style="background:#ffffff; color:#3c9cfe; margin: 0 -2.5rem 0 0;"
                   onclick="close_filter_dialog()" id="resetDialogBtnCancel">取消
                </a>
            </div>
            <div class="valign-wrapper" style="text-align: center; margin: 0 auto">
                <a class="waves-effect waves-green basic-dialog-btn reset-filter-dialog-btn"
                   onclick="startResetFilter()" id="resetDialogBtnConfirm">确定
                </a>
            </div>
        </div>

        <div class="valign-wrapper" id="reset_after_btn" style="display: none; margin-top: 1.5rem">
            <a class="waves-effect waves-green basic-dialog-btn"
               style="margin: -1rem auto 0;" id="filter_result_btn">请稍后</a>
        </div>


    </div>
</div>

<div id="loadingToast" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-toast">
        <i class="weui-loading weui-icon_toast"></i>
        <p class="weui-toast__content" id="update-text">固件升级中……</p>
    </div>
</div>--%>


<script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="/web/js/mqttws31.js" type="text/javascript"></script>
<script src="/web/js/protocol-parse.js?v=1.2" type="text/javascript"></script>
<script src="/web/js/filterfunction.js?v=1.1" type="text/javascript"></script>
<script src="/web/js/swiper-3.4.1.min.js" type="text/javascript"></script>
<script src="/web/js/echarts.min.js" type="text/javascript"></script>
<%--<script src="/web/js/waveEffect.js" type="text/javascript"></script>--%>
<script src="/web/js/materialize.min.js" type="text/javascript"></script>
<script src="/web/js/radialIndicator.js" type="text/javascript"></script>
<script src="https://res.wx.qq.com/open/libs/weuijs/1.1.1/weui.min.js" type="text/javascript"></script>

<script src="/web/js/arc_progress.js"></script>
<script src="/web/js/popup_dialgo.js?v=1.3"></script>
<script type="text/javascript">

    var deviceId = "${wxBindInfo.deviceId}";
    var openid = "${wxBindInfo.openid}";
    var host = "${serverInfo.host}";
    var port = "${serverInfo.port}";
    var deviceType = "${wxBindInfo.deviceType}";
    var model = "${deviceInfo.model}";
    var sn = "${deviceInfo.seqNum}";
    var hardwareVersion = "${deviceInfo.version}";
    var perunused = [0, 0, 0, 0, 0, 0];

    var filterInfo = new Array();

    <c:forEach items="${filterInfo}" var="FilterInfo">
    var filter = {
        grade: "${FilterInfo.getGrade()}",
        name: "${FilterInfo.getFilter_name()}",
        life: "${FilterInfo.getFilter_life()}",
        detail: "${FilterInfo.getFilter_detail()}",
        other: "${FilterInfo.getOther()}",
    }
    filterInfo.push(filter);
    </c:forEach>

    var updateVersionInfo = {
        "version": "${updateDeviceInfo.version}",
        "pkgSize": "${updateDeviceInfo.pkgSize}",
        "md5": "${updateDeviceInfo.md5}",
        "downloadUrl": "${updateDeviceInfo.downloadUrl}"
    };

    $(window).on('hashchange', function () {
        var action = getHashString("action");
        myController(action);
    });

    var dianIntervalId = null;
    var dianCount = 1;


    $(function () {
        console.log("start");

        for (var i = 0; i < filterInfo.length; i++) {
            console.log("info: " + filterInfo[i].life);
        }

        $("#home_page_id").show();
        //$("#main-page").show();
        //wave_new.start();
        viewInit();
        if (deviceId == null || deviceId == "" || openid == null || openid == "") {
            weui.alert("您还没有绑定净水器设备！");
        } else {
            mqttInit(host, port, openid);
        }


        var action = getHashString("action");
        myController(action);
    });

    function cx_callback() {
        startResetFilter();
    }

    function myController(action) {
        $(".index_module_page").hide();
        $.MsgBox.Remove();
        switch (action) {
            case "lx_1":
                $("#label_1").html(filterInfo[0].name);
                $("#func_1").html(filterInfo[0].detail);
                $("#use_duration_1").html(filterInfo[0].life);
                $("#cz_page_1").show();
                var index = getHashString("index");
                filterIndex = index - 1;
                var degree = perunused[filterIndex];
                drawProgress("canvas_" + index, degree);
                $("#div_bottom_" + index).off("click");
                $("#div_bottom_" + index).on("click", function () {
                    var title = $("#label_" + index).html();
                    $.MsgBox.Confirm(title, cx_callback);
                });

                $("#div_bottom_" + index + "_" + index).off("click");
                $("#div_bottom_" + index + "_" + index).on("click", function () {
                    window.location.href = "https://item.jd.com/12186293491.html#crumb-wrap";
                });
                break;
            case "lx_2":
                $("#label_2").html(filterInfo[1].name);
                $("#func_2").html(filterInfo[1].detail);
                $("#use_duration_2").html(filterInfo[1].life);
                $("#cz_page_2").show();
                var index = getHashString("index");
                filterIndex = index - 1;
                var degree = perunused[filterIndex];
                drawProgress("canvas_" + index, degree);
                $("#div_bottom_" + index).off("click");
                $("#div_bottom_" + index).on("click", function () {
                    var title = $("#label_" + index).html();
                    $.MsgBox.Confirm(title, cx_callback);
                });

                $("#div_bottom_" + index + "_" + index).off("click");
                $("#div_bottom_" + index + "_" + index).on("click", function () {
                    window.location.href = "https://item.jd.com/12186293493.html#crumb-wrap";
                });
                break;
            case "lx_3":
                $("#label_3").html(filterInfo[2].name);
                $("#func_3").html(filterInfo[2].detail);
                $("#use_duration_3").html(filterInfo[2].life);
                $("#cz_page_3").show();
                var index = getHashString("index");
                filterIndex = index - 1;
                var degree = perunused[filterIndex];
                drawProgress("canvas_" + index, degree);
                $("#div_bottom_" + index).off("click");
                $("#div_bottom_" + index).on("click", function () {
                    var title = $("#label_" + index).html();
                    $.MsgBox.Confirm(title, cx_callback);
                });

                $("#div_bottom_" + index + "_" + index).off("click");
                $("#div_bottom_" + index + "_" + index).on("click", function () {
                    window.location.href = "https://item.jd.com/12186293490.html#crumb-wrap";
                });
                break;
            case "lx_4":
                $("#label_4").html(filterInfo[3].name);
                $("#func_4").html(filterInfo[3].detail);
                $("#use_duration_4").html(filterInfo[3].life);
                $("#cz_page_4").show();
                var index = getHashString("index");
                filterIndex = index - 1;
                var degree = perunused[filterIndex];
                drawProgress("canvas_" + index, degree);
                $("#div_bottom_" + index).off("click");
                $("#div_bottom_" + index).on("click", function () {
                    var title = $("#label_" + index).html();
                    $.MsgBox.Confirm(title, cx_callback);
                });

                $("#div_bottom_" + index + "_" + index).off("click");
                $("#div_bottom_" + index + "_" + index).on("click", function () {
                    window.location.href = "https://item.jd.com/12186293489.html#crumb-wrap";
                });
                break;
            case "lx_5":
                $("#label_5").html(filterInfo[4].name);
                $("#func_5").html(filterInfo[4].detail);
                $("#use_duration_5").html(filterInfo[4].life);
                $("#cz_page_5").show();
                var index = getHashString("index");
                filterIndex = index - 1;
                var degree = perunused[filterIndex];
                drawProgress("canvas_" + index, degree);
                $("#div_bottom_" + index).off("click");
                $("#div_bottom_" + index).on("click", function () {
                    var title = $("#label_" + index).html();
                    $.MsgBox.Confirm(title, cx_callback);
                });

                $("#div_bottom_" + index + "_" + index).off("click");
                $("#div_bottom_" + index + "_" + index).on("click", function () {
                    window.location.href = "https://item.jd.com/12186293487.html#crumb-wrap";
                });
                break;
            case "lx_6":
                $("#label_6").html(filterInfo[5].name);
                $("#func_6").html(filterInfo[5].detail);
                $("#use_duration_6").html(filterInfo[5].life);
                $("#cz_page_6").show();
                var index = getHashString("index");
                filterIndex = index - 1;
                var degree = perunused[filterIndex];
                drawProgress("canvas_" + index, degree);
                $("#div_bottom_" + index).off("click");
                $("#div_bottom_" + index).on("click", function () {
                    var title = $("#label_" + index).html();
                    $.MsgBox.Confirm(title, cx_callback);
                });

                $("#div_bottom_" + index + "_" + index).off("click");
                $("#div_bottom_" + index + "_" + index).on("click", function () {
                    window.location.href = "https://item.jd.com/12186293487.html#crumb-wrap";
                });
                break;
            default:
                $("#home_page_id").show();
        }
    }


    function viewInit() {
        //circleProgressInit();
         console.log("model:"+model)
        filterRanks = 0;
        try {
            $("#device_model").html(model);
            $("#device_squm").html(sn);

            if (model == "CR400D1") {
                filterRanks = 4;
                $("#stat_num_id").html("4级状态");
            } else if (model == "CR600D1") {
                filterRanks = 4;
                $("#stat_num_id").html("4级状态");
            } else if (model == "TJN-M20") {
                filterRanks = 4;
                $("#stat_num_id").html("4级状态");
            } else if (model == "TJN-600E") {
                filterRanks = 5;
                $("#stat_num_id").html("5级状态");
            } else if (model == "TJN-M30") {
                filterRanks = 5;
                $("#stat_num_id").html("5级状态");
                $("#water-temperature").hide();
            } else{
                filterRanks = 4;
                $("#stat_num_id").html("4级状态");
            }

            for (var i = 0; i < filterRanks; i++) {
                $("#home_filter_id_" + (i + 1)).show();
                /*createFilterDisplay(i + 1);
                $("#filter-name-" + (i + 1)).text(filterInfo[i].name);*/
            }

        } catch (e) {
            console.log(e.message);
        }
    }

    function progressAnimation(value, grade) {
        console.log("progress value=" + value);
        console.log("grade = " + grade);
        var $progress = $('#filter-progress-' + grade);
        progress = 0;

        function next() {
            if (progress > value) {
                progress = 0;
                return;
            }
            $progress.css({width: progress + '%'});
            progress = ++progress
            setTimeout(next, 20);
        }

        next();
    }

    function circleProgressInit() {
        $('#indicatorContainer').radialIndicator({
            barBgColor: '#bfe3f8',
            barColor: '#2271c9',
            barWidth: 16,
            initValue: 0,
            roundCorner: false,
            percentage: true,
            fontFamily: '黑体',
            fontWeight: 500,
            radius: 100,
            frameTime: 5,
        });
        $('#indicatorContainer').css('width', '232px');
        $('#indicatorContainer').css('height', '232px');
    }

    // 初始化MQTT
    function mqttInit(host, port, openid) {
        console.log("mqtt init");
        client = new Paho.MQTT.Client(host, Number(port), openid);
        client.onConnectionLost = onConnectionLost
        client.onMessageArrived = onMessageArrived;
//        client.connect({onSuccess: onConnect});
        client.connect({
            userName: "tjnwater/tjnwater",
            password: "lSbk77hCaG16+C4VJHskMMJqFTsGut5aCF4nBqNz5GI=",
            useSSL: true,
            onSuccess: onConnect,
        });
    }

    //连接成功
    function onConnect() {
        console.log("Connect Success");
        client.subscribe("nodes/" + deviceId + "/status");
        client.subscribe("nodes/" + deviceId + "/alive");
        //查询设备当前状态
        queryDeviceStates(TYPE_WATER_PURIFIER, deviceId);
        if (updateVersionInfo.version != null && updateVersionInfo.version != "") {
            //$("#loadingToast").show();
            var title = "";
            var content = "固件升级中…";
            $.MsgBox.InformWait(title, content);
            update();
        }
    }

    //丢失连接
    function onConnectionLost(responseObject) {
        if (responseObject.errorCode !== 0) {
            console.log("onConnectionLost:" + responseObject.errorMessage);
            weui.alert("与净水器已经断开连接，请检查重试！");
        }
    }

    function connectSuccess() {
        client.subscribe("nodes/" + deviceId + "/status");
        client.subscribe("nodes/" + deviceId + "/alive");
        queryDeviceStates(TYPE_WATER_PURIFIER, deviceId);
        if (updateVersionInfo.version != null && updateVersionInfo.version != "") {
            //$("#loadingToast").show();
            var title = "";
            var content = "固件升级中…";
            $.MsgBox.InformWait(title, content);
            update();
        }
    }

    function mqttConnectLost() {
        weui.alert("与净水器已经断开连接，请检查重试！");
    }

    function onMessageArrived(msg) {
        var arr = msg.payloadBytes;
        var index = 8;//索引位置，前面8个是固定的头
        console.log("arrived msg length: " + arr.length);
        console.log("arrived msg: " + bytes2StrForPrint(arr));
        try {
            if ((arr.length == 3) && (arr[0] == 111) && (arr[1] == 102) && (arr[2] == 102)) {//off消息表示wifi模块离线
                $(".home_status_content").css('width', '3.41rem');
                $("#current_state").css('width', '0.67rem');
                $("#current_state").text(WORKING_STATE_OFFLINE);
            }

            if ((arr.length == 2) && (arr[0] == 111) && (arr[1] == 110)) {//on消息表示wifi模块上线
                setTimeout(function () {
                    queryDeviceStates(TYPE_WATER_PURIFIER, deviceId);
                }, 3000)
            }

            if ((arr[0] == 122) && (arr[1] == 122)) {//0x7A,0x7A
                if (arr[index] == 49 && arr[4] == 45) { //回复状态查询或者正常的状态上报信息x31
                    console.log("****************");
                    var jsqInfo = getDeviceStateInfo(arr);
                    updateDevicesState(jsqInfo);
                } else if (arr[index] == 50 && arr[4] == 50) {//处理滤芯复位后的状态数据0x32
                    updataFilterAfterReset(arr);
                } else if ((arr[index - 1] == 0xbb) && (arr[index] == 0xb1)) {//升级状态,命令码，二级命令码
                    updateDeviceUpateState(arr);
                } else if (arr[index] == 0x33) {//UV灯回复
                    if (arr[index + 4] == 0x31) {//设置成功
                        alert("UV灯打开成功");
                    } else {//设置失败
                        alert("UV灯打开失败");
                    }
                } else {
                    console.log("####a mix package#####");
                    if (arr.length > 50) {
                        var dataString = bytes2Str(arr);
                        var d = dataString.split("7a7a");
                        for (var i = 0; i < d.length; i++) {
                            var temp = "7a7a" + d[i];
                            var data = str2Bytes(temp);
                            console.log("mix package data length = " + data.length);
                            console.log("mix package data = " + data.toLocaleString());
                            if (data[4] == 45) {
                                var jsqInfo = getDeviceStateInfo(arr);
                                updateDevicesState(jsqInfo);
                            } else if (data[4] == 50) {
                                updataFilterAfterReset(arr);
                            }
                        }
                    }
                }
            }
        } catch (e) {
            console.log(e.message);
        }
    }

    var isError = 0;

    function updateDevicesState(jsqInfo) {
        //jsqInfo.is_fault=true;
        //jsqInfo.fault_code ="高压开关故障或忘记关水";
        if (!jsqInfo.is_fault) {

            if (isError == 1) {
                $(".index_module_page").hide();
                $("#home_page_id").show();
            }
            isError = 0;
            //$("#normal-page").show();
            //$("#error-page").hide();

            currentState = jsqInfo.working_state;
            /*if (jsqInfo.pure_water_TDS < 100) {
                $(".home_tds_content").css('width','3.02rem');
                $("#TDS_value").css('width', '1.5rem');
            } else */
            if (jsqInfo.pure_water_TDS >= 1000) {
                currentState = 999;
                /*$(".home_tds_content").css('width','3.87rem');
                $("#TDS_value").css('width', '2.25rem');*/
            }
            /*else {
                $(".home_tds_content").css('width','3.87rem');
                $("#TDS_value").css('width', '2.25rem');
            }*/

            if (jsqInfo.working_state == "水箱满") {
                $(".home_status_content").css('width', '3.64rem');
                $("#current_state").css('width', '0.9rem');
            } else if (jsqInfo.working_state == "原水缺水") {
                $(".home_status_content").css('width', '3.84rem');
                $("#current_state").css('width', '1.1rem');
            } else {
                $(".home_status_content").css('width', '3.41rem');
                $("#current_state").css('width', '0.67rem');
            }

            $("#TDS_value").html(jsqInfo.pure_water_TDS);
            $("#source_TDS_value").html(jsqInfo.source_water_TDS);
            $("#source_water_temperature").text(jsqInfo.pure_water_temperature + "℃");
            $("#current_state").html(jsqInfo.working_state);
            for (var i = 0; i < filterRanks; i++) {
                perunused[i] = jsqInfo.filter[i];
                $("#filter-surplus-" + (i + 1)).html(perunused[i] + "%");
                $('#filter-progress-' + (i + 1)).css('width', perunused[i] + '%');
                /*if (perunused[i] < 10) {
                    $('#filter-progress-' + (i + 1)).css('background', '#c10705');
                }*/
            }

            Rinse.rinse(jsqInfo.rinse_state);
        } else {//故障
            isError = 1;
            $(".index_module_page").hide();
            $("#fault_detail_text").html(jsqInfo.fault_code);
            $("#error_page_id").show();
            /*$("#main-page").hide();
            $("#fault_detail_text").html(jsqInfo.fault_code);
            $("#error-page").show();*/
            // postErrorCode(deviceId, getFaultCodeNum());
        }
    }

    function updataFilterAfterReset(arr) {
        var filterInfo = getFilterResetState(arr);
        //process filter info
        if (filterInfo.is_reset_success) {
            resetresult(filterInfo.reset_series - 1, true);
        } else {
            resetresult(filterInfo.reset_series - 1, false);
        }
    }

    function updateDeviceUpateState(arr) {
        if (arr[index + 1] == 0x20) {//开始升级
            console.log("begin update");
        } else if ((arr.length == 16) && (arr[index + 1] == 0x10)) {//升级成功,16为升级命令的固定长度
            //$('#update-text').html("升级成功！");
            var title = ""
            var content = "升级成功";
            $.MsgBox.InformSuccess(title, content);
            setTimeout(function () {
                //$("#loadingToast").fadeOut(200);
                $.MsgBox.Remove();
            }, 3000)
        } else if ((arr.length == 16) && (arr[index + 1] == 0x11)) {//升级失败
            var title = "";
            var content = "升级失败";
            $.MsgBox.InformFail(title, content);
            //$('#update-text').html("升级失败！");
            setTimeout(function () {
                //$("#loadingToast").fadeOut(200);
                $.MsgBox.Remove();
            }, 3000);

        } else {
            console.log("####invalid ota data#####");
        }
    }

    function createFilterDisplay(grade) {
        var parentdiv = $('<div></div>');
        parentdiv.addClass('center-align');
        parentdiv.attr('onclick', 'showFilterDetail(' + grade + ')');
        parentdiv.css('position', "relative");
        parentdiv.css('display', 'inline-flex');
        parentdiv.css('justify-content', 'center');
        parentdiv.css('z-index', '3');
        parentdiv.css('width', '100%');
        var filter_name = $('<div>第' + grade + '级</div>');
        filter_name.addClass('filter-name-text');
        filter_name.addClass('valign-wrapper');
        filter_name.attr('id', 'filter-name-' + grade);
        filter_name.css('color', '#ffffff');
        filter_name.appendTo(parentdiv);
        var filterProgress = $('<div></div>');
        filterProgress.addClass('weui-progess');
        filterProgress.addClass('valign-wrapper');
        filterProgress.css('width', '40%');
        filterProgress.appendTo(parentdiv);
        var filterProgressSon = $('<div></div>');
        filterProgressSon.addClass('weui-progress__bar');
        filterProgressSon.appendTo(filterProgress);
        var filterProgressDetail = $('<div></div>');
        filterProgressDetail.addClass('weui-progress__inner-bar js_progress');
        filterProgressDetail.attr('id', 'filter-progress-' + grade);
        filterProgressDetail.css('width', '0%');
        filterProgressDetail.css('background', '#0077c1');
        filterProgressDetail.appendTo(filterProgressSon);
        var filterPercent = $('<span>--</span>');
        filterPercent.attr('id', 'filter-surplus-' + grade);
        filterPercent.css('width', '2rem');
        filterPercent.css('color', '#ffffff');
        filterPercent.css('margin', '0 0.5rem 0 0.5rem');
        filterPercent.css('font-size', '0.6rem');
        filterPercent.appendTo(parentdiv);
        parentdiv.appendTo($("#filter-div"));
    }

    function getHashString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.hash.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }


    function showFilterDetail(index) {
        window.location.hash = "action=lx_" + index + "&index=" + index;

        /*filterIndex = index - 1;

        $("#filter_detail_description").text(filterInfo[filterIndex].detail);
        $("#filter_life").text(filterInfo[filterIndex].life);
        $("#filter_type").text(filterInfo[filterIndex].name);

        $("#main-page").hide();
        $("#filter-detail-page").show(function () {
            var degree = perunused[filterIndex];
            var loadingAnimation = findKeyframesRule("loading-animation");
            if (loadingAnimation != null) {
                loadingAnimation.appendRule("0%{background-size: 200px 0px}");
                loadingAnimation.appendRule("100%{background-size: " + "200px " + degree * 2 + "px}");
            }
            $(".wave").css("background-size", "200px " + degree * 2 + "px");
            progreeValue = $('#indicatorContainer').data('radialIndicator');
            progreeValue.animate(degree);
        });*/
    }

    function close_filter_detail_page() {
        $("#filter-detail-page").hide();
        $('#indicatorContainer').data('radialIndicator').value(0);
        $("#main-page").show();
    }

    function findKeyframesRule(rule) {
        var ss = document.styleSheets;
        for (var i = 0; i < ss.length; ++i) {
            for (var j = 0; j < ss[i].cssRules.length; ++j) {
                if (ss[i].cssRules[j].type == window.CSSRule.WEBKIT_KEYFRAMES_RULE && ss[i].cssRules[j].name == rule) {
                    return ss[i].cssRules[j];
                }
            }
        }
        return null;
    }

    function callAfterSalesTel() {
        window.location.href = "tel:4008808558";
    }

    function resineFilter() {
        var currentState = $("#current_state").text();
        if (currentState == '离线' || currentState == '未知') {
            weui.alert("设备状态" + currentState + ", 请稍后再试！");
        } else if (currentState == '冲洗') {
            weui.alert("设备正在冲洗！");
        } else {
            Rinse.startRinse();
        }
    }


    function createBasicDialog(nProgress, nIcon, iSuccess) {


        dianCount = 1;
        if (dianIntervalId != null) {
            clearInterval(dianIntervalId);
        }
        dianIntervalId = setInterval(function () {
            var dian = "";
            if (dianCount == 1) {
                dian = "·<span style=\"color: whitesmoke;\">·····</span>";
            } else if (dianCount == 2) {
                dian = "··<span style=\"color: whitesmoke;\">····</span>";
            } else if (dianCount == 3) {
                dian = "···<span style=\"color: whitesmoke;\">···</span>";
            } else if (dianCount == 4) {
                dian = "····<span style=\"color: whitesmoke;\">··</span>";
            } else if (dianCount == 5) {
                dian = "·····<span style=\"color: whitesmoke;\">·</span>";
            } else if (dianCount == 6) {
                dian = "······";
            }
            var title = "冲洗";
            var content = "正在冲洗中" + dian;
            $.MsgBox.InformWait(title, content);
            dianCount = dianCount + 1;
            if (dianCount > 6) {
                dianCount = 1;
            }
        }, 200);

        /*var title= "冲洗";
        var content = "正在冲洗中…";

        $.MsgBox.InformWait(title,content);*/

        /*var parentdiv = $('<div></div>');
        parentdiv.attr('id', 'basic_dialog');
        parentdiv.addClass("weui-mask")
        var childdiv = $('<div></div>');
        childdiv.addClass("basic-dialog");
        childdiv.appendTo(parentdiv);
        var grandSonDiv_bg = $('<div></div>');
        grandSonDiv_bg.addClass("basic-dialog-title-bg");
        grandSonDiv_bg.appendTo(childdiv);
        var greatGrandSonDiv = $('<div></div>');
        greatGrandSonDiv.addClass("basic-dialog-title");
        greatGrandSonDiv.appendTo(grandSonDiv_bg);
        var tilteText = $('<span></span>');
        tilteText.attr('id', 'dialog_title');
        tilteText.addClass("basic-dialog-title-text");
        tilteText.appendTo(greatGrandSonDiv);
        if (nProgress) {
            var progressDiv = $('<div></div>');
            progressDiv.addClass("progress progress-color");
            progressDiv.attr('id', 'progressDiv');
            var indeterminateDiv = $('<div></div>');
            indeterminateDiv.addClass("indeterminate indeterminate-color");
            indeterminateDiv.appendTo(progressDiv);
            progressDiv.appendTo(childdiv);
        }

        var dialogContent = $('<div></div>');
        dialogContent.addClass("basic-dialog-content");
        if (nIcon) {
            if (iSuccess) {
                var dialogContentIcon = $("<img src='../images/success_icon.png'/>");
            } else {
                var dialogContentIcon = $("<img src='../images/failed_icon.png'/>");
            }
            dialogContentIcon.addClass('basic-dialog-content-icon');
            dialogContentIcon.appendTo(dialogContent);
        }

        var dialogContentText = $('<span></span>');
        dialogContentText.attr('id', 'dialog_content_text');
        dialogContentText.appendTo(dialogContent);
        dialogContent.appendTo(childdiv);

        var dialogBtnDiv = $('<div></div>');
        dialogBtnDiv.addClass('valign-wrapper');
        var btn = $('<a></a>');
        btn.addClass('waves-effect waves-green basic-dialog-btn');
        btn.attr('onclick', "close_dialog(false)");
        btn.attr('id', 'dialogBtn');
        btn.text("返回");
        btn.appendTo(dialogBtnDiv);
        dialogBtnDiv.appendTo(childdiv);

        parentdiv.appendTo('body');*/
    }

    function close_dialog(disable) {
        if (!disable) {
            return;
        } else {
            $("#basic_dialog").remove();
        }
    }

    var Rinse = (function () {
        var timeout = 0;
        var rinseTimeOut;

        function rinse(rinseState) {
            console.log("rinseState: " + rinseState);
            if (rinseState == RINSE_START) {
                startSuccess();
            } else if (rinseState == RINSING) {
//                $('#progressDiv').hide();
//                $('#dialog_content_text').html("本机已经在冲洗，请不要连续重复冲洗");
//                $('#dialogBtn').html("返回");
//                $('#dialogBtn').attr('onclick', "close_dialog(true)")
            } else if (rinseState == RINSE_COMPLETED) {
                rinseCompleted("本次冲洗完成");
            }
        }

        function startRinse() {
            sendCommand2Devices(COMMAND_RINSE, deviceId);
            createBasicDialog(true, false, false);
            //$('#dialog_title').text("冲洗");
//            $('#dialog_content_text').text("将要对滤芯进行冲洗，请稍后……");
            //$('#dialog_content_text').text("正在冲洗……");
            rinseTimeOut = setTimeout(rinseTimeout, 10000);
            //$('#dialogBtn').attr('onclick', "close_dialog(false)")
        }

        function startSuccess() {
            if (typeof(rinseTimeout) != "undefined") {
                clearTimeout(rinseTimeOut)
            }

            dianCount = 1;
            if (dianIntervalId != null) {
                clearInterval(dianIntervalId);
            }
            dianIntervalId = setInterval(function () {
                var dian = "";
                if (dianCount == 1) {
                    dian = "·<span style=\"color: whitesmoke;\">·····</span>";
                } else if (dianCount == 2) {
                    dian = "··<span style=\"color: whitesmoke;\">····</span>";
                } else if (dianCount == 3) {
                    dian = "···<span style=\"color: whitesmoke;\">···</span>";
                } else if (dianCount == 4) {
                    dian = "····<span style=\"color: whitesmoke;\">··</span>";
                } else if (dianCount == 5) {
                    dian = "·····<span style=\"color: whitesmoke;\">·</span>";
                } else if (dianCount == 6) {
                    dian = "······";
                }
                var title = "冲洗";
                var content = "正在冲洗中" + dian;
                $.MsgBox.InformWait(title, content);
                dianCount = dianCount + 1;
                if (dianCount > 6) {
                    dianCount = 1;
                }
            }, 200);
            /*var title= "冲洗";
            var content = "正在冲洗中…";
            $.MsgBox.InformWait(title,content);*/
            //$('#dialog_content_text').text("正在冲洗……");
            //$('#dialogBtn').text("请稍后")
            rinsingTimeout = setTimeout(rinseTimeout, 60000);
        }

        function rinseCompleted(displayArg) {
            if (typeof(rinsingTimeout) != "undefined") {
                clearTimeout(rinsingTimeout)
            }
            if (dianIntervalId != null) {
                clearInterval(dianIntervalId);
            }
            var title = "冲洗";
            var content = "本次冲洗完成";
            $.MsgBox.InformSuccess(title, content);
            /*$('#progressDiv').hide();
            $('#dialog_content_text').html(displayArg);
            $('#dialogBtn').html("返回");
            $('#dialogBtn').attr('onclick', "close_dialog(true)")*/
        }


        function rinseTimeout() {
            if (dianIntervalId != null) {
                clearInterval(dianIntervalId);
            }
            var title = "冲洗";
            var content = "本次冲洗失败";
            $.MsgBox.InformFail(title, content);
            /*$('#dialog_content_text').text("响应超时，请稍后再试");
            $('#dialogBtn').attr('onclick', "close_dialog(true)")*/
        }

        return {rinse: rinse, startRinse: startRinse, rinseCompleted: rinseCompleted};
    }());

    function resetFilter() {
        $('#filter_reset_dialog').show();
        $('#filter_result_btn').html("请稍后");
        $('#filter_result_btn').removeAttr("onclick");
        var tmp = "滤芯重置将会使滤芯已使用清零，并重新计算寿命。<br>" + '<span style="font-weight: 600">' + "是否确定对 ";

        $('#resetfilter_content_text').html(tmp + '<span style="color: #3c9cfe">' + filterInfo[filterIndex].name + '</span>' + " 进行重置？</span>");
    }

    function close_filter_dialog() {
        //将添加ICON后的状态还原，解决下一次复位时的布局异常
        $('.basic-dialog-content').removeClass('valign-wrapper');
        $('#basic-dialog-content-icon').removeClass('basic-dialog-content-icon');
        $('#basic-dialog-content-icon').remove();
        $('#reset_filter_dialog_content').css('text-align', 'left');
        $('#reset_filter_dialog_content').css('padding', '0px');
        $('#reset_before_btn').css('display', 'flex');
        $('#reset_after_btn').css('display', 'none');
        $('#resetfilter_content_text').css('font-size', '0.75rem')
        $('#filter_reset_dialog').hide();
    }

    function startResetFilter() {
        sendCommand2Devices(COMMAND_FILTER_RESET, deviceId, filterIndex);
        dianCount = 1;
        if (dianIntervalId != null) {
            clearInterval(dianIntervalId);
        }
        dianIntervalId = setInterval(function () {
            var dian = "";
            if (dianCount == 1) {
                dian = "·<span style=\"color: whitesmoke;\">·····</span>";
            } else if (dianCount == 2) {
                dian = "··<span style=\"color: whitesmoke;\">····</span>";
            } else if (dianCount == 3) {
                dian = "···<span style=\"color: whitesmoke;\">···</span>";
            } else if (dianCount == 4) {
                dian = "····<span style=\"color: whitesmoke;\">··</span>";
            } else if (dianCount == 5) {
                dian = "·····<span style=\"color: whitesmoke;\">·</span>";
            } else if (dianCount == 6) {
                dian = "······";
            }
            var title = "";
            var content = "正在重置中" + dian;
            $.MsgBox.InformWait(title, content);
            dianCount = dianCount + 1;
            if (dianCount > 6) {
                dianCount = 1;
            }
        }, 200);
        /*$('#resetfilter_content_text').html("正在重置滤芯，请稍后……");
        $('.basic-dialog-content').css('text-align', 'center');
        $('.basic-dialog-content').css('padding', '1rem');
        $('#reset_before_btn').css('display', 'none');
        $('#reset_after_btn').css('display', 'block');*/
        filterResetTimer = setTimeout(function () {
            if (dianIntervalId != null) {
                clearInterval(dianIntervalId);
            }
            var title = "";
            var content = "响应超时";
            $.MsgBox.InformFail(title, content);
            /*$('#resetfilter_content_text').html("响应超时");
            $('#filter_result_btn').html("确定");
            $('#filter_result_btn').attr('onclick', "close_filter_dialog()")*/
        }, 10000);
    }

    function resetresult(index, iSuccess) {
        if (dianIntervalId != null) {
            clearInterval(dianIntervalId);
        }
        clearTimeout(filterResetTimer);
        /*$('#filter_result_btn').html("确定");
        $('#filter_result_btn').attr('onclick', "close_filter_dialog()")
        $('.basic-dialog-content').addClass('valign-wrapper');
        $('.basic-dialog-content').css('display', 'flex');*/
        if (iSuccess) {
            var title = "";
            var content = "重置成功";
            $.MsgBox.InformSuccess(title, content);
            /*$('#resetfilter_content_text').html("重置成功!");
            var dialogContentIcon = $("<img src='../images/success_icon.png'/>");*/
        } else {
            var title = "";
            var content = "重置失败";
            $.MsgBox.InformFail(title, content);
            /* $('#resetfilter_content_text').html("重置失败!");
             var dialogContentIcon = $("<img src='../images/failed_icon.png'/>");*/
        }
        /*dialogContentIcon.addClass('basic-dialog-content-icon');
        dialogContentIcon.attr('id', 'basic-dialog-content-icon');
        dialogContentIcon.attr('margin-right', '10px');
        $('#resetfilter_content_text').css('font-size', '1rem');
        $('#resetfilter_content_text').before(dialogContentIcon);*/
        if (iSuccess) {
            if ((model == "CR400D1" || model == "CR600D1" || model == "TJN-M20") && (index == 2 || index == 3)) {
                perunused[2] = 100;
                perunused[3] = 100;
                /*$('#filter2').css({width: 100 + '%'});
                $('#filter3').css({width: 100 + '%'});*/
                $('#filter-progress-3').css('width', 100 + '%');
                $('#filter-progress-4').css('width', 100 + '%');
                $("#filter-surplus-3").html("100%");
                $("#filter-surplus-4").html("100%");
                /*$('#filter_surplus_3').text("100%");
                $('#filter_surplus_4').text("100%");*/
            } else {
                perunused[index] = 100;
                $('#filter-surplus-' + (index + 1)).html("100%");
                $('#filter-progress-' + (index + 1)).css('width', 100 + '%');
                /*$('#filter_surplus_' + (index + 1)).text("100%")
                $('#filter' + index).css({width: 100 + '%'});*/
            }
            resetSucessResult(index + 1);
        }

    }

    function resetSucessResult(index) {
        drawProgress("canvas_" + index, 100);
        $("#div_bottom_" + index).off("click");
        $("#div_bottom_" + index).on("click", function () {
            var title = $("#label_" + index).html();
            $.MsgBox.Confirm(title, cx_callback);
        });
        /*var loadingAnimation = findKeyframesRule("loading-animation");
        if (loadingAnimation != null) {
            loadingAnimation.appendRule("0%{background-size: 200px 0px}");
            loadingAnimation.appendRule("100%{background-size: " + "200px " + 100 * 2 + "px}");
        }
        $(".wave").css("background-size", "200px " + 100 * 2 + "px");
        progreeValue.animate(perunused[index]);*/
    }

    function updateWifiModel() {
        if (updateVersionInfo.version != null && updateVersionInfo.version != "") {
            if (confirm("检测wifi模块有新版本，是否升级？")) {
                console.log("升级");
                update();
                createBasicDialog(true, false, false);
                $('#dialog_title').text("模块升级");
                $('#dialog_content_text').text("正在升级模块，请稍后……");
                updateTimeout = setTimeout(function () {
                    $('#dialog_content_text').text("升级超时，请重试！");
                    $('#dialogBtn').attr('onclick', "close_dialog(true)")
                }, 90000);

            } else {
                console.log("不升级");
            }
        }
    }

    $('.breath-animation').click(function () {
        weui.alert('该型号暂时不支持此功能！')
//        countChart();
    });


    function update() {
        wifiModelUpdate(updateVersionInfo.version, updateVersionInfo.pkgSize, updateVersionInfo.downloadUrl, updateVersionInfo.md5, deviceId);
    }


</script>
</body>
</html>
