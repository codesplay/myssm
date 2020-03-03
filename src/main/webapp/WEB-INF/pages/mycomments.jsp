<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的订单</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/custom-pagination.min.css" />
<script type="text/javascript" src="js/custom-pagination.min.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	width: 100%;
	font: 14px/150% tahoma, arial, Microsoft YaHei, Hiragino Sans GB,
		"\u5b8b\u4f53", sans-serif;
}

.order_conatiner {
	background-color: #f5f5f5;
}

table {
	border-collapse: collapse;
}

a {
	cursor: pointer;
}

.order_w {
	width: 1200px;
	margin: 0 auto;
}

.order_w a {
	color: #FFFFFF;
	font-size: 20px;
	font-family: "Microsoft YaHei";
	margin: 20px 0 0 6px;
	height: 22px;
}

.order_w img {
	vertical-align: middle;
	width: 100px;
	height: 100px;
}

.order_header {
	background: #e2231a;
	min-width: 1200px;
}

.order_wrapper {
	width: 990px;
	min-height: 500px;
	margin: 0 auto;
}

.order_title {
	color: #666;
	font-size: 12px;
	line-height: 50px;
	background: white;
	padding-left: 20px;
}

.order_icon a {
	line-height: 22px;
	font-size: 12px;
	color: #333;
	margin-top: 0px;
	margin-right: 8px;
	padding: 0;
}

.order_info {
	margin-top: 20px;
	background: #fff;
}

.order_tab {
	padding: 10px 10px 0 10px;
}

.order_tab a {
	display: inline-block;
	margin: 0;
}

.order_tab li {
	float: left;
	padding: 0 8px;
}

.order_search {
	float: right;
}

.order_input {
	float: left;
	width: 158px;
	height: 18px;
	line-height: 18px;
	padding: 2px 5px 1px;
}

.order_btn {
	position: relative;
	float: left;
	width: 52px;
	height: 23px;
	line-height: 99em;
	overflow: hidden;
	border: 1px solid #ddd;
	border-left: 0;
	text-align: center;
	background-color: #f7f7f7;
}

.order_btn b {
	position: absolute;
	left: 17px;
	top: 3px;
	display: inline-block;
	*display: inline;
	*zoom: 1;
	vertical-align: middle;
	width: 18px;
	height: 16px;
	overflow: hidden;
	background: url("img/order-icons.png") -8px -58px;
}

.time_txt {
	position: relative;
	float: left;
	z-index: 10;
	width: 138px;
}

.order_main {
	margin-top: 10px;
	padding: 0 10px;
}

.order_table {
	width: 100%;
}

.order_table th {
	height: 32px;
	line-height: 32px;
	text-align: center;
	background: #f5f5f5;
	color: #666;
	font-weight: 400;
}

.order_row {
	height: 20px;
}

.order_tr {
	background: #f5f5f5;
	height: 31px;
	line-height: 31px;
	color: #aaa;
	overflow: hidden;
}

.gap {
	float: left;
	height: 18px;
	line-height: 18px;
	padding: 2px 0 0;
	width: 14px;
}

.order_time {
	margin-right: 30px;
}

.order_goods {
	width: 340px;
	float: left;
	margin-right: 74px;
}

.order_pic {
	float: left;
	width: 60px;
	height: 60px;
	border: 1px solid #efefef;
	margin: 0 14px;
}

.order_msg {
	float: left;
	width: 240px;
	height: 36px;
	line-height: 18px;
	overflow: hidden;
	color: #333;
	text-align: left;
}

.order_product {
	display: inline-block;
}

.order_goodsnum {
	float: left;
	width: 40px;
	text-align: left;
	color: #aaa;
	font-family: verdana;
}

.tr td {
	border: 1px solid #e5e5e5;
	padding: 14px 0;
}

.order_width {
	width: 588px;
}

.order_user {
	text-align: center;
	font-size: 12px;
}

.order_user b {
	display: inline-block;
	width: 14px;
	height: 16px;
	*display: inline;
	*zoom: 1;
	background: url("img/order-icons.png") 0 -24px;
	vertical-align: middle;
	margin: 0 0 0 5px;
}

.txt {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	white-space: nowrap;
	overflow: hidden;
	max-width: 72px;
	text-overflow: ellipsis;
	vertical-align: middle;
}

.order_priceall {
	text-align: center;
}

.order_stat {
	margin: 0;
	text-align: center;
}

.order_pricenum, .order_statmsg {
	color: #AAA;
	font-size: 10px;
}

.order_buynow {
	padding: 2px 2px 3px;
	background: #f5f5f5;
	border: 1px solid #ddd;
	color: #333;
	border-radius: 2px;
	width: 85px;
	text-align: center;
}

.order_op {
	text-align: center;
}

.order_buynow:hover {
	border-color: red;
}

.order_page {
	width: 100%;
	height: 80px;
	margin-top: 20px;
}
</style>
<script type="text/javascript">
	function payorders(){
		$('#payorders').submit();
	}

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
							${sessionScope.user.username} <a href="remuser"
							class="index_login">退出登录</a>
						</a>
					</c:if></li>
				<li class="spacer"></li>
				<li class="index_lr2">
					<div class="dt">
						<a href="myorders">我的订单</a>
					</div>
				</li>
				<li class="spacer"></li>
				<li class="index_lr3">
					<div class="dt index_icon">
						<a href="/WebShop">返回首页</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="order_conatiner">
		<div class="order_header">
			<div class="order_w clearfix">
				<div class="order_headerleft" style="display: inline-block">
					<img src="img/logo.php" /><a href="Jindex.html">家用电器销售市场</a>
				</div>
				<div class="order_headerright" style="float: right">
					<div class="cheader_search" style="background: transparent">
						<div class="index_form" style="float: right;">
							<input style="border: 0; height: 28px; width: 180px" type="text"
								id="key" />
							<button style="background: #f7f7f7; color: #333">搜索</button>
						</div>
					</div>
					<div class="index_shopping">
						<div class="shopping_icon order_icon">
							<a href="mycart">我的购物车</a>
							<div class="lefticon"></div>
							<div class="righticon"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="order_wrapper">
			<div class="order_title">
				<h3>我的订单</h3>
			</div>
			<div class="order_info clearfix">
				<div class="order_tab clearfix">
					<ul>
						<li><a href="myorders">全部订单</a></li>
						<li><a href="#">待付款</a></li>
						<li><a href="#">待收货</a></li>
						<li><a style="border-bottom: red 2px solid" href="#">待评价</a></li>
					</ul>
					<div class="order_search">
						<input class="order_input" /> <a href="#" class="order_btn"><b></b></a>
					</div>
				</div>
				<div class="order_main">
					<table class="order_table">
						<thead>
							<tr>
								<th><div class="time_txt"></div>订单详情</th>
								<th>收货人</th>
								<th>金额</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:forEach items="${orderList}" var="bean" varStatus="prolist">
							<tbody>
								<tr class="order_row"></tr>
								<tr class="order_tr">
									<td colspan="5"><span class="gap"></span> <span
										class="order_time">${bean.ordertime }</span> <span
										class="order_num"> 订单号：<a href="#">${bean.ordernum }</a>
									</span></td>
								</tr>
								<tr class="tr">
									<td class="order_width">
										<div class="order_goods">
											<div class="order_pic">
												<img style="width: 70px; heigth: 70px"
													src="images/${productList[prolist.index].proimg}" />
											</div>
											<div class="order_msg">
												<a class="order_product" href="toproduct/${productList[prolist.index].id}">${productList[prolist.index].prodesc }</a>
											</div>
										</div>
										<div class="order_goodsnum">x${bean.buynum }</div>
									</td>
									<td rowspan="1" style="width: 110px"><div
											class="order_user">
											<span class="txt">${bean.orderuser }</span><b></b>
										</div></td>
									<td rowspan="1"><div class="order_priceall">
											<span class="order_pricenum">总额 ￥${bean.buymoney }</span>
										</div></td>
									<td rowspan="1"><div class="order_stat">
											<span class="order_statmsg">${bean.status == 0?'未付款':'已付款' }</span>
											<c:if test="${bean.status<0 }">已取消</c:if>
										</div></td>
									<td rowspan="1"><div class="order_op">
											<c:if test="${bean.status == 1}">
												<div>
													<form action="editcomment" method="post">
														<input type="hidden" name="id" value="${bean.id}">
														<a class="order_buynow" href="javascript:void(0);"><input type="submit" style="cursor: pointer;background:#fff;margin: 0;padding: 0;border: 1px solid transparent;outline: none" value="立即评价"/></a>
													</form>
												</div>
											</c:if>
											<c:if test="${bean.status == 2 }">
												<div>
													<span>已评价</span>
												</div>
											</c:if>
										</div></td>
								</tr>
								</c:forEach>
							</tbody>
					</table>
					<div class="order_page">
						<div id="page" class="page"></div>
					</div>
					<script type="text/javascript">
						// 4.调用插件
						var box = new CustomPagination('#page', {
							total : 1,//总页数
							changePage : function(pageNum) {//切换页码成功回调
								console.log('当前页码：' + pageNum)
							}
						});
					</script>
				</div>
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
