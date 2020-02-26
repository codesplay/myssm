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
			<li><a href="#">商品管理</a></li>
			<li>商品列表</li>
		</ul>
	</div>
	<form class="form-inline">
		<div class="row alert alert-info" style="margin: 0px; padding: 3px;">
			<a class="btn btn-success" href="addproduct">添加商品</a>

		</div>
		<div class="row" style="padding: 15px; padding-top: 0px;">
			<table class="table  table-condensed table-striped">
				<tr>	
					<th>id</th>
					<th>desc</th>
					<th>图片</th>
					<th>商标</th>
					<th>产品名称</th>
					<th>种类</th>
					<th>库存</th>
					<th>价格</th>
					<th>特价</th>
					<th>产地</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${products}" var="bean">
					<tr>
						<td>${bean.id}</td>
						<td>${bean.prodesc}</td>
						<td>
							<a href="${pageContext.request.contextPath}/images/${bean.proimg}" target="_blank">${bean.proimg}</a>
						</td>
						<td>${bean.probrand}</td>
						<td>${bean.proname}</td>
						<td>${bean.procate}</td>
						<td>${bean.pronums}</td>
						<td>${bean.price}</td>
						<td>${bean.sales}</td>
						<td>${bean.made}</td>
						<td><a class="btn btn-xs btn-danger" href="${pageContext.request.contextPath}/editproduct?i=${bean.id}">编辑</a>
						<a class="btn btn-xs btn-danger" href="delproduct/${bean.id}">删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>