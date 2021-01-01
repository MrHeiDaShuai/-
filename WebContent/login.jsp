<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>


<body>
	<div class="title">
		<p>欢迎登录图书借阅系统</p>
	</div>
	<form action="LoginServlet" method="POST">
		<div class="login_content">
			<div class="login_name">
				<label>用户名:</label> <input name="username" type="text"
					required="required">
			</div>
			<div class="login_password">
				<label>密&nbsp码:</label> <input name="password" type="password"
					required="required">
			</div>
			<div class="registButton">
				<span> 没有账号请<a style="color: royalblue" href="register.jsp">注册</a>
				</span>
			</div>
			<div class="login_sButton">
				<input type="submit" value="登录" />
			</div>
			<div class="login_rButton">
				<input type="reset" value="重置" />
			</div>
		</div>


	</form>
</body>
</html>
