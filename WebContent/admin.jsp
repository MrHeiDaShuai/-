<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>图书借阅系统</title>
		<link rel="stylesheet" type="text/css" href="css/admin.css"/>
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.css"/>
	</head>
	<body>
		<div class="admin_frame">
			<div class="top">
				<a>管理员端图书借阅系统</a>
				<button type="button" onclick="location.href='login.jsp';" class="">退出</button>
			</div>
			<div class="container">
				<div class="content">
					<ul>
						<li>
							<a href="admin_book.jsp">图书管理<i class="fa fa-chevron-right"></i></a>
						</li>
						<li>
							<a href="admin_user.jsp">读者管理<i class="fa fa-chevron-right"></i></a>
						</li>
						<li>
							<a href="admin_booktype.jsp">图书分类管理<i class="fa fa-chevron-right"></i></a>
						</li>
						<li>
							<a href="admin_borrow.jsp">图书借阅信息<i class="fa fa-chevron-right"></i></a>
						</li>
						<li>
							<a href="admin_history.jsp">图书归还信息<i class="fa fa-chevron-right"></i></a>
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
							<li>管理员可查询修改管理图书信息</li>
							<br>
							<li>查询修改管理读者信息</li>
							<br>
							<li>查询借阅归还信息</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
