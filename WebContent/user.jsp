<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>图书借阅系统</title>
		<link rel="stylesheet" type="text/css" href="css/user.css"/>
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.css"/>
	</head>
	<body>
		<div class="user_frame">
			<div class="top">
				<a>读者端图书借阅系统</a>
				<button type="button" onclick="location.href='login.jsp';" class="">退出</button>
			</div>
			<div class="container">
				<div class="content">
					<ul>
						<li>
							<a href="select.jsp">图书查询<i class="fa fa-chevron-right"></i></a>
						</li>
						<li>
							<a href="borrow.jsp">借阅信息<i class="fa fa-chevron-right"></i></a>
						</li>
						<li>
							<a href="history.jsp">借阅历史<i class="fa fa-chevron-right"></i></a>
						</li>
					</ul>
				</div>
				<div class="row">
					<div class="title">
						 &nbsp;&nbsp;&nbsp;图书借阅系统
					</div>
					<div class="row_content">
						<ul>
							<li>本系统为javaweb编写的图书馆管理系统，编译工具为eclipse，使用mysql数据库</li>
							<br>
							<li>读者可查询图书信息</li>
							<br>
							<li>借阅或者归还书籍</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
