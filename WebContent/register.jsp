<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="css/register.css"/>
	</head>
	<body>
		<div class="register">
			<div class="register_title">
				注册用户
			</div>
			<form action="RegisterServlet" method="post">
				<div class="register_name">
					<input type="text" name="username" required="required" placeholder="请输入账号" />
					<input type="password" name="password" required="required" placeholder="请输入密码" />
					<input type="text" name="name" required="required" placeholder="请输入姓名" />
					<input type="text" name="email" required="required" placeholder="请输入邮箱" />
					<input type="text" name="phone" required="required" placeholder="请输入手机号" />
					<input type="submit" value="提交">
					<button type="button" onclick="location.href='login.jsp';" class="">返回登录</button>
				</div>
			</form>
		</div>
	</body>
</html>
