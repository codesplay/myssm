<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>

<!-- 以下是基于jquery -->
<script src="js/jquery.ajaxupload.js"></script>
<link rel="stylesheet" href="layer/theme/default/layer.css" />
<script src="layer/layer.js"></script>
</head>
<body>
	
	
	<div style="padding: 0px; margin: 0px;">
		<ul class="breadcrumb" style="margin: 0px;">
			<li><a href="#">用户管理</a></li>
			<c:if test="${requestScope.edituser==null }">
				<li>添加用户</li>
			</c:if>
			<c:if test="${requestScope.edituser!=null }">
				<li>修改用户</li>
			</c:if>
			
		</ul>
	</div>
	
	<form action="adduser" method="post" class="form-horizontal" >
		<h5 class="page-header alert-info"
			style="padding: 10px; margin: 0px; margin-bottom: 5px;">基本信息</h5>
		<c:if test="${edituser.id!=null }">
			<form:hidden path="edituser.id"/>
			<input type="hidden" name="_method" value="PUT"/>
		</c:if>	
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">姓名</label>
					<div class="col-sm-9">
						<input type="text" name="username" class="form-control input-sm"
							placeholder="请输入姓名" value="${edituser.username}"/>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">初始密码</label>
					<div class="col-sm-9">
						<input type="text" name="password"
							class="form-control input-sm" placeholder="请输入密码" value="${edituser.password}"/>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">昵称</label>
					<div class="col-sm-9">
						<input type="text" name="nickname"
							class="form-control input-sm" placeholder="请输入昵称" value="${edituser.nickname}"/>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">手机号</label>
					<div class="col-sm-9">
						<input type="text" name="phonenum"
							class="form-control input-sm" placeholder="请输入手机号" value="${ edituser.phonenum}"/>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">邮箱</label>
					<div class="col-sm-9">
						<input type="text" name="email"
							class="form-control input-sm" placeholder="请输入邮箱" value="${edituser.email}"/>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">地址</label>
					<div class="col-sm-9">
						<input type="text" name="address"
							class="form-control input-sm" placeholder="请输入地址" value="${ edituser.address}"/>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="role" value="0"/>
		
		<div class="row">
			<div class="col-sm-3 col-sm-offset-4">
					<input type="submit" class="btn btn-success" value="保存" /> 
				<a class="btn btn-warning" href="${pageContext.request.contextPath}/userlist">返回上一级</a>
			</div>
		</div>
		
	</form>
	<c:if test="${requestScope.errors != null}">
		<div class="alert">
  			<button type="button" class="close" data-dismiss="alert">&times;</button>
  			<strong>Warning!</strong> 用户名已存在
		</div>
	</c:if>
</body>
</html>