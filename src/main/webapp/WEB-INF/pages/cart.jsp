<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>我的购物车</title>
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
	font: 14px/150% tahoma, arial, Microsoft YaHei, Hiragino Sans GB,
		"\u5b8b\u4f53", sans-serif;
}

.cart_conatiner {
	position: relative;
	margin-top: 30px;
	margin-bottom: 70px;
}

.cart_w {
	width: 990px;
	margin: 0 auto;
}

.cart_conatiner-header div, em {
	color: #E2231A;
	float: left;
	position: relative;
	font-weight: 700;
	font-size: 16px;
	height: 26px;
	line-height: 26px;
	text-align: center;
	padding-bottom: 4px;
	border-bottom: #E2231A 1px solid;
}

.cart_wrapper {
	background: #fff;
	margin-bottom: 20px;
}

.cart_tab {
	display: block;
	height: 32px;
	line-height: 32px;
	margin: 0 0 10px;
	padding: 5px 0;
	background: #f3f3f3;
	border: 1px solid #e9e9e9;
	border-top: 0;
	position: relative;
}

.cart_checkall {
	height: 18px;
	line-height: 18px;
	padding-top: 7px;
	width: 122px;
	padding-left: 11px;
}

.column {
	float: left;
}

.cart_checkall input {
	margin: 0 8px;
}

.cart_font {
	font-size: 12px;
	color: #666;
}

.cart_check {
	margin-top: 20px;
	vertical-align: middle;
}

.cart_blank {
	width: 200px;
	height: 32px;
}

.cart_price {
	width: 180px;
	text-align: right;
}

.cart_numall {
	width: 100px;
	text-align: right;
	padding-right: 30px;
}

.cart_priceall {
	width: 100px;
	text-align: center;
}

.cart_op {
	width: 70px;
	text-align: right;
}

.cart_items {
	margin-top: 30px;
	border-top: #666 1px solid;
}

.cart_goods {
	padding-left: 40px;
}

.cart_checkitem {
	margin: 5px 0 0 8px;
}

.goods_item img {
	vertical-align: middle;
}

.cart_name {
	display: inline-block;
}

.cart_name a {
	display: inline-block;
	height: 40px;
	text-decoration: none;
	width: 197px;
	overflow: hidden;
	margin-top: 10px;
}

.cell {
	width: 100px;
	display: inline-block;
	color: #999;
}

.cart_buynum {
	display: inline-block;
	width: 30px;
	height: 16px;
	float: left;
	text-align: center;
}

.cartnum {
	display: inline-block;
	float: left;
	width: 14px;
	height: 18px;
	line-height: 18px;
	text-align: center;
	background: #f1f1f1;
	color: #666;
	border: 1px solid #ccc;
	margin: 0;
	text-decoration: none;
}

.cart_formitem {
	padding-bottom: 10px;
	border-bottom: #ccc 1px solid;
}

.cart_fixed {
	position: fixed;
	z-index: 999;
	bottom: 0;
	width: 100%;
	height: 50px;
	background: whitesmoke;
	border-top: #c0c0c0 1px solid;
}

.cart_fixedw {
	position: relative;
	width: 990px;
	margin: 0 auto;
}

.cart_fixedcheckall {
	position: absolute;
	left: 0;
}

.cart_fixedsel {
	position: absolute;
	right: 0;
	width: 830px;
	height: 50px;
	text-align: right;
	display: inline-block;
}

.cart_payfor {
	height: 50px;
	width: 100px;
	line-height: 50px;
	text-align: center;
	font-size: 18px;
	font-family: "Microsoft YaHei";
	background: #e54346;
	float: right;
}

.cart_fixedall {
	margin-right: 120px;
}

.item_money {
	display: inline-block;
}
</style>
<script type="text/javascript">
        function submitorder() {
        /* 	alert("ok"); */
            var orderArray = new Array();
            var index;
            /* var carts = "${requestScope.carts}";
            alert(carts[1]); */
        	var list = document.getElementsByClassName('cart_check');
            for(index=0;index<list.length;index++){
            	if($(list[index]).prop("checked")){
                	orderArray.push({id:null,orderuser:0,orderemail:0,orderphone:0,product_id: $('#product_id_'+(index+1)).val(), buynum: $('#buy_num'+(index+1)).val(), buymoney: $('#buymoney_'+(index+1)).attr('value'),status:0,ordersite:0,user_id:$('#user_id_'+(index+1)).val(),ordertime:0,ordernum:0});
            	}
            }
            //document.location.href = "postorder?orders=" + escape(JSON.stringify(orderArray));
           	$.ajax({
                url: "addorder",
                type: "POST",
                //data: JSON.stringify(customerArray),    //将Json对象序列化成Json字符串，JSON.stringify()原生态方法
                data:JSON.stringify(orderArray),            //将Json对象序列化成Json字符串，toJSON()需要引用jquery.json.min.js
                contentType : 'application/json;charset=UTF-8', //设置请求头信息
                success: function(data){
                	window.location.href = "/WebShop/postorder";
                }, 
                error: function(res){
                	alert(res);
                }
            });
        }
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
							<input type="hidden" id="u_name" value="${sessionScope.user.username}"/>${sessionScope.user.username} 
						</a>
						<a href="remuser" class="index_login">退出登录</a>
					</c:if></li>
				<li class="spacer"></li>
				<li class="index_lr2">
					<div class="dt">
						<a target="_blank" href="myorders">我的订单</a>
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
	<div class="cart_conatiner index_conatiner">
		<div class="cart_cheader index_cheader">
			<div class="cheader_logo">
				<img src="img/logo.php" />
				<div class="logo_w">家用电器销售市场</div>
			</div>
			<div class="cheader_search cart_search" style="float: right;">
				<div class="index_form cart_form">
					<input type="text" id="key" />
					<button>搜索</button>
				</div>
			</div>
		</div>
		<div class="cart_conatiner">
			<div class="cart_conatiner-header cart_w clearfix">
				<div>全部商品</div>
			</div>
			<div class="cart_wrapper">
				<div class="cart_w">
					<div class="cart_tab">
						<div class="cart_checkall cart_font column">
							<input class="checkall" type="checkbox" />全选
						</div>
						<div class="cart_checkall cart_font column">商品</div>
						<div class="column cart_blank"></div>
						<div class="cart_price cart_font column">单价</div>
						<div class="cart_numall cart_font column">数量</div>
						<div class="cart_priceall cart_font column">小计</div>
						<div class="cart_op cart_font column">操作</div>
					</div>
					<div class="cart_items">
						<div class="cart_list">
							<c:forEach items="${carts}" var="bean" varStatus="loop">
								<div class="cart_formitem clearfix">
									<div class="cart_checkitem cart_font column">
										<input class="cart_check" id="checkbox${loop.count}" name="${loop.count}" type="checkbox" />
									</div>
									<input type="hidden" id="product_id_${loop.count}" value="${ bean.product_id}"/>
									<input type="hidden" id="user_id_${loop.count}" value="${bean.user_id }"/>
									<div class="cart_goods">
										<div class="goods_item clearfix">
											<div style="margin-top: 10px; width: 310px" class="column">
												<div style="display: inline-block">
													<img
														style="vertical-align: bottom; width: 80px; heigth: 80px"
														src="images/${products[loop.count-1].proimg }" />
												</div>
												<div class="cart_name cart_font clearfix">
													<a href="toproduct/${bean.product_id }">${products[loop.count-1].prodesc }</a>
												</div>
											</div>
											<div class="cart_blank cell" style="width: 250px"></div>
											<div class="item_price cell clearfix">
												￥
												<div class="item_money" id="proprice_${loop.count}" value="${products[loop.count-1].sales != 0?products[loop.count-1].sales:products[loop.count-1].price}">${products[loop.count-1].sales != 0?products[loop.count-1].sales:products[loop.count-1].price}</div>
											</div>
											<div class="items_nums cell clearfix"
												style="margin-top: 20px">
												<div>
													<a href="javascript:;" class="cart_subnum cartnum reduce"
														onclick="reduce('#buy_num${loop.count}')">-</a> <input
														class="product_buynum cart_buynum" id="buy_num${loop.count}"
														data-max="200" value='${bean.num}'/> <a
														href="javascript:;" class="cart_addnum cartnum"
														onclick="add('#buy_num${loop.count}')">+</a>
												</div>
											</div>
											<div class="items_priceall cell clearfix" id="buymoney_${loop.count}" value="${bean.buymoney}">￥${bean.buymoney}</div>
											<div class="items_op"
												style="float: right; margin-top: 20px; padding-right: 24px">
												<a>删除</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="cart_fixed">
		<div class="cart_fixedw">
			<div class="cart_checkall cart_font cart_fixedcheckall">
				<input class="checkallfixed" type="checkbox"
					onclick="check('.checkallfixed')" />全选
			</div>
			<div class="cart_fixedsel">
				<div class="cart_payfor">
					<a href="javascript:;" style="color: #fff;" onclick="submitorder()">去结算</a>
				</div>
				<div class="cart_fixedall">
					<div style="color: #999;">
						已选择
						<div style="display: inline-block; color: #E2231A" id="payfor_num">0</div>
						件商品
					</div>
					<div style="font-size: 16px; color: #E2231A; font-weight: 700;">
						总价：￥
						<div style="display: inline-block" id="payfor_money">0</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
