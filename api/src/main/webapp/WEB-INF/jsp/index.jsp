<%--
  Created by IntelliJ IDEA.
  User: renrui
  Date: 2017/8/10/0010
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">

    <title>我的设备列表</title>

    <link href="/web/css/materialize.min.css" rel="stylesheet"/>
    <link href="/web/css/jsq_home_new.css" rel="stylesheet"/>
    <link href="/web/css/weui.min.css" rel="stylesheet"/>
    <style type="text/css">

        #main_content_id {
            position: relative;
            width: 100%;
            min-height: 70%;
        }

        /* .js_btn{
             position: absolute;
             bottom: 70px;
             left:50%;
             margin-left: -125px;
             width: 250px;
             height: 50px;
             line-height: 50px;
             text-align: center;
             font-size: 24px;
             color:#fff;
             background: url("/web/tjn_imgs/add_device_btn.png") no-repeat;
             background-size:250px 50px;
         }*/

        .js_btn {
            width: 250px;
            height: 50px;
            line-height: 50px;
            margin: 0 auto;
            margin-top: 20px;
            margin-bottom: 40px;
            text-align: center;
            font-size: 24px;
            color: #fff;
            background: url("/web/tjn_imgs/add_device_btn.png") no-repeat;
            background-size: 250px 50px;
        }

        /*.my-device-list:last-child{
            margin-bottom: 140px;
        }*/
    </style>

</head>
<body style="margin: 0px; font-family: 'Microsoft YaHei'; font-weight: 500; background-color: #1b1f25">

<%--<div class="my-device-list">--%>
<%--<div class="valign-wrapper" style="border-bottom: 2px #5091e5 solid">--%>
<%--<img src="../images/jsq_icon.png" style="width: 2rem">--%>
<%--<span class="my-device-list-title">智能净水器</span>--%>
<%--</div>--%>
<%--<div>--%>
<%--<span>型号：</span><span id="device_model">CR700D1</span>--%>
<%--</div>--%>
<%--<div class="valign-wrapper">--%>
<%--<span>名称：</span><span id="device_name">客厅净化器</span>--%>
<%--<img src="../images/edit_device_name.png" style="width: 1.5rem">--%>
<%--</div>--%>
<%--<div>--%>
<%--<span>序列号：</span><span id="device_seq">CWR4D117071312345</span>--%>
<%--<div style="overflow-y: scroll;">--%>
<%--<img src="../images/single-arrow-down.png" class="show-more-info-icon"--%>
<%--onclick="showMore()" id="show-more-icon">--%>
<%--</div>--%>
<%--</div>--%>
<%--<div id="more-info">--%>
<%--<div class="valign-wrapper" id="firmware_version">--%>
<%--<span>固件版本：</span><span id="firmware_version_text">SM-1.0-100</span>--%>
<%--<span class="red-remind"></span>--%>
<%--</div>--%>
<%--<div>--%>
<%--<span>设备ID：</span><span id="device_id">bece23711d722537_1</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<div class="js_dialog" id="device_rename_dialog" style="opacity: 1; display: none">
    <div class="weui-mask"></div>
    <div class="weui-dialog weui-skin_android">
        <div class="weui-dialog__bd">
            <span>请输入新的名称：</span><br>
            <input id="device_new_name" type="text" value="" maxlength="10" ; minlength="2">
        </div>
        <div class="weui-dialog__ft">
            <a onclick="cancelDialog()" href="javascript:;"
               class="weui-dialog__btn weui-dialog__btn_default">取消</a>
            <a onclick="renameDevice()" href="javascript:;"
               class="weui-dialog__btn weui-dialog__btn_primary">确认</a>
        </div>
    </div>
</div>

<div class="js_dialog" id="update-dialog" style="opacity: 1; display: none; ">
    <div class="weui-mask"></div>
    <div class="weui-dialog weui-skin_android">
        <div class="weui-dialog__bd">
            <span>检测到新的固件版本</span><br>
            <span>新版本：</span><span id="new-version-text" style="color: #5091e5;"></span><br>
            <span>是否升级？</span>
        </div>
        <div class="weui-dialog__ft">
            <a onclick="cancelDialog()" href="javascript:;"
               class="weui-dialog__btn weui-dialog__btn_default">取消</a>
            <a id="update-confirm" href="javascript:;"
               class="weui-dialog__btn weui-dialog__btn_primary">确认</a>
        </div>
    </div>
</div>

<div style="width: 100%; display: none;" id="no_device">
    <div style="margin: 20% auto; text-align: center;width: inherit; height: 50%; opacity: 0.4">
        <img src="../images/no_bind_device_icon.png" width="60%">
        <div style="font-size: 1rem; padding: 1rem">暂无设备，请先绑定设备</div>
    </div>
    <div id="add_device" class="basicBtn"
         style="width: 50%; background-color: #0e6be2; color: #fff; font-weight: 200; font-size: 1.3rem ;text-align: center; margin: 0 auto">
        添加设备
    </div>

</div>


<div id="main_content_id">
</div>
<div class="js_btn" onclick="sel_device();" style="display: none;">添加设备</div>


<script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="/web/js/protocol-parse.js" type="text/javascript"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/libs/weuijs/1.1.1/weui.min.js"></script>
<script type="text/javascript">

    var host = "${serverInfo.host}";
    var port = "${serverInfo.port}";
    var appId = "${serverInfo.appId}";

    var wxbindInfos = new Array();
    var deviceInfos = new Array();
    var updateInfos = new Array();
    var generalBindInfos = new Array();

    $(function () {
        console.log("all start....");
        getBindInfo(appId);
    });

    function sel_device() {
        window.location.href = "/web/sel_device.html";
    }

    function initView() {
        if (wxbindInfos.length > 0) {
            for (var i = 0; i < wxbindInfos.length; i++) {
                createDeviceType(wxbindInfos[i].deviceType, i);
                // if ((wxbindInfos[i].deviceType == "1") || (wxbindInfos[i].deviceType == "2")) {
                //
                // } else if (wxbindInfos[i].deviceType == "9") {
                //     createGeneralType("9", i);
                // }
            }

            $(".js_btn").show();

        }

        if (generalBindInfos.length > 0) {
            for (var i = 0; i < generalBindInfos.length; i++) {
                createGeneralType("9", i);
            }
            $(".js_btn").show();
        } else {
            window.location.href = "/web/add_device.html";
            /*$("#no_device").show();
            $("#add_device").click(function () {
                add_new_device();
            })*/
        }
    }

    // function initGeneralView() {
    //     console.log("1111111111")
    //     if (generalBindInfos.length > 0) {
    //         for (var i = 0; i < generalBindInfos.length; i++) {
    //             createGeneralType("9", i);
    //         }
    //         $(".js_btn").show();
    //     }
    // }

    function fillViewData() {
        for (var i = 0; i < wxbindInfos.length; i++) {
            $("#" + "device_model_" + i).html(deviceInfos[i].model);
            $("#" + "device_name_" + i).html(wxbindInfos[i].deviceName);
            $("#" + "device_id_" + i).html(wxbindInfos[i].deviceId);
            $("#" + "seq_num_" + i).html(deviceInfos[i].seqNum);
            $("#" + "firmware_version_text_" + i).html(deviceInfos[i].version);
        }
    }
    
    function fillGeneralViewData() {
        for (var i = 0; i < generalBindInfos.length; i++) {
            $("#" + "genernal_device_model_" + i).html(generalBindInfos[i].device_model);
            $("#" + "genernal_device_name_" + i).html(generalBindInfos[i].nick_name);
            $("#" + "genernal_install_date_" + i).html(generalBindInfos[i].install_date);
        }
    }

    function getGeneralBindInfo(appId) {
        $.ajax({
            type: "POST",
            url: "/web/wechat/get_general_bind_info",
            data: {
                appId: appId
            },
            success: function (data) {
                generalBindInfos = data;
                console.log("genalL:" + generalBindInfos[0].nick_name);
                initView();
                // getDevciesInfo(JSON.stringify(data));
                fillGeneralViewData();
            },
            error: function () {
                weui.alert('获取绑定信息失败，请重试!');
            },
        });
    }

    function getBindInfo(appId) {
        $.ajax({
            type: "POST",
            url: "/web/wechat/get_bind_info",
            data: {
                appId: appId
            },
            success: function (data) {
                wxbindInfos = data;
                getGeneralBindInfo(appId);
                getDevciesInfo(JSON.stringify(data));
            },
            error: function () {
                weui.alert('获取绑定信息失败，请重试!');
            },
        });
    }

    function getDevciesInfo(wxBindInfo) {
        $.ajax({
            type: "POST",
            url: "/web/wechat/get_device_info",
            data: {wxBindInfo: wxBindInfo},
            success: function (data) {
                deviceInfos = data;
                fillViewData();
            },
            error: function () {
                weui.alert('获取设备信息失败，请重试!');
            }
        });
    }

    function refreshData() {
        $.ajax({
            type: "POST",
            url: "/web/wechat/get_bind_info",
            data: {
                appId: appId
            },
            success: function (data) {
                wxbindInfos = data;
                fillViewData();
            },
            error: function () {
                weui.alert('数据刷新失败，请重试!');
            },
        });
    }

    function getUpdateInfo(i) {
        $.ajax({
            type: "POST",
            url: "/web/wechat/get_update_info",

            data: {
                model: deviceInfos[i].model,
                deviceType: deviceInfos[i].deviceType,
                version: deviceInfos[i].version
            },
            success: function (data) {
                console.log("update data =" + data.toLocaleString());
                updateInfos[i] = data;
                if (!(data == undefined || data == null || data == "")) {
                    $("#update_remind_" + i).fadeIn(200);
                }
            },
            error: function () {
                weui.alert('获取版本失败，请重试!');
            },
        });

    }

    function createGeneralType(type, order) {
        console.log("33333333")
        var parentDiv = $('<div></div>');
        parentDiv.addClass("my-device-list");
        parentDiv.css('border-left', '5px #4e91ec solid');
        parentDiv.attr('id', 'device_' + order);
        parentDiv.attr('onclick', 'location_device_detail(' + type + ',' + order + ')');
        var childDiv1 = $('<div></div>');
        childDiv1.addClass("valign-wrapper");
        childDiv1.css("border-bottom", "2px #5091e5 solid");
        childDiv1.appendTo(parentDiv);
        var title = $('<span></span>');
        var icon = $("<img src='../images/jsq_icon.png'/>");
        title.text("前置过滤器")
        icon.css("width", "2rem")
        title.addClass('my-device-list-title');
        icon.appendTo(childDiv1);
        title.appendTo(childDiv1);

        var childDiv2 = $('<div></div>')
        childDiv2.appendTo(parentDiv);
        var title_model = $('<span>型号：</span>')
        title_model.appendTo(childDiv2);
        var model = $('<span></span>');
        model.attr('id', 'genernal_device_model_' + order);
        model.appendTo(childDiv2);

        var childDiv3 = $('<div></div>')
        childDiv3.addClass('valign-wrapper');
        childDiv3.appendTo(parentDiv);
        var title_name = $('<span>名称：</span>')
        title_name.appendTo(childDiv3);
        var name = $('<span></span>');
        name.attr('id', 'genernal_device_name_' + order);
        name.appendTo(childDiv3);
        var edit_name_icon = $("<img src='../images/edit_device_name.png'>")
        edit_name_icon.css('width', '1.5rem');
        edit_name_icon.css('margin-left', '1rem');
        edit_name_icon.attr('onclick', 'editDeviceName(' + type + ',' + order + ')');
        edit_name_icon.appendTo(childDiv3);

        var childDiv4 = $('<div></div>');
        childDiv4.appendTo(parentDiv);
        var title_id = $('<span>安装时间：</span>');
        title_id.appendTo(childDiv4);
        var id = $('<span></span>');
        id.attr('id', 'genernal_install_date_' + order);
        id.appendTo(childDiv4);

        var mainContent = $("#main_content_id");
        parentDiv.appendTo(mainContent);
    }

    function createDeviceType(type, order) {
        var parentDiv = $('<div></div>');
        parentDiv.addClass("my-device-list");
        if (type == "1") {
            parentDiv.css('border-left', '5px #4e91ec solid');
        } else {
            parentDiv.css('border-left', '5px #7cec85 solid');
        }

        parentDiv.attr('id', 'device_' + order);
        parentDiv.attr('onclick', 'location_device_detail(' + type + ',' + order + ')');

        var childDiv1 = $('<div></div>');
        childDiv1.addClass("valign-wrapper");
        childDiv1.css("border-bottom", "2px #5091e5 solid");
        childDiv1.appendTo(parentDiv);
        var title = $('<span></span>');
        if (type == DEVICE_WATER_PURIFIER) {
            var icon = $("<img src='../images/jsq_icon.png'/>");
            title.text("智能净水器")
        } else if (type == DEVICE_AIR_PURIFIER) {
            var icon = $("<img src='../images/jhq_icon.png'/>");
            title.text("空气净化器")
        }
        icon.css("width", "2rem")
        title.addClass('my-device-list-title');
        icon.appendTo(childDiv1);
        title.appendTo(childDiv1);

        var childDiv2 = $('<div></div>')
        childDiv2.appendTo(parentDiv);
        var title_model = $('<span>型号：</span>')
        title_model.appendTo(childDiv2);
        var model = $('<span></span>');
        model.attr('id', 'device_model_' + order);
        model.appendTo(childDiv2);

        var childDiv3 = $('<div></div>')
        childDiv3.addClass('valign-wrapper');
        childDiv3.appendTo(parentDiv);
        var title_name = $('<span>名称：</span>')
        title_name.appendTo(childDiv3);
        var name = $('<span></span>');
        name.attr('id', 'device_name_' + order);
        name.appendTo(childDiv3);
        var edit_name_icon = $("<img src='../images/edit_device_name.png'>")
        edit_name_icon.css('width', '1.5rem');
        edit_name_icon.css('margin-left', '1rem');
        edit_name_icon.attr('onclick', 'editDeviceName(' + type + ',' + order + ')');
        edit_name_icon.appendTo(childDiv3);

        var childDiv4 = $('<div></div>');
        childDiv4.appendTo(parentDiv);
        var suqNum_id = $('<span>序列号：</span>');
        suqNum_id.appendTo(childDiv4);
        var seq_num = $('<span></span>');
        seq_num.attr('id', 'seq_num_' + order);
        seq_num.appendTo(childDiv4);

        var showMoreInfoIcon = $('<img src="../images/single-arrow-down.png">');
        showMoreInfoIcon.addClass('show-more-info-icon');
        showMoreInfoIcon.attr('onclick', 'showMore(' + order + ')');
        showMoreInfoIcon.attr('id', 'show_more_info_icon_' + order);
        showMoreInfoIcon.appendTo(childDiv4);

        var moreInfo = $('<div></div>');
        moreInfo.css('display', 'none');
        moreInfo.attr('id', 'more_info_' + order);
        moreInfo.appendTo(parentDiv);

        var childDiv5 = $('<div></div>');
        childDiv5.appendTo(moreInfo);
        var title_id = $('<span>设备ID：</span>');
        title_id.appendTo(childDiv5);
        var id = $('<span></span>');
        id.attr('id', 'device_id_' + order);
        id.appendTo(childDiv5);

        var childDiv6 = $('<div></div>');
        childDiv6.attr('onclick', 'updateFirmware(' + order + ')');
        childDiv6.appendTo(moreInfo);
        var title_firmware = $('<span>固件版本：</span>');
        title_firmware.appendTo(childDiv6);
        var firmware = $('<span></span>');
        firmware.attr('id', 'firmware_version_text_' + order);
        firmware.appendTo(childDiv6);
        var updateRemind = $('<span>new</span>');
        updateRemind.addClass('red-remind');
        updateRemind.attr('id', 'update_remind_' + order);
        updateRemind.css('display', 'none');
        updateRemind.appendTo(childDiv6);

        var mainContent = $("#main_content_id");
        parentDiv.appendTo(mainContent);
    }

    function location_device_detail(type, order, update) {
        if (order == -1) {
            return;
        }
        if (update) {
            url = "/web/wechat/my_devices.html?deviceId=" + wxbindInfos[order].deviceId + "&type=" + type + "&update=0" +
                "&version=" + updateInfos[order].version + "&size=" + updateInfos[order].pkgSize + "&url=" + updateInfos[order].downloadUrl + "&md5=" + updateInfos[order].md5;
        } else {
            url = "/web/wechat/my_devices.html?deviceId=" + wxbindInfos[order].deviceId + "&type=" + type;
        }
        window.location.href = url;
    }

    function editDeviceName(type, order) {

        event.cancelBubble = true;//防止子div的click事件触发外层DIV的click
        selectOrder = order;
        selectType = type;
        $("#device_rename_dialog").fadeIn(200);
        console.log("selectOrder: " + selectOrder);
        console.log("name: " + wxbindInfos[selectOrder].deviceName);
        $("#device_new_name").val(wxbindInfos[selectOrder].deviceName);
    }

    function cancelDialog() {
        $(".js_dialog").fadeOut(200);
    }

    function renameDevice() {
        if ($('#device_new_name').val().length <= 1) {
            alert("输入的名称太短");
        } else {
            var newName = $('#device_new_name').val();
            var deviceID = wxbindInfos[selectOrder].deviceId;
            $.ajax({
                type: "POST",
                url: "/web/wechat/update_device_name",
                data: {
                    name: newName,
                    deviceId: deviceID,
                    deviceType: selectType
                },
                success: function () {
                    $("#device_rename_dialog").fadeOut(200);
                    setTimeout(refreshData(), 2000);
                },
                error: function () {
                    $("#device_rename_dialog").fadeOut(200);
                    weui.alert('修改名称失败，请重试!');
                }
            });
        }
    }

    function add_new_device() {
        window.location.href = "/web/wechat/net_setting.html"
    }

    function showMore(order) {
        event.cancelBubble = true;
        if ($("#more_info_" + order).is(":hidden")) {
            $("#more_info_" + order).fadeIn(200);
            $("#show_more_info_icon_" + order).attr('src', '../images/single-arrow-up.png')
            getUpdateInfo(order);
        } else {
            $("#more_info_" + order).fadeOut(200);
            $("#show_more_info_icon_" + order).attr('src', '../images/single-arrow-down.png')
        }
    }

    function updateFirmware(order) {
        event.cancelBubble = true;
        if (updateInfos[order] != undefined && updateInfos[order] != null && updateInfos[order] != "") {
            $("#update-dialog").fadeIn(200);
            $("#new-version-text").html(updateInfos[order].version);
            $("#update-confirm").attr('onclick', 'updateExecute(' + order + ')');
        }
    }

    function updateExecute(i) {
        console.log("i = " + i);
        console.log("device id = " + deviceInfos[0].deviceId);
        console.log("new version = " + updateInfos[i].version);
        console.log("new pkgSize = " + updateInfos[i].pkgSize);
        console.log("new md5 = " + updateInfos[i].md5);
        $("#update-dialog").fadeOut(200);

//        wifiModelUpdate(updateInfos[i].version, updateInfos[i].pkgSize, updateInfos[i].downloadUrl, updateInfos[i].md5, deviceInfos[i].deviceId);
//        weui.alert("正在升级，请勿推出或者刷新！");
        location_device_detail(deviceInfos[0].deviceType, i, "update", updateInfos[i].version, updateInfos[i].pkgSize, updateInfos[i].downloadUrl, updateInfos[i].md5);
    }

</script>
</body>
</html>
