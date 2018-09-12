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
    <script src="/web/js/fitness.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <title>创维智能净水器</title>

    <link rel="shortcut icon" href="/web/images/favicon.ico" type="image/x-icon"/>
    <link href="/web/css/jsq_home_new.css" rel="stylesheet"/>
    <link href="/web/css/swiper-3.4.1.min.css" rel="stylesheet"/>
    <link href="/web/css/weui.min.css" rel="stylesheet"/>
    <link href="/web/css/materialize.min.css" rel="stylesheet"/>

</head>
<body style="margin: 0px; font-family: 'Microsoft YaHei'; font-weight: 500">

<div id="wx_logo" style="margin:0 auto;display:none;">
    <img src="/web/images/wx_logo.png"/>
</div>


<div id="main-page" style="width: 100%; height: 100%; display: none;">
    <%--<div class="swiper-wrapper">--%>
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
</div>


<script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="/web/js/mqttws31.js" type="text/javascript"></script>
<script src="/web/js/protocol-parse.js?v=1.1" type="text/javascript"></script>
<script src="/web/js/filterfunction.js?v=1.1" type="text/javascript"></script>
<script src="/web/js/swiper-3.4.1.min.js" type="text/javascript"></script>
<script src="/web/js/echarts.min.js" type="text/javascript"></script>
<script src="/web/js/waveEffect.js" type="text/javascript"></script>
<script src="/web/js/materialize.min.js" type="text/javascript"></script>
<script src="/web/js/radialIndicator.js" type="text/javascript"></script>
<script src="https://res.wx.qq.com/open/libs/weuijs/1.1.1/weui.min.js" type="text/javascript"></script>

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
        rank: "${FilterInfo.getRank()}",
        name: "${FilterInfo.getFilterName()}",
        life: "${FilterInfo.getFilterLife()}",
        detail: "${FilterInfo.getFilterDetail()}",
        other: "${FilterInfo.getOtherInfo()}",
    }
    filterInfo.push(filter);
    </c:forEach>

    var updateVersionInfo = {
        "version": "${updateDeviceInfo.version}",
        "pkgSize": "${updateDeviceInfo.pkgSize}",
        "md5": "${updateDeviceInfo.md5}",
        "downloadUrl": "${updateDeviceInfo.downloadUrl}"
    };

    $(function () {
        console.log("start");
        
        for(var i =0; i < filterInfo.length; i++){
            console.log("info: "+filterInfo[i].life);
        }
        
        $("#main-page").show();
        wave_new.start();
        viewInit();
        if (deviceId == null || deviceId == "" || openid == null || openid == "") {
            weui.alert("您还没有绑定净水器设备！");
        } else {
            mqttInit(host, port, openid);
        }
    });

    function viewInit() {
        circleProgressInit();
        filterRanks = 0;
        try {
            $("#device_model").html(model);
            $("#device_squm").html(sn);

            if (model == "CR400D1") {
                filterRanks = 4;
            } else if (model == "CR600D1") {
                filterRanks = 4;
            } else if (model == "50G-X3") {
                filterRanks = 5;
                $("#water-temperature").hide();
            }

            for (var i = 0; i < filterRanks; i++) {
                createFilterDisplay(i + 1);
                $("#filter-name-" + (i + 1)).text(filterInfo[i].name);
            }

        } catch (e) {
            console.log(e.message);
        }
    }

    function progressAnimation(value, rank) {
        console.log("progress value=" + value);
        console.log("rank = " + rank);
        var $progress = $('#filter-progress-' + rank);
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
            userName: "tjnwater/jindian",
            password: "ufO80F5sSyin4ArSurBcPJOeeCwK9eA2IR2pHOX3+nY=",
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
            $("#loadingToast").show();
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
            $("#loadingToast").show();
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

    function updateDevicesState(jsqInfo) {
        if (!jsqInfo.is_fault) {

            $("#normal-page").show();
            $("#error-page").hide();

            currentState = jsqInfo.working_state;
            if (jsqInfo.pure_water_TDS < 100) {
                $("#TDS_value").css('font-size', '5.5rem');
            } else {
                $("#TDS_value").css('font-size', '4rem');
            }
            $("#TDS_value").html(jsqInfo.pure_water_TDS);
            $("#source_TDS_value").html(jsqInfo.source_water_TDS);
            $("#source_water_temperature").text(jsqInfo.pure_water_temperature + "℃");
            $("#current_state").text(jsqInfo.working_state);
            for (var i = 0; i < filterRanks; i++) {
                perunused[i] = jsqInfo.filter[i];
                $("#filter-surplus-" + (i + 1)).text(perunused[i] + "%");
                $('#filter-progress-' + (i + 1)).css('width', perunused[i] + '%');
                if (perunused[i] < 10) {
                    $('#filter-progress-' + (i + 1)).css('background', '#c10705');
                }
            }

            Rinse.rinse(jsqInfo.rinse_state);
        } else {//故障
            $("#main-page").hide();
            $("#fault_detail_text").html(jsqInfo.fault_code);
            $("#error-page").show();
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
            $('#update-text').html("升级成功！");
            setTimeout(function () {
                $("#loadingToast").fadeOut(200);
            }, 3000)
        } else if ((arr.length == 16) && (arr[index + 1] == 0x11)) {//升级失败
            $('#update-text').html("升级失败！");
            setTimeout(function () {
                $("#loadingToast").fadeOut(200);
            }, 3000);

        } else {
            console.log("####invalid ota data#####");
        }
    }

    function createFilterDisplay(rank) {
        var parentdiv = $('<div></div>');
        parentdiv.addClass('center-align');
        parentdiv.attr('onclick', 'showFilterDetail(' + rank + ')');
        parentdiv.css('position', "relative");
        parentdiv.css('display', 'inline-flex');
        parentdiv.css('justify-content', 'center');
        parentdiv.css('z-index', '3');
        parentdiv.css('width', '100%');
        var filterName = $('<div>第' + rank + '级</div>');
        filterName.addClass('filter-name-text');
        filterName.addClass('valign-wrapper');
        filterName.attr('id', 'filter-name-' + rank);
        filterName.css('color', '#ffffff');
        filterName.appendTo(parentdiv);
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
        filterProgressDetail.attr('id', 'filter-progress-' + rank);
        filterProgressDetail.css('width', '0%');
        filterProgressDetail.css('background', '#0077c1');
        filterProgressDetail.appendTo(filterProgressSon);
        var filterPercent = $('<span>--</span>');
        filterPercent.attr('id', 'filter-surplus-' + rank);
        filterPercent.css('width', '2rem');
        filterPercent.css('color', '#ffffff');
        filterPercent.css('margin', '0 0.5rem 0 0.5rem');
        filterPercent.css('font-size', '0.6rem');
        filterPercent.appendTo(parentdiv);
        parentdiv.appendTo($("#filter-div"));
    }


    function showFilterDetail(index) {
        filterIndex = index - 1;

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
        });
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
        window.location.href = "tel:95105555";
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

        var parentdiv = $('<div></div>');
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

        parentdiv.appendTo('body');
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
            } else if (rinseState == RINSING && $("#basic_dialog").is(":visible")) {
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
            $('#dialog_title').text("冲洗");
            $('#dialog_content_text').text("将要对滤芯进行冲洗，请稍后……");
            rinseTimeOut = setTimeout(rinseTimeout, 10000);
            $('#dialogBtn').attr('onclick', "close_dialog(false)")
        }

        function startSuccess() {
            if (typeof(rinseTimeout) != "undefined") {
                clearTimeout(rinseTimeOut)
            }
            $('#dialog_content_text').text("正在冲洗……");
            $('#dialogBtn').text("请稍后")
            rinsingTimeout = setTimeout(rinseTimeout, 60000);
        }

        function rinseCompleted(displayArg) {
            if (typeof(rinsingTimeout) != "undefined") {
                clearTimeout(rinsingTimeout)
            }
            $('#progressDiv').hide();
            $('#dialog_content_text').html(displayArg);
            $('#dialogBtn').html("返回");
            $('#dialogBtn').attr('onclick', "close_dialog(true)")
        }


        function rinseTimeout() {
            $('#dialog_content_text').text("响应超时，请稍后再试");
            $('#dialogBtn').attr('onclick', "close_dialog(true)")
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
        $('#resetfilter_content_text').html("正在重置滤芯，请稍后……");
        $('.basic-dialog-content').css('text-align', 'center');
        $('.basic-dialog-content').css('padding', '1rem');
        $('#reset_before_btn').css('display', 'none');
        $('#reset_after_btn').css('display', 'block');
        filterResetTimer = setTimeout(function () {
            $('#resetfilter_content_text').html("响应超时");
            $('#filter_result_btn').html("确定");
            $('#filter_result_btn').attr('onclick', "close_filter_dialog()")
        }, 10000);
    }

    function resetresult(index, iSuccess) {
        clearTimeout(filterResetTimer);
        $('#filter_result_btn').html("确定");
        $('#filter_result_btn').attr('onclick', "close_filter_dialog()")
        $('.basic-dialog-content').addClass('valign-wrapper');
        $('.basic-dialog-content').css('display', 'flex');
        if (iSuccess) {
            $('#resetfilter_content_text').html("重置成功!");
            var dialogContentIcon = $("<img src='../images/success_icon.png'/>");
        } else {
            $('#resetfilter_content_text').html("重置失败!");
            var dialogContentIcon = $("<img src='../images/failed_icon.png'/>");
        }
        dialogContentIcon.addClass('basic-dialog-content-icon');
        dialogContentIcon.attr('id', 'basic-dialog-content-icon');
        dialogContentIcon.attr('margin-right', '10px');
        $('#resetfilter_content_text').css('font-size', '1rem');
        $('#resetfilter_content_text').before(dialogContentIcon);
        if (iSuccess) {
            if ((model == "CR400D1" || model == "CR600D1") && (index == 2 || index == 3)) {
                perunused[2] = 100;
                perunused[3] = 100;
                $('#filter2').css({width: 100 + '%'});
                $('#filter3').css({width: 100 + '%'});
                $('#filter_surplus_3').text("100%");
                $('#filter_surplus_4').text("100%");
            } else {
                perunused[index] = 100;
                $('#filter_surplus_' + (index + 1)).text("100%")
                $('#filter' + index).css({width: 100 + '%'});
            }
            resetSucessResult();
        }

    }

    function resetSucessResult() {
        var loadingAnimation = findKeyframesRule("loading-animation");
        if (loadingAnimation != null) {
            loadingAnimation.appendRule("0%{background-size: 200px 0px}");
            loadingAnimation.appendRule("100%{background-size: " + "200px " + 100 * 2 + "px}");
        }
        $(".wave").css("background-size", "200px " + 100 * 2 + "px");
        progreeValue.animate(perunused[index]);
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
