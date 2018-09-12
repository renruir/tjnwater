<%--
  Created by IntelliJ IDEA.
  User: renrui
  Date: 2017/5/22 0022
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <title>设备配网</title>

    <link href="/web/css/jsq_home_new.css" rel="stylesheet"/>
</head>
<body style="font-family: 'Microsoft YaHei'; font-weight: 500">

<div style="text-align: center; margin: 5% 0 5% 0; ">
    <a>长按识别二维码，为设备配网</a>
</div>

<div class="connect-net-qrcode">
    <div style="display: flex; text-align: center; margin: 0 auto; justify-content: center; width: 100%">
        <div>智能净水器</div>
    </div>
    <img src="/web/images/jsq_qrcode.jfif" style="width: 100%; margin-top: 1rem">

</div>


<div style="display: none;margin: 0 auto; text-align: center; position: fixed; bottom: 1%; width: 100%">
    <a onclick="window.location='http://mp.weixin.qq.com/s?__biz=MzI0NjYzNzg4NQ==&mid=100000113&idx=1&sn=b7c4c67a4ac4e562cafeebb8549c4fcc&chksm=69bd75235ecafc35727eae16aa327dbd5c2e0acb1dc16d57326b886a8850e255d33015fc75de'"
       style="text-align: center">查看配网指引</a>
</div>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>

    function imageClick() {
        console.log("88888888888888");
        wx.previewImage({
            // 当前显示图片的http链接
            current: '/web/images/air_purifier_qrcode.jpg',
            // 需要预览的图片http链接列表
            urls: ['/web/images/air_purifier_qrcode.jpg']
        });
    }

</script>


</body>

</html>
