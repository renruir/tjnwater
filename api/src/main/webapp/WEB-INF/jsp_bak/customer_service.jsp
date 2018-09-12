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
    <script src="/web/js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <title>客户服务</title>

    <link href="/web/css/jsq_home_new.css?v=1.1" rel="stylesheet"/>
    <link href="/web/css/weui.min.css" rel="stylesheet"/>
</head>
<body>

<div style="display: flex;">
    <div class="weui-btn-area" style="width: 50%; height: 10rem;">
        <a href="/web/wechat/aftersale_service.html?category=install" class="weui-btn weui-btn_primary"
           style="background-color: #1a305c; height: 10rem; line-height: 10rem;font-size: 25px"
           id="install_device">安装</a>
    </div>

    <div class="weui-btn-area" style="width: 50%; height: 10rem">
        <a href="/web/wechat/aftersale_service.html?category=repair" class="weui-btn weui-btn_primary"
           style="background-color: #1a305c; height: 10rem; line-height: 10rem; font-size: 25px"
           id="repair_device">维修</a>
    </div>

</div>


<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>

</body>
</html>
