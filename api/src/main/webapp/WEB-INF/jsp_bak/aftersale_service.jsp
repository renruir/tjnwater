<%--
  Created by IntelliJ IDEA.
  User: renrui
  Date: 2018/1/02/0002
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/web/js/geo.js?v=1.0" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">

    <title id="title">预约安装维修服务</title>

    <link href="/web/css/jsq_home_new.css?v=1.1" rel="stylesheet"/>
    <link href="/web/css/weui.min.css" rel="stylesheet"/>
</head>
<body onload="setup();">

<form action="/web/wechat/service.html" method="post" onsubmit="return inputCheck()">
    <div class="page navbar js_show">
        <div class="page__bd" style="height: 100%;">
            <div class="weui-tab">
                <div class="weui-navbar">
                    <div class="weui-navbar__item weui-bar__item_on" id="install-tab" onclick="changeService(0)">
                        安装
                    </div>
                    <div class="weui-navbar__item" id="repair-tab" onclick="changeService(1)">
                        维修
                    </div>
                </div>
                <div class="weui-tab__panel">
                    <input name="openId" value="${openid}" style="display:none"/>
                    <input name="category" value="" style="display: none" id="category"/>
                    <div class="weui-toptips weui-toptips_warn js_tooltips" id="error-hints" style="display: none;">
                        错误提示
                    </div>

                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label weui-form-title-width">联系人*</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" type="text" id="dept_name" name="dept_name"
                                   placeholder="请输入联系人姓名">
                        </div>
                    </div>

                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label weui-form-title-width">联系电话*</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" id="phone_number" name="phone_number" pattern="[0-9]*"
                                   placeholder="请输入联系电话">
                        </div>
                    </div>

                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label weui-form-title-width">地址*</label></div>
                        <div class="weui-cell__bd">
                            <select class="item-select" name="province" id="s1">
                                <option></option>
                            </select>
                            <select class="item-select" name="city" id="s2">
                                <option></option>
                            </select>
                            <select class="item-select" name="zone" id="s3">
                                <option></option>
                            </select>
                        </div>
                    </div>

                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label class="weui-label weui-form-title-width"></label></div>
                        <div class="weui-cell__bd" style="width: 60%; margin: 0 auto">
                            <input class="weui-input" type="text" id="address_detail" name="address_detail"
                                   placeholder="详细地址">
                        </div>
                    </div>

                    <div class="weui-cell weui-cell_select weui-cell_select-after" id="quantity-div">
                        <div class="weui-cell__hd">
                            <label for="" class="weui-label weui-form-title-width">数量*</label>
                        </div>
                        <div class="weui-cell__bd">
                            <select class="weui-select" name="quantity" id="quantity" onchange="quantityOnChange()">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                        </div>
                    </div>

                    <%--<div class="weui-cells weui-cells_checkbox">--%>
                        <%--<label class="weui-cell weui-check__label" for="s11">--%>
                            <%--<div class="weui-cell__hd">--%>
                                <%--<input type="checkbox" class="weui-check" name="checkbox1" id="s11" checked="checked">--%>
                                <%--<i class="weui-icon-checked"></i>--%>
                            <%--</div>--%>
                            <%--<div class="weui-cell__bd">--%>
                                <%--X1--%>
                            <%--</div>--%>
                        <%--</label>--%>
                        <%--<label class="weui-cell weui-check__label" for="s12">--%>
                            <%--<div class="weui-cell__hd">--%>
                                <%--<input type="checkbox" name="checkbox1" class="weui-check" id="s12">--%>
                                <%--<i class="weui-icon-checked"></i>--%>
                            <%--</div>--%>
                            <%--<div class="weui-cell__bd">--%>
                                <%--X3--%>
                            <%--</div>--%>
                        <%--</label>--%>
                    <%--</div>--%>

                    <div id="model-div">
                        <div class="weui-cell weui-cell_select weui-cell_select-after">
                            <div class="weui-cell__hd">
                                <label for="" class="weui-label weui-form-title-width">型号*</label>
                            </div>
                            <div class="weui-cell__bd">
                                <select class="weui-select" name="model" id="model">
                                    <option value="X1">X1</option>
                                    <option value="X3">X3</option>
                                    <option value="X5">X5</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="weui-cell">
                        <div class="weui-cell__hd"><label for="" class="weui-label weui-form-title-width">预约日期</label>
                        </div>
                        <div class="weui-cell__bd">
                            <input class="weui-input" type="date" value="" name="order_date" id="servicedate">
                        </div>
                    </div>

                    <div id="discribe-fault" style="display: none">
                        <div class="weui-cells__title weui-form-title-width" style="font-size: 17px">故障描述</div>
                        <div class="weui-cells">
                            <div class="weui-cell">
                                <div class="weui-cell__bd">
                                    <input class="weui-input" type="text" name="fault_describe" placeholder="故障描述">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="weui-cells__title weui-form-title-width" style="font-size: 17px">备注</div>
                    <div class="weui-cells">
                        <div class="weui-cell">
                            <div class="weui-cell__bd">
                                <input class="weui-input" type="text" name="remarks" placeholder="请输入备注">
                            </div>
                        </div>
                    </div>

                    <div style="text-align: right; margin: 0 1rem; color: red">
                        <a>带*项目为必填项</a>
                    </div>

                    <div class="weui-btn-area">
                        <input class="weui-btn weui-btn_primary" type="submit" name="submit"></input>
                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>

</form>


<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>
<script>


    var category = "${category}"
    console.log("category = " + category);
    $(function () {
        $("#category").val(category);
        if (category == "install") {
            $("#discribe-fault").fadeOut(200);
        } else if (category == "repair") {
            $("#discribe-fault").fadeIn(200);
        }
    })

    function changeService(type) {
        console.log("===" + type);
        $('.weui-navbar__item').addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        if (type == 0) {
            $("#install-tab").addClass('weui-bar__item_on');
            $("#repair-tab").removeClass('weui-bar__item_on');
            $("#discribe-fault").fadeOut(200);
        } else {
            $("#install-tab").removeClass('weui-bar__item_on');
            $("#repair-tab").addClass('weui-bar__item_on');
            $("#discribe-fault").fadeIn(200);
        }
    }

    function quantityOnChange() {
        var quantity = $("#quantity").find("option:selected").val();
        console.log("3333333333333==" + quantity);

        if (quantity == 1) {
            addModel(1)
        } else if (quantity == 2) {
            addModel(2)
        } else if (quantity == 3) {
            addModel(3)
        }
    }

    function touchErrorHints(tips) {
        var errorHints = $('#error-hints');
        errorHints.html(tips);
        if (errorHints.css('display') != 'none') return;
        errorHints.fadeIn(100);
        setTimeout(function () {
            errorHints.fadeOut(100);
        }, 2000);
    }


    function addModel(index) {
        var parentdiv = $('<div></div>');
        parentdiv.addClass("weui-cell weui-cell_select weui-cell_select-after");
        var div_1 = $('<div></div>');
        var label_1 = $('<label></label>');
        label_1.addClass("weui-label weui-form-title-width");
        label_1.html("型号" + index + "<span style='color: red'>*</span>")
        label_1.appendTo(div_1);
        div_1.appendTo(parentdiv);

        var div_2 = $('<div></div>');
        div_2.addClass("weui-cell__bd");
        var select_div = $('<select></select>');
        select_div.addClass("weui-select");
        select_div.attr('id', 'model_' + index);
        select_div.attr('name', 'model_' + index);
        select_div.appendTo(div_2);
        var option1 = $('<option>X1</option>');
        option1.attr('value', 'X1');
        option1.appendTo(select_div);
        var option2 = $('<option>X3</option>');
        option2.attr('value', 'X3');
        option2.appendTo(select_div);
        var option3 = $('<option>X5</option>');
        option3.attr('value', 'X5');
        option3.appendTo(select_div);
        div_2.appendTo(parentdiv);
        parentdiv.appendTo($("#model-div"));
    }


    function inputCheck() {
        var deptName = $("#dept_name");
        if (deptName.val() == "" || deptName.val() == undefined) {
            touchErrorHints("联系人没有填写！");
            return false;
        }

        var phoneNumber = $("#phone_number");
        console.log("kkk=" + phoneNumber.val().length);
        if (phoneNumber.val() == "" || phoneNumber.val() == undefined || phoneNumber.val().length != 11) {
            touchErrorHints("电话号码没有填写或者填写错误！")
            return false;
        }

        if ($("#s1").val() == "" || $("#s1").val() == undefined ||
            $("#s2").val() == "" || $("#s2").val() == undefined ||
            $("#s3").val() == "" || $("#s3").val() == undefined ||
            $("#address_detail").val() == "" || $("#address_detail").val() == undefined) {
            touchErrorHints("请输入安装地址！")
            return false;
        }

        if ($("#model").val() == "" || $("#model").val() == undefined) {
            touchErrorHints("必须要输入型号")
            return false;
        }

        return true;
    }

</script>


</body>
</html>
