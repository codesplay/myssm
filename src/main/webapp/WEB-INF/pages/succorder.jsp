<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单提交成功</title>
    <link rel="stylesheet" href="css/common.css"/>

</head>
<style>
    *{margin:0;padding:0;}
    html body{width: 100%;}
    .orderinfo_logo{
        float: left;
    }
    .orderinfo_wrapper{
        width: 990px;
        margin: 0 auto;
    }
    .orderinfo_left a{
        color: #333;
        font-size: 18px;

    }
    .orderinfo_left img{
        width: 90px;
        height: 90px;
        vertical-align: middle;
    }
    .stepflex {
        display: inline-block;
        display: block;
        border-top: 5px solid #ccc;
        text-align: center;
        margin: 30px 0 0;
        float: right;
        font-size: 12px;
    }
    .stepflex dl.done {
        border-top-color: #caecb6;
    }

    .stepflex dl {
        float: left;
        position: relative;
        width: 160px;
        top: -5px;
        border-top: 5px solid #ccc;
    }
    .stepflex dl.done .s-num {
        background-position: -46px 0;
    }
    .stepflex .s-num {
        position: relative;
        margin: -15px auto 0;
        color: #fff;
        font-weight: 700;
        width: 23px;
        height: 23px;
        background-image: url("img/step2013.png");
        line-height: 23px;
    }

    .stepflex .s-text {
        color: #ccc;
    }
    .stepflex dl.done .s-text {
        color: #caecb6;
    }
    dd {
        display: block;
        margin-inline-start: 10px;
    }

    .stepflex .first s {
        background-position: 0 -24px;
        background-color: #fff;
    }
    .stepflex .done s {
        background-position: -46px -24px;
    }
    .stepflex .doing b, .stepflex .doing s, .stepflex .first s, .stepflex .last b {
        width: 5px;
        height: 5px;
        position: absolute;
        line-height: 0;
        font-size: 0;
        top: -5px;
        background-image: url("img/step2013.png");
        overflow: hidden;
    }
    .stepflex s {
        left: 0;
    }
    s, strike, del {
        text-decoration: line-through;
    }
    .stepflex dl.done .s-text {
        color: #caecb6;
    }
    .stepflex .done b {
        background-position: -51px -24px;
    }
    .stepflex b {
        right: 0;
    }
    .stepflex dl.doing {
        border-top-color: #7abd54;
    }
    .stepflex dl.doing .s-num {
        background-position: -23px 0;
    }
    .stepflex dl.doing .s-text {
        color: #7abd54;
    }
    .stepflex .doing.last s, .stepflex .doing.normal s {
        background-color: #caecb6;
    }
    .stepflex .doing s {
        background-position: -23px -24px;
    }
    .stepflex .last b {
        background-position: -5px -24px;
        background-color: #fff;
    }
    .orderinfo_conatiner{
        min-height: 493px;
    }
    .orderinfo_wrapper{
        width: 990px;
        margin: 0 auto;
    }
    .succorder{
        background: #e6ffe3;
        border-top: #5cb85c 2px solid;
        height: 400px;
    }
    .succorder_w{
        width: 850px;
        margin: 90px auto;
        padding: 20px 0;
    }
    .succorder_w span{
        color: #5cb85c;
        font-size: 25px;
    }
    .succorder_btn{
        margin-top: 30px;
    }
    .succorder_btn a{
        width: 60px;
        padding: 5px 10px;
        background: white;
        height: 30px;
        border-radius: 10px;
        border: #eee2fe 1px solid;
    }
    .succorder_ordernum{
        margin-top: 30px;
        padding: 5px;
        color: #666;
        font-size: 14px;
        border-radius: 5px;
        background: white;
    }
</style>
<script type="text/javascript">
/* if (response.data)
{
    $.each(response.data,function(i,eobj) {
        console.log(eobj.id);
        console.log(eobj.template_name);
        console.dir(eobj);
    })
} */

</script>
<body>
<div class="index_header">
    <div class="index_wrapper">
        <ul class="index_wr">
            <li class="index_lr1"><c:if
						test="${sessionScope.user.username == null}">
						<a href="log" class="index_login">你好，请登录</a>
                	&nbsp;&nbsp;<a href="reg" class="index_regist">免费注册</a>
					</c:if> <c:if test="${sessionScope.user.username != null}">
						<a href="#" class="index_login"
							style="color: #ccc; font-size: 15px">
							${sessionScope.user.username} <a href="remuser" class="index_login">退出登录</a>
						</a>
					</c:if></li>
            <li class="spacer"></li>
            <li class="index_lr2">
                <div class="dt">
                    <a target="_blank" href="myorders">我的订单</a>
                </div>
            </li>
            <li class="spacer"></li>
            <li class="index_lr3">
                <div class="dt index_icon"><a href="/WebShop/">返回首页</a></div>
            </li>
        </ul>
    </div>
</div>
<div class="orderinfo_header clearfix">
    <div class="orderinfo_wrapper">
        <div class="orderinfo_logo clearfix">

            <div class="orderinfo_left">
                <a href="Jindex.html"><img src="img/logo.php"/>结算页</a>
            </div>
        </div>
        <div class="stepflex" id="#sflex03">
            <dl class="first done">
                <dt class="s-num">1</dt>
                <dd class="s-text">1.我的购物车<s></s><b></b></dd>
            </dl>
            <dl class="normal done">
                <dt class="s-num">2</dt>
                <dd class="s-text">2.填写核对订单信息<s></s><b></b></dd>
            </dl>
            <dl class="normal doing">
                <dt class="s-num">3</dt>
                <dd class="s-text">3.成功提交订单<s></s><b></b></dd>
            </dl>
        </div>
    </div>
</div>
<div class="orderinfo_conatiner">
    <div class="orderinfo_wrapper">
        <div class="succorder">
            <div class="succorder_w">
                <span>感谢您，订单提交成功!</span>
                <div class="succorder_btn">
                    <a class="succorder_order" href="myorders">查看订单</a>
                    <a class="succorder_contbuy" href="/WebShop/">继续购物</a>
                </div>
                <div class="succorder_ordernum"><p>订单号：${num }<em style="margin-left: 60px">金额：${money }</em></p></div>
            </div>
        </div>
    </div>
</div>
<div class="index_footer">
    <div class="footer-2019">
        <p>
            <a href="#">关于我们</a><span>|</span>
            <a href="#">联系我们</a><span>|</span>
            <a href="#">联系客服</a><span>|</span>
            <a href="#">合作招商</a><span>|</span>
            <a href="#">营销中心</a><span>|</span>
            <a href="#">友情链接</a><span>|</span>
            <a href="#">隐私政策</a><span>|</span>
        </p>
    </div>
    <div class="copyright">
        <p><a href="#">京公网安备 1xxxxxxxxxxxx8号</a><span>|</span><span>京ICP证xxxxxx号</span><span>|</span><span>xxxxxxx xxxxxxxxx号</span></p>
        <p><span>网络文化经营许可证京网文[xxxx]xxxx-xxx号</span><span></span><span>|</span><span>违法和不良信息举报电话：4006561155</span></p>
    </div>
</div>
</body>
</html>
