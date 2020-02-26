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
<title>个人注册</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 100%;
	height: 100%;
	background: #eaeaea
}
</style>
<body>
	<div class="login_header">
		<img class="login_logo" style="vertical-align: bottom"
			src="img/logo.php">
		<p style="display: inline-block">家用电器销售市场</p>
	</div>
	<div class="content">
		<div class="login_box" style="border-top: 3px solid #f90;">
			<div class="login_form">
				<div class="login_title">注册</div>
				<form id="Jreg-postform" action="regist" method="post" >
					<input name="address" type="hidden" />
					<input name="id" type="hidden" />					
					<input name="nickname" type="hidden" /> 
					<input name="email" type="hidden" />
					<input name="role" type="hidden" value="0"/>
					<div id="Jreg-inputs">
					<div class="form_text_ipt">
						<input id="Jreg-username" name="username" type="text"
							placeholder="用户名">
					</div>
					<div class="ececk_warning">
						<span>用户名不能为空</span>
					</div>
					<c:if test="${requestScope.errors==1}">
						<div class="ececk_warning" style="display:block">
							<span>用户名已存在</span>
						</div>
					</c:if>
					<div class="form_text_ipt">
						<input id="Jreg-userphone" class="userphone" name="phonenum"
							type="text" placeholder="手机号">
					</div>
					<div class="ececk_warning">
						<span>手机号不能为空</span>
					</div>
					<div class="ececk_warning">
						<span>手机号输入不正确</span>
					</div>
					<div class="form_text_ipt">
						<input id="password" name="password"
							type="password" placeholder="密码">
					</div>
					<div class="ececk_warning">
						<span>密码不能为空</span>
					</div>
					<div class="form_text_ipt">
						<input id="repassword" name="repassword" type="password" placeholder="重复密码">
					</div>
					<div class="ececk_warning">
						<span>密码不能为空</span>
					</div>
					<div id="check_repassword" class="ececk_warning">
						<span>密码输入不一致</span>
					</div>
					</div>
					<div class="form_btn">
						<button id="Jreg-post" type="button" href="regist">注册</button>
					</div>
					<div class="form_reg_btn">
						<span>已有帐号？</span><a href="log" style="color: #3cf;">马上登录</a>
					</div>
				</form>
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