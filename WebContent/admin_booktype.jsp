<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.*,dao.*,servlet.*,util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书借阅系统</title>
<link rel="stylesheet" type="text/css" href="css/admin_booktype.css" />
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
	<div class="admin_booktype_frame">
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
				<div class="title">&nbsp;&nbsp;&nbsp;图书分类管理</div>
				<div class="row_add">
					<button type="button" class="addBtn" id="addBtn">添加分类</button>
				</div>
			</div>
			<div class="addModal">
				<div class="modal-header">
					<p class="title">添加新图书分类</p>
					<p class="close">×</p>
				</div>
				<div class="modal-content">
					<form action="AddBookTypeServlet" method="post">
						<label>分类名称</label> <input type="text" name="name" id="typename"
							placeholder="请输入图书分类名称" />
						<button type="submit" class="confirm btn">确认</button>
					</form>
				</div>
				<div class="modal-footer">
					<button class="close btn">
						关闭
						<bttton>
				</div>
			</div>
			<div class="changeModal">
				<div class="modal-header">
					<p class="title">修改图书信息</p>
					<p class="close2">×</p>
				</div>
				<div class="modal-content">
					<form action="UpdateBookTypeServlet" method="post">
						<h>图书名称</h>
						<input type="hidden" name="tid" id="updatetid"> <input
							type="text" name="name" id="typename" placeholder="请输入图书名称" />
							<button type="submit" class="confirm btn">确认</button>
					</form>
				</div>
				<div class="modal-footer">
					<button class="close2 btn">
						关闭
						<bttton>
				</div>
			</div>
		</div>
		<div class="admin_booktype_table">
			<table id="datalist" class="data_table" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>图书分类名称</th>
						<th>操作</th>
					</tr>
				</thead>
				<%
					ArrayList<TypeBean> bookdata = new ArrayList<TypeBean>();
					bookdata = (ArrayList<TypeBean>) request.getAttribute("data");
					if (bookdata == null) {
						TypeDao typedao = new TypeDao();
						bookdata = (ArrayList<TypeBean>) typedao.get_ListInfo();
					}
					for (TypeBean bean : bookdata) {
				%>
				<tbody>

					<td><%=bean.getName()%></td>
					<td><button type="button" class="changeBtn" id="btn_update"
							onclick="showInfo2(<%=bean.getTid()%>)">修改</button>
						<button type="button" class="deleteBtn"
							onclick="deletebook(<%=bean.getTid()%>)">删除</button></td>
				</tbody>
				<%
					}
				%>

			</table>
		</div>
	</div>
	<div class="mask"></div>
	<script type="text/javascript">
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
	function showInfo2(tid) {
       	document.getElementById("updatetid").value = tid;
		var changeBtn=document.getElementById("btn_update");
		var changeModal=document.getElementsByClassName("changeModal")[0];
		var closes2 = document.getElementsByClassName("close2");
		var mask = document.getElementsByClassName("mask")[0];
		changeModal.style.display = "block";
		mask.style.display = "block";
    }
	function deletebook(tid) {
    	con=confirm("是否删除?"); 
    	if(con==true){
    		location.href = "DeleteTypeServlet?tid="+tid;
    	}
    }
	</script>
</body>
</html>
