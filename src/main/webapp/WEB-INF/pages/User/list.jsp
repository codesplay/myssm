<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<li><a href="#">用户管理</a></li>
			<li>用户列表</li>
		</ul>
	</div>
	<form class="form-inline" >
		<div class="row alert alert-info" style="margin: 0px; padding: 3px;">
			<a class="btn btn-success" href="addpage">添加用户</a>

		</div>
		<div class="row" style="padding: 15px; padding-top: 0px;">
			<table class="table  table-condensed table-striped">
				<tr>
					<th>id</th>
					<th>用户名</th>
					<th>昵称</th>
					<th>身份</th>
					<th>手机号</th>
					<th>邮箱</th>
					<th>地址</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${userlist}" var="bean">
					<tr>
						<td>${bean.id}</td>
						<td>${bean.username}</td>
						<td>${bean.nickname}</td>
						<c:if test="${bean.role==0}">
							<td>普通用户</td>
						</c:if>
						<c:if test="${bean.role==1}">
							<td>管理员</td>
						</c:if>
						<td>${bean.phonenum}</td>
						<td>${bean.email}</td>
						<td>${bean.address}</td>
						<th>
							<a class="btn btn-xs btn-success" href="editpage?id=${bean.id}">编辑</a>
							<a class="btn btn-xs btn-danger" href="deluser?id=${bean.id}">删除</a>
						</th>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>