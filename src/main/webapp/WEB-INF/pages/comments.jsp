<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>订单评价</title>
    <link rel="stylesheet" href="css/common.css"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
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
}

.order_w {
	width: 1200px;
	margin: 0 auto;
}

.order_conatiner {
	background-color: #f5f5f5;
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

.comments_conatiner {
	width: 100%;
	margin-top: 10px;
	background-color: white;
}

.comments_right {
	position: relative;
	width: 50%;
	float: right;
	margin-top: 20px;
}

i {
	position: absolute;
	bottom: 8px;
	right: 6px;
}

.comments_com {
	margin-right: 20px;
}

.comments_puton {
	float: right;
	width: 135px;
	height: 36px;
	cursor: pointer;
	background-color: red;
	color: white;
	font-size: 18px;
	overflow: hidden;
	margin: 10px 10px;
	border: 0;
}

.comments_img {
	float: left;
}

.comments_img img{
	width: 180px;
	height: 180px;
	vertical-align: middle;
}

.comments_pro {
	margin-top: 10px;
	float: left;
	padding: 10px;
}

.comments_desc {
	width: 280px;
	float: right;
	font-size: 14px;
}

.comments_desc li {
	margin-top: 5px;
}

.comments_prodesc {
	overflow: hidden;
}

.comments_wrapper {
	width: 990px;
	min-height: 390px;
	margin: 0 auto;
}
</style>

<script type="text/javascript">
	$(function() {
		var text = $('#qianyue-area').val();
		var len = text.length;
		$('#qianyue-area').next().find('span').html(len);
		$('textarea').keyup(function() {
			var text = $(this).val();
			len = text.length;
			if (len > 100) {
				return false;
			}
			$(this).next().find('span').html(len);
		})
	});
</script>
<body>
	<div class="index_header">
		<div class="index_wrapper">
			<ul class="index_wr">
				<li class="index_lr1">
				<c:if test="${sessionScope.user.username == null}">
						<a href="log" class="index_login">你好，请登录</a>
                	&nbsp;&nbsp;<a href="reg" class="index_regist">免费注册</a>
					</c:if> <c:if test="${sessionScope.user.username != null}">
						<a href="#" class="index_login"
							style="color: #ccc; font-size: 15px">
							${sessionScope.user.username} 
							<a href="remuser" class="index_login">退出登录</a>
						</a>
					</c:if>
				</li>
				<li class="spacer"></li>
				<li class="index_lr3">
					<div class="dt index_icon">
						<a href="Jindex.html">返回首页</a>
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
							<a href="cart.html">我的购物车</a>
							<div class="lefticon"></div>
							<div class="righticon"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="comments_wrapper clearfix">
			<div class="order_title">
				<h3>商品评价</h3>
			</div>
			<div class="comments_conatiner">
				<div class="comments_pro clearfix">
					<div class="comments_img">
						<img src="images/${product.proimg }" />
					</div>
					<div class="comments_desc">
						<ul class="dl-horizontal">
							<li class="comments_prodesc">商品：${product.prodesc }</li>
							<li>价格：${product.sales==0?product.price:product.sales}</li>
							<li>品牌：${product.probrand}</li>
						</ul>
					</div>
				</div>
				<div class="comments_com clearfix">
					<div class="clearfix">
						<div class="comments_right">
							<textarea form="comments" name="comments" id="qianyue-area"
								style="width: 100%; height: 10rem; resize: none; font-size: 16px;"
								maxlength="100" placeholder="请输入评价"></textarea>
							<i><span class="count-change">0</span>/100</i>
						</div>
					</div>
					<div>
						<form action="addcomment" method="post" id="comments">
							<input type="hidden" name="username" value="${sessionScope.user.name }"/>
							<input type="hidden" name="product_id" value="${product.id}" /> 
							<input type="hidden" name="id" value=""/>
							<input type="hidden" name="user_id" value="${user_id}" />
							<input type="hidden" name="order_id" value="${order_id}" />
							<button class="comments_puton" type="submit">提交评价</button>
						</form>
					</div>
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