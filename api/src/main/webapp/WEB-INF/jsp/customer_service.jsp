<%--
  Created by IntelliJ IDEA.
  User: renrui
  Date: 2018/1/24/0024
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/web/js/laydate.js"></script>
    <link href="/web/css/laydate.css" rel="stylesheet"/>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>预约安装维修</title>
    <style>
        html, body {
            /*font-size: 100px;*/
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }

        .page_main {
            position: absolute;
            top: 0;
            left: 50%;
            width: 7.20rem;
            height: 100%;
            min-height: 11.56rem;
            margin-left: -3.6rem;
            background-color: #1b1f25;
            overflow: hidden;

        }

        .install_btn {
            border-radius: 0.1rem;
            float: left;
            background-color: #5dd1e8;
            border: none;
            color: #ffffff;
            /*padding: 0.05rem 2.62rem 0.05rem 0.06rem;*/
            text-align: center;
            line-height: 0.83rem;
            text-decoration: none;
            display: inline-block;
            font-size: 0.35rem;
            font-family: 黑体;
            width: 2.65rem;
            height: 0.83rem;
            letter-spacing: 0.26rem;
            margin-left: 0.04rem;
            margin-top: 0.05rem;
            margin-bottom: 0.05rem;

        }

        .head_btn {
            border-radius: 0.15rem;
            background-color: #437b88;
            /*border: none;*/
            color: #9eb6bd;
            /*padding: 15px 32px;*/
            text-align: center;
            line-height: 0.93rem;
            text-decoration: none;
            display: inline-block;
            font-size: 0.35rem;
            width: 5.33rem;
            height: 0.93rem;
            letter-spacing: 0.26rem;
            margin-top: 0.84rem;
            margin-left: 0.91rem;
            margin-right: 0.91rem;

        }


        .repair_btn {
            border-radius: 0.1rem;
            float: left;
            background-color:  #437b88;
            /*border: none;*/
            color: #9eb6bd;
            /*padding: 15px 32px;*/
            text-align: center;
            line-height: 0.83rem;
            text-decoration: none;
            display: inline-block;
            font-size: 0.35rem;
            font-family: 黑体;
            width: 2.60rem;
            height: 0.83rem;
            letter-spacing: 0.26rem;
            margin-top: 0.05rem;
            margin-bottom: 0.05rem;
        }

        .page_head {
            height: 1.73rem;
        }

        input[type=date]:before {
            content: attr(placeholder);
            font-family: 黑体;
            font-size: 0.24rem;
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
        }

        input[type=date]::-webkit-inner-spin-button { visibility: hidden; }

        .page_middle {
            height: 6.53rem;
            width: 100%;
            float: left;
            margin-top: 0.68rem;
            border-top: 0.01rem solid #21262e;
            /*text-align: center;*/
            /*vertical-align: middle;*/
        }

        .middle_cell {
            width: 100%;
            border-bottom: 0.01rem solid #21262e;
            text-align: center;
            vertical-align: middle;

        }

        .page_cell {
            margin-left: 1.1rem;
            width: 100%;
            height: 1rem;
            text-align: center;
            vertical-align: middle;
            line-height: 1rem;
        }

        ::-webkit-input-placeholder {
            color: #ffffff;
        }

        .icon {
            /*margin-left: 1.02rem;*/
            /*margin-top: 0.68rem;*/
            text-align: center;
            vertical-align: middle;
            color: white;
            float: left;
            font-size: 0.22rem;
            /*clear: both;*/
            display: inline;
            height: 1rem;

        }

        img {
            margin-right: 0.27rem;
            vertical-align: middle;
            text-align: center;
            display: inline;
            line-height: 1rem;
            /*float: left;*/
        }

        .page_bottom {
            height: 3.3rem;
        }

        .button {
            border-radius: 0.1rem;
            /*float: left;*/
            background-color: #5dd1e8;
            /*border: none;*/
            color: #ffffff;
            /*display: inline-block;*/
            font-size: 0.35rem;
            width: 5.31rem;
            height: 0.84rem;
            letter-spacing: 0.26rem;
            margin-left: 0.96rem;
            margin-right: 0.96rem;
            /*padding-top: 0.88rem;*/
            text-align: center;
            /*vertical-align: middle;*/
            /*line-height: 0.84rem;*/
            display: inline-block;
            border: none;

        }

    </style>

    <script>(function (doc, win) { var docEl = doc.documentElement, resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize', recalc = function () { var clientWidth = docEl.clientWidth; if (!clientWidth) return; if(clientWidth>560){clientWidth=560;} docEl.style.fontSize = 100 * (clientWidth / 720) + 'px'; }; recalc(); if (!doc.addEventListener) return; win.addEventListener(resizeEvt, recalc, false); /* doc.addEventListener('DOMContentLoaded', recalc, false); */})(document, window);
    </script>
</head>
<body>
<div class="page_main">

    <div class="page_head">
        <div class="head_btn" id="head_tab" >
            <div class="install_btn" id="install_tab" onclick="change_install()">安装</div>
            <div class="repair_btn" id="repaire_tab" onclick="change_repair()"  >维修</div>
        </div>
    </div>


    <div class="page_middle">
        <div class="middle_cell">
            <div class="page_cell">
                <div class="icon"><img src="/web/install_img/icon_people.png" style="width: 0.18rem;height: 0.26rem">
                    <input type="text"
                           style="font-size: 0.22rem;border: 0rem;width:4.8rem;background: #1b1f25;color: #ffffff; font-family: 黑体; "
                           name="people" id="peopleId" placeholder="联系人" onfocus="this.placeholder=''"
                           onblur="this.placeholder='联系人'"/>
                </div>
            </div>
        </div>
        <div class="middle_cell">
            <div class="page_cell">
                <div class="icon"><img src="/web/install_img/icon_phone.png" style="width: 0.24rem;height: 0.25rem">
                    <input type="text"
                           style="font-size: 0.22rem;border: 0rem;width:4.8rem;background: #1b1f25;color: #ffffff; font-family: 黑体;margin-left: -0.05rem  "
                           name="phone" id="phoneId" placeholder="135XXXXXXXX" onfocus="this.placeholder=''"
                           onblur="this.placeholder='135XXXXXXXX'">
                </div>
            </div>
        </div>
        <div class="middle_cell">
            <div class="page_cell">
                <div class="icon"><img src="/web/install_img/icon_address.png" style="width: 0.2rem;height: 0.27rem">
                    <input type="text"
                           style="font-size: 0.22rem;border: 0rem;width:4.8rem;background: #1b1f25;color: #ffffff; font-family: 黑体; "
                           name="address" id="addressId" placeholder="联系地址" onfocus="this.placeholder=''"
                           onblur="this.placeholder='联系地址'">
                </div>
            </div>
        </div>
        <div class="middle_cell">
            <div class="page_cell">
                <div class="icon"><img src="/web/install_img/icon_machine%20type.png" style="width: 0.18rem;height: 0.24rem">
                    <input type="text"
                           style="font-size: 0.22rem;border: 0rem;width:4.8rem;background: #1b1f25;color: #ffffff; font-family: 黑体; "
                           name="machine" id="machineId" placeholder="机器型号" onfocus="this.placeholder=''"
                           onblur="this.placeholder='机器型号'"></div>
            </div>
        </div>
        <div class="middle_cell">
            <div class="page_cell">
                <div class="icon"><img src="/web/install_img/icon_date.png" style="width: 0.24rem;height: 0.26rem">
                    <input type="text" onfocus="this.placeholder=''" onblur="this.placeholder='预约日期'"
                           style="font-size: 0.22rem;border: 0rem;width:4.8rem;background: #1b1f25;color: #ffffff; font-family: 黑体;margin-left: -0.05rem "
                           name="date" id="dateId" placeholder="预约日期" readonly="true"
                    >
                </div>
            </div>
        </div>
        <div class="middle_cell">
            <div class="page_cell">
                <div class="icon"><img src="/web/install_img/message.png" style="width: 0.24rem;height: 0.24rem">
                    <input type="text"
                           style="font-size: 0.22rem;border: 0rem;width:4.8rem;background: #1b1f25;color: #ffffff; font-family: 黑体; margin-left: -0.05rem"
                           name="message" id="messageId" placeholder="备注信息" onfocus="this.placeholder=''"
                           onblur="this.placeholder='备注信息'"></div>
            </div>
        </div>
    </div>


    <div class="page_bottom">
        <button type="submit" class="button" >提交</button>
    </div>


</div>

</div>
<script type="text/javascript">


    //执行一个laydate实例
    laydate.render({
        elem: '#dateId' //指定元素

    });


    function change_repair() {
        document.getElementById("repaire_tab").style.color="#ffffff";
        document.getElementById("repaire_tab").style.background="#5dd1e8";
        document.getElementById("install_tab").style.color="#9eb6bd";
        document.getElementById("install_tab").style.background="#437b88";


    }

    function change_install() {
        document.getElementById("install_tab").style.color="#ffffff";
        document.getElementById("install_tab").style.background="#5dd1e8";
        document.getElementById("repaire_tab").style.color="#9eb6bd";
        document.getElementById("repaire_tab").style.background="#437b88";


    }


</script>


</body>
</html>
