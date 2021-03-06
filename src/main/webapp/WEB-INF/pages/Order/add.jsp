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
			<li>订单管理</li>
			<c:if test="${product.id==null }">
				<li>订单商品</li>
			</c:if>
			<c:if test="${product.id!=null }">
				<li>修改订单</li>
			</c:if>
		</ul>
	</div>
	<form action="editorder" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${edit_order.id}" />
		<h5 class="page-header alert-info"
			style="padding: 10px; margin: 0px; margin-bottom: 5px;">基本信息</h5>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">收件人</label>
					<div class="col-sm-4">
						<input type="text" name="orderuser"
							class="form-control input-sm" placeholder="输入收件人" value="${edit_order.orderuser}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">收件人地址</label>
					<div class="col-sm-4">
						<input type="text" name="ordersite"
							class="form-control input-sm" placeholder="输入地址" value="${edit_order.ordersite}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">收件人电话</label>
					<div class="col-sm-4">
					<input type="text" name="orderphone"
							class="form-control input-sm" placeholder="输入电话" value="${edit_order.orderphone}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">收件人邮箱</label>
					<div class="col-sm-4">
						<input type="text" name="orderemail"
							class="form-control input-sm" placeholder="输入邮箱" value="${edit_order.orderemail}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">
					<input type="submit" class="btn btn-success" value="保存" /> 
				<a class="btn btn-warning" href="${pageContext.request.contextPath}/orders">返回上一级</a>
			</div>
		</div>
	</form>
	<c:if test="${requestScope.errors != null}">
		<div class="alert">
  			<button type="button" class="close" data-dismiss="alert">&times;</button>
  			<strong>Warning!</strong> 
		</div>
	</c:if>
</body>
</html>