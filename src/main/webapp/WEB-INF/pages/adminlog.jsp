<%--
  Created by IntelliJ IDEA.
  User: IMFINE
  Date: 2020/2/9
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 100%;
}

.login_header {
	width: 970px;
	height: 100px;
	margin: 0 auto;
	line-height: 100px;
	font-size: 30px;
}

.login_logo {
	width: 100px;
	height: 100px;
}

.login_conatiner {
	height: 570px;
	min-width: 970px;
	margin: 0 auto;
}

.login_wrapper {
	width: 970px;
	height: 100%;
	margin: 0 auto;
}

.login_main {
	float: right;
	position: relative;
	width: 360px;
	margin-top: 50px;
	background: #fff;
	box-shadow: 0 0 2px #ececec;
	font-family: "Microsoft Yahei";
}

.login_main-tab {
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	overflow: hidden;
	border-bottom: 1px solid #eee;
	text-align: center;
	color: #f60;
}

.login-passwordbox, .login-usernamebox {
	position: relative;
	margin-bottom: 20px;
	clear: both;
}

.input-password, .input-username {
	position: relative;
	border: 1px solid #ddd;
	color: #999;
	padding: 0 32px 0 36px;
	height: 36px;
	overflow: hidden;
}

.input-password input, .input-username input {
	display: block;
	width: 100%;
	height: 100%;
	line-height: 36px;
	padding: 0 32px 0 36px;
	border: 0;
	font-size: 14px;
	margin-left: -36px;
}

.input-password label, .input-username label {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	padding-left: 36px;
	line-height: 36px;
	font-size: 14px;
	color: #ccc;
	cursor: text;
	background: #fff;
}

.username-icon {
	background: url("img/user1.png") -123px -67px no-repeat;
}

.password-icon {
	background: url("img/user1.png") 0 -108px no-repeat;
}

.icon {
	width: 36px;
	height: 36px;
	position: absolute;
	top: 0;
	left: 0;
}
</style>
<body>
	<div class="login_header">
		<img class="login_logo" style="vertical-align: bottom"
			src="img/logo.php">
		<p style="display: inline-block">家用电器销售市场</p>
	</div>
	<div class="login_conatiner"
		style="background-image: url('img/loginback.jpg'); background-repeat: no-repeat; background-position: center">
		<div class="login_wrapper">
			<div class="login_box"
				style="width: 360px; float: right; margin-top: 100px;">
				<div class="login_form">
					<div class="login_title">管理员登录</div>
					<form:form id="form-postuser" action="admin" method="post" modelAttribute="errors">

						<div class="form_text_ipt">
							<input id="login-username" name="username" type="text"
								placeholder="手机号/用户名">
						</div>
						<div class="ececk_warning">
							<span>手机号/用户名不能为空</span>
						</div>
						<c:if test="${requestScope.errors == -1}">
							<div class="ececk_warning" style="display: block">
								<span>用户名错误</span>
							</div>
						</c:if>
						<div class="form_text_ipt">
							<input id="login-password" name="password" type="password"
								placeholder="密码">
						</div>
						<div class="ececk_warning">
							<span>密码不能为空</span>
						</div>
						<c:if test="${requestScope.errors == -2}">
							<div class="ececk_warning" style="display: block">
								<span>密码错误</span>
							</div>
						</c:if>
						<div class="form_check_ipt">
							<div class="left check_left">
								<label><input name="" type="checkbox">下次自动登录</label>
							</div>
							<div class="right check_right">
								<a href="#">忘记密码</a>
							</div>
						</div>
						<div class="form_btn">
							<button id="login-form" type="button">登录</button>
						</div>
					</form:form>
					<div class="other_login">
						<div class="left other_left">
							<span>其它登录方式</span>
						</div>
						<div class="right other_right">
							<a href="#"><i class="fa fa-qq fa-2x"></i></a> <a href="#"><i
								class="fa fa-weixin fa-2x"></i></a> <a href="#"><i
								class="fa fa-weibo fa-2x"></i></a>
						</div>
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
