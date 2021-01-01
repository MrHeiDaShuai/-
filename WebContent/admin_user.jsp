<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,dao.*,servlet.*,bean.*,util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书借阅系统</title>
<link rel="stylesheet" type="text/css" href="css/admin_user.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome-4.7.0/css/font-awesome.css" />
</head>
<body>
	<%
		AdminBean admin = new AdminBean();
		String aid = (String) session.getAttribute("aid");
		AdminDao admindao = new AdminDao();
		admin = admindao.get_AidInfo2(aid);
	%>
	<div class="admin_user_frame">
		<div class="top">
			<a>欢迎使用图书借阅系统</a>
			<button type="button" onclick="location.href='login.jsp';" class="">退出</button>
		</div>
		<div class="container">
			<div class="content">
				<ul>
					<li><a href="admin_book.jsp">图书管理<i
							class="fa fa-chevron-right"></i></a></li>
					<li><a href="admin_user.jsp">读者管理<i
							class="fa fa-chevron-right"></i></a></li>
					<li><a href="admin_booktype.jsp">图书分类管理<i
							class="fa fa-chevron-right"></i></a></li>
					<li><a href="admin_borrow.jsp">图书借阅信息<i
							class="fa fa-chevron-right"></i></a></li>
					<li><a href="admin_history.jsp">图书归还信息<i
							class="fa fa-chevron-right"></i></a></li>
				</ul>
			</div>
			<div class="row">
				<div class="title">&nbsp;&nbsp;&nbsp;读者管理</div>
				<div class="row_add">
						<button type="button" id="addBtn">添加读者</button>
				</div>
			</div>
			<div class="addModal">
				<div class="modal-header">
					<p class="title">添加新读者</p>
					<p class="close">×</p>
				</div>
				<div class="modal-content">
					<form action="AddUserServlet" method="post">
						<input type="text" name="username" id="username" placeholder="请输入账号" required="required"/>
						<input type="text" name="name" id="name" placeholder="请输入姓名" required="required"/>
						<input type="text" name="email" id="email" placeholder="请输入邮箱" required="required"/>
						<input type="text" name="phone" id="phone" placeholder="请输入手机号" required="required"/>
						<input type="text" name="password" id="password" placeholder="请输入密码" required="required"/>
						<input type="text" name="lend_num" id="lend_num" placeholder="请输入可借阅天数" required="required"/>
						<input type="text" name="max_num" id="max_num" placeholder="请输入最大可借数" required="required"/>
						<input type="submit" placeholder="提交" />
					</form>

				</div>
				<div class="modal-footer">
					<button class="close btn">关闭<bttton>
				</div>
			</div>
			<div class="changeModal">
				<div class="modal-header">
					<p class="title">添加新读者</p>
					<p class="close2">×</p>
				</div>
				<div class="modal-content">
					<form action="UpdateUserServlet" method="post">
						<input type="hidden" id="updateaid" name="aid">
						<input type="text" name="username" id="username" placeholder="请输入账号" required="required"/>
						<input type="text" name="name" id="name" placeholder="请输入姓名" required="required"/>
						<input type="text" name="email" id="email" placeholder="请输入邮箱" required="required"/>
						<input type="text" name="phone" id="phone" placeholder="请输入手机号" required="required"/>
						<input type="text" name="password" id="password" placeholder="请输入密码" required="required"/>
						<input type="text" name="lend_num" id="lend_num" placeholder="请输入可借阅天数" required="required"/>
						<input type="text" name="max_num" id="max_num" placeholder="请输入最大可借数" required="required"/>
						<input type="submit" placeholder="提交" />
					</form>
				</div>
				<div class="modal-footer">
					<button class="close2 btn">关闭<bttton>
				</div>
			</div>
		</div>
		<div class="admin_user_table">
			<table id="datalist" class="data_table" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>账号</th>
						<th>姓名</th>
						<th>邮箱</th>
						<th>手机号</th>
						<th>可借阅天数</th>
						<th>最大可借数</th>
						<th>操作</th>
					</tr>
				</thead>
				<%
					ArrayList<AdminBean> data2 = new ArrayList<AdminBean>();
					data2 = (ArrayList<AdminBean>) request.getAttribute("data");
					if (data2 == null) {

						data2 = (ArrayList<AdminBean>) admindao.get_ListInfo();
					}
					for (AdminBean bean : data2) {
				%>
				<tbody>
					<td><%=bean.getUsername()%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getEmail()%></td>
					<td><%=bean.getPhone()%></td>
					<td><%=bean.getLend_num()%></td>
					<td><%=bean.getMax_num()%></td>
					<td><button type="button" class="changeBtn" id="btn_update"
			onclick="showInfo2(<%=bean.getAid()%>)">修改</button>
						<button type="button" class="deleteBtn"
							onclick="deleteuser(<%=bean.getAid()%>)">删除</button></td>
				</tbody>
				<%
					}		
				%>
			</table>
		</div>
	</div>
	<div class="mask"></div>
	<script type="text/javascript">
	function showInfo2(aid) {
        document.getElementById("updateaid").value = aid;
        var changeBtn=document.getElementById("btn_update");
		var changeModal=document.getElementsByClassName("changeModal")[0];
		var closes2 = document.getElementsByClassName("close2");
		var mask = document.getElementsByClassName("mask")[0];
		changeModal.style.display = "block";
		mask.style.display = "block";
    }
	function deleteuser(aid) {
    	con=confirm("是否删除?"); 
    	if(con==true){
    		location.href = "DeleteUserServlet?aid="+aid;
    	}
    }
	window.onload=function(){
		// 获取需要使用到的元素
		var addBtn = document.getElementById("addBtn");
		var changeBtn=document.getElementById("btn_update");
		var addModal = document.getElementsByClassName("addModal")[0];
		var changeModal=document.getElementsByClassName("changeModal")[0];
		var closes = document.getElementsByClassName("close");
		var closes2 = document.getElementsByClassName("close2");
		var mask = document.getElementsByClassName("mask")[0];
		addBtn.onclick = show;
		closes[0].onclick = close;
		closes[1].onclick = close;
		closes2[0].onclick = close2;
		closes2[1].onclick = close2;
		function show(){
			addModal.style.display = "block";
			mask.style.display = "block";
		}
		function close(){
			addModal.style.display = "none";
			mask.style.display = "none";
		}
		
		function close2(){
			changeModal.style.display = "none";
			mask.style.display = "none";
		}
	}
	</script>
</body>
</html>
