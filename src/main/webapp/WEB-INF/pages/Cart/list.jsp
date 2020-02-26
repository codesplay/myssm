<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>

</head>

<body>
	<div style="padding: 0px; margin: 0px;">
		<ul class="breadcrumb" style="margin: 0px;">
			<li><a href="#">购物车管理</a></li>
			<li>购物车列表</li>
		</ul>
	</div>
	<form class="form-inline">
		<div class="row" style="padding: 15px; padding-top: 0px;">
			<table class="table  table-condensed table-striped">
				<tr>	
					<th>id</th>
					<th>用户</th>
					<th>商品名称</th>
					<th>商品图片</th>
					<th>商品库存</th>
					<th>购买数量</th>
					<th>商品原价</th>
					<th>商品特价</th>
					<th>总价</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${carts}" var="bean" varStatus="loop">
					<tr>
						<td>${bean.id}</td>
						<td>${user[loop.count-1]}</td>
						<td>${product[loop.count-1].prodesc}</td>
						<td>
							<a href="${pageContext.request.contextPath}/images/${product[loop.count-1].proimg}" target="_blank">${product[loop.count-1].proimg}</a>
						</td>
						<td>${product[loop.count-1].pronums}</td>
						<td>${bean.num}</td>
						<td>${product[loop.count-1].price}</td>
						<td>${product[loop.count-1].sales}</td>
						<td>${bean.buymoney}</td>
						<td><a class="btn btn-xs btn-danger" href="${pageContext.request.contextPath}/editcartpage?id=${bean.id}">编辑</a>
						<a class="btn btn-xs btn-danger" href="delcart/${bean.id}">删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>