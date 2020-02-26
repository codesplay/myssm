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
			<li>商品管理</li>
			<c:if test="${product.id==null }">
				<li>添加商品</li>
			</c:if>
			<c:if test="${product.id!=null }">
				<li>修改商品</li>
			</c:if>
		</ul>
	</div>
	<form action="${product.id == null?'addproduct':'updateproduct'}" method="post" enctype="multipart/form-data" class="form-horizontal">
		<c:if test="${product.id != null }"><input type="hidden" name="id" value="${product.id}" /></c:if>
		<h5 class="page-header alert-info"
			style="padding: 10px; margin: 0px; margin-bottom: 5px;">基本信息</h5>
		<div class="row">
		<!-- <input type="hidden" name="id"/> -->
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">商品描述</label>
					<div class="col-sm-4">
						<textarea rows="3" name="prodesc" >${product.prodesc}</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">商品图片</label>
						<div class="col-sm-4">
						<input class="btn-xs" id="upload-image" name="product.proimg" type="file" />
							<a id="img-href" href="images/${product.proimg}">
							</a>
						</div>
						<script type="text/javascript">
							$('#upload-image').change(function(){
								var file = this.files[0];
								var url = window.URL.createObjectURL(file);
								$('#img-href').attr('href',url);
								$('#img-href').html("<img style='width:150px;heigth:150px;' src='"+url+"'/>");
							})
						</script>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">商品分类</label>
					<div class="col-sm-4">
						<form:select class="form-control" path="product.procate" items="${requestScope.cate}" 
							itemLabel="catename" itemValue="id">
						</form:select>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">品牌</label>
					<div class="col-sm-4">
						<input type="text" name="probrand"
							class="form-control input-sm" placeholder="输入商品品牌" value="${product.probrand}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">型号</label>
					<div class="col-sm-4">
					<input type="text" name="proname"
							class="form-control input-sm" placeholder="输入商品型号" value="${product.proname}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">库存</label>
					<div class="col-sm-4">
						<input type="text" name="pronums"
							class="form-control input-sm" placeholder="输入商品数量" value="${product.pronums}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">价格</label>
					<div class="col-sm-4">
						<input type="text" name="price"
							class="form-control input-sm" placeholder="请输入价格" value="${product.price}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">特价</label>
					<div class="col-sm-4">
						<input type="text" name="sales"
							class="form-control input-sm" placeholder="如果无优惠输入0" value="${product.sales}" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<div class="form-group">
					<label class="col-sm-3 control-label">产地</label>
					<div class="col-sm-4">
						<input type="text" name="made"
							class="form-control input-sm" placeholder="请输入产地" value="${product.made}" />
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">
					<input type="submit" class="btn btn-success" value="保存" /> 
				<a class="btn btn-warning" href="${pageContext.request.contextPath}/products">返回上一级</a>
			</div>
		</div>
	</form>
	<c:if test="${requestScope.errors != null}">
		<div class="alert">
  			<button type="button" class="close" data-dismiss="alert">&times;</button>
  			<strong>Warning!</strong> 商品已存在
		</div>
	</c:if>
</body>
</html>