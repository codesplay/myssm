<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>订单结算页</title>
<link rel="stylesheet" href="css/common.css" />
<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>

</head>
<style>
* {
	margin: 0;
	padding: 0;
}

html body {
	width: 100%;
	font: 12px/150% tahoma, arial, Microsoft YaHei, Hiragino Sans GB,
		"\u5b8b\u4f53", sans-serif;
	color: #666
}

.orderinfo_logo {
	float: left;
}

.orderinfo_conatiner {
	min-height: 435px;
}

.orderinfo_wrapper {
	width: 990px;
	margin: 0 auto;
}

.orderinfo_left a {
	color: #333;
	font-size: 18px;
}

.orderinfo_left img {
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

.stepflex .doing b, .stepflex .doing s, .stepflex .first s, .stepflex .last b
	{
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

.orderinfo_title {
	margin-bottom: 10px;
}

.orderinfo_check {
	background-color: #fff;
	padding: 0 20px;
	border: 1px solid #f0f0f0;
}

.orderinfo-title {
	line-height: 40px;
	height: 40px;
	color: #333;
	font-size: 12px;
}

.orderinfo-title h3 {
	float: left;
}

.orderinfo_addsite {
	float: right;
}

.font-color {
	color: #005ea7;
}

.orderinfo_site {
	line-height: 30px;
}

.orderinfo_site span {
	float: left;
	display: inline-block;
	margin-right: 10px;
	font-size: 12px;
	color: #666;
}

.orderinfo_addrname {
	line-height: 30px;
}

.orderinfo_addrsite {
	max-width: 322px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.orderinfo-site {
	padding-left: 5px;
}

.orderinfo-site a {
	color: #005ea7;
	float: right;
	font-size: 12px;
}

.orderinfo-site a:hover {
	color: red;
}

.orderinfo-site:hover {
	background: #fff3f3;
}

.hr {
	border-bottom: 1px solid #e6e6e6;
	height: 0;
	margin-bottom: 10px;
}

.orderinfo_shoppinglist {
	background: #E9FAFF;
	padding: 0 10px;
}

.orderinfo_goodsitem {
	padding: 10px 0;
}

.orderinfo_img {
	width: 80px;
	height: 80px;
	float: left;
	vertical-align: middle;
}

.orderinfo_goodsname {
	float: left;
}

.orderinfo_goodsname span, .orderinfo_goodsname a, .orderinfo_goodsname strong
	{
	font-size: 12px;
	margin-left: 120px;
	color: #666;
}

.orderinfo-goodstitle {
	width: 200px;
	height: 44px;
	line-height: 20px;
	float: left;
	overflow: hidden;
}

.orderinfo-goodstitle a {
	display: block;
	margin-left: 30px;
}

.blank {
	width: 100px;
	height: 10px;
	float: left;
}

.money {
	color: #333;
	width: 100px;
	text-align: right;
	font-family: verdana;
}

.orderinfo_sumnum {
	float: right;
	margin: 10px;
}

.color_red {
	color: #e4393c;
}

.text_right {
	text-align: right;
	margin-bottom: 10px;
}

.text_right em {
	color: #e4393c;
	font-family: Verdana;
	font-weight: 700;
	font-size: 18px;
	min-width: 122px;
}

.orderinfo_trade {
	padding: 10px 10px;
	background: #f4f4f4;;
}

.orderinfo_puton {
	float: right;
	width: 135px;
	height: 36px;
	background: url("img/btn-submit.jpg") no-repeat;
	cursor: pointer;
	overflow: hidden;
	margin: 10px 10px;
	border: 0;
}

.ui-dialog-title {
	position: relative;
	padding: 0 10px;
	height: 31px;
	line-height: 31px;
	background: #f3f3f3;
	font-size: 14px;
	color: #666;
	font-family: "Microsoft YaHei";
}

.ui-dialog-close {
	cursor: pointer;
	display: block;
	position: absolute;
	z-index: 100000;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 13px;
	height: 13px;
	background: url("img/dialog.png") no-repeat;
	font-size: 0;
}
</style>
<script type="text/javascript">
	
	
	function submitorder(){
		var orderArray = new Array();
        var index;
    	var list = document.getElementsByClassName('orderinfo_goodsitem');
        for(index=0;index<list.length;index++){
            orderArray.push({
            	id:null,
            	product_id: $('#product_id_'+(index+1)).val(),
            	buynum: $('#buynum_'+(index+1)).val(), 
            	buymoney: $('#buymoney_'+(index+1)).attr('value'),
            	status:0,
            	ordersite:$('.orderinfo_addrsite').html(),
            	user_id:$('#user_id_'+(index+1)).val(),
            	ordertime:0,
            	ordernum:0});
        }
		$.ajax({
			url:"submitorder?phone="+$('.orderinfo_addrtel').text()+"&username="+$('.orderinfo_addrname').html()+"&email="+$("#orderinfo_email").val(),
            type: "POST",
            data: JSON.stringify(orderArray),            //将Json对象序列化成Json字符串，toJSON()需要引用jquery.json.min.js
            contentType : 'application/json;charset=UTF-8', //设置请求头信息 
            success: function(data){
            	window.location.href="/WebShop/succorder?nums="+data;
            },
            error: function(res){
            	alert(res);
            }
		});
	}
</script>

<body>
	<input type="hidden" id="orderinfo_email" value=""/>
	<div class="orderinfo_setmsg"
		style="width: 690px; position: absolute; z-index: 10000; display: none; overflow: hidden; top: 75px; left: 325.5px; border: 4px solid rgba(0, 0, 0, .1);">
		<div class="ui-dialog-title">
			<span>编辑收货人信息</span> <a class="ui-dialog-close orderinfo_ui"></a>
		</div>
		<div class="ui-dialog-content"
			style="height: 428px; width: 690px; overflow: hidden;">
			<iframe id="orderinfo_iframe" src="/WebShop/setmsg.jsp"
				style="border: 0px; width: 100%; height: 430px;"></iframe>
		</div>
	</div>
	<div class="ui-mask"
		style="display: none; position: absolute; left: 0px; top: 0px; opacity: 0.15; z-index: 9998; background-color: rgb(0, 0, 0); width: 1349px; height: 1993px;"></div>
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
						<a target="_blank" href="#订单">我的订单</a>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="index_lr3">
					<div class="dt index_icon">
						<a href="WebShop/">返回首页</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="orderinfo_header clearfix">
		<div class="orderinfo_wrapper">
			<div class="orderinfo_logo clearfix">
				<div class="orderinfo_left">
					<a href="Jindex.html"><img src="img/logo.php" />结算页</a>
				</div>
			</div>
			<div class="stepflex" id="#sflex03">
				<dl class="first done">
					<dt class="s-num">1</dt>
					<dd class="s-text">
						1.我的购物车<s></s><b></b>
					</dd>
				</dl>
				<dl class="normal doing">
					<dt class="s-num">2</dt>
					<dd class="s-text">
						2.填写核对订单信息<s></s><b></b>
					</dd>
				</dl>
				<dl class="normal last">
					<dt class="s-num">3</dt>
					<dd class="s-text">
						3.成功提交订单<s></s><b></b>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	<div class="orderinfo_conatiner">
		<div class="orderinfo_wrapper">
			<div class="orderinfo_title">
				<span>填写并核对订单信息</span>
			</div>
			<div class="orderinfo_check">
				<div class="orderinfo_site clearfix">
					<div class="orderinfo-title clearfix">
						<h3>收货人信息</h3>
						<div class="orderinfo_addsite">
							<a class="font-color" href="#">新增收货地址</a>
						</div>
					</div>
					<div class="orderinfo-site clearfix">
						<span class="orderinfo_addrname">${sessionScope.user.username }</span>
						<span class="orderinfo_addrsite">${sessionScope.user.address}</span>
						<span class="orderinfo_addrtel">${sessionScope.user.phonenum }</span>
						<a class="orderinfo_input" href="javascript:void(0);">编辑</a>
					</div>
				</div>
				<div class="hr"></div>
				<div class="orderinfo_msg">
					<div class="orderinfo-title clearfix">
						<h3>送货清单</h3>
						<div class="orderinfo_addsite">
							<a class="font-color" href="#">返回修改购物车</a>
						</div>
					</div>
					<div class="orderinfo_shoppinglist">
						<c:forEach items="${orders}" var="bean" varStatus="loop">
							<input type="hidden" id="buynum_${loop.count}" value="${bean.buynum}"/>
							<input type="hidden" id="buymoney_${loop.count}" value="${bean.buymoney}"/>
							<input type="hidden" id="product_id_${loop.count}" value="${bean.product_id}"/>
							<input type="hidden" id="user_id_${loop.count}" value="${bean.user_id}"/>
							<div class="orderinfo_goodsitem">
							<input type="hidden" />
								<div class="orderinfo_w clearfix">
									<div class="orderinfo_img">
										<a href="toproduct/${bean.id }"><img style="width:70px;heigth:70px" src="images/${products[loop.count-1].proimg}" /></a>
									</div>
									<div class="orderinfo_goodsname">
										<div class="orderinfo-goodstitle">
											<a href="toproduct/${bean.product_id }">${products[loop.count-1].prodesc }</a>
										</div>
										<div class="blank"></div>
										<strong>￥${bean.buymoney }</strong> <span>x${bean.buynum }</span>
										<c:if test="${nums ==0 }">
											<span>缺货</span>
										</c:if>
										<c:if test="${nums ==1 }">
											<span>有货</span>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="hr"></div>
			</div>
			<div class="orderinfo_summary clearfix">
				<div class="orderinfo_sumnum">
					<span><em class="color_red">${amount}</em>件商品，总商品金额：</span><span
						class="money">￥${summoney }</span>
				</div>
			</div>
			<div class="orderinfo_trade">
				<div class="text_right">
					<span>应付总额：<em class="money">￥${summoney }</em></span>
				</div>
				<div class="text_right">
					<span>寄送至：${sessionScope.user.address }</span> <span>收货人：${sessionScope.user.username }
						${sessionScope.user.phonenum }</span>
				</div>
			</div>
				<div class="clearfix">
					<button type="button" onclick="submitorder()" class="orderinfo_puton"></button>
				</div>

		</div>
	</div>
	<div class="index_footer">
		<div class="footer-2019">
			<p>
				<a href="#">关于我们</a><span>|</span> <a href="#">联系我们</a><span>|</span>
				<a href="#">联系客服</a><span>|</span> <a href="#">合作招商</a><span>|</span>
				<a href="#">营销中心</a><span>|</span> <a href="#">友情链接</a><span>|</span>
				<a href="#">隐私政策</a><span>|</span>
			</p>
		</div>
		<div class="copyright">
			<p>
				<a href="#">京公网安备 1xxxxxxxxxxxx8号</a><span>|</span><span>京ICP证xxxxxx号</span><span>|</span><span>xxxxxxx
					xxxxxxxxx号</span>
			</p>
			<p>
				<span>网络文化经营许可证京网文[xxxx]xxxx-xxx号</span><span></span><span>|</span><span>违法和不良信息举报电话：4006561155</span>
			</p>
		</div>
	</div>
</body>
</html>