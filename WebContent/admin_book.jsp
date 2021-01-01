<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.*,java.util.ArrayList,dao.*,servlet.*,util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书借阅系统</title>
<link rel="stylesheet" type="text/css" href="css/admin_book.css" />
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
	<div class="admin_book_frame">
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
				<div class="title">&nbsp;&nbsp;&nbsp;查询</div>
				<div class="row_select">
					<form action="SelectServlet" method="post">
						<input type="hidden" name="tip" value="1"> <span
							class="select_name"> 图书名称 </span> <input type="text"
							name="bookname" id="select_input" value="" />
						<button type="submit" class="selBtn">查询</button>
						<button type="button" class="addBtn" id="addBtn">添加图书</button>
					</form>
				</div>
			</div>
			<div class="addModal">
				<div class="modal-header">
					<p class="title">添加新图书</p>
					<p class="close">×</p>
				</div>
				<div class="modal-content">
					<form action="AddBookServlet" method="post">
						<input type="text" name="card" id="card" value="" placeholder="请输入书号" />
						<input type="text" name="name" id="name" value="" placeholder="请输入图书名称" />
						<select style="width: 200px;" name="type">
							<option value="-1" style="display:none">图书种类</option>
							<%
								TypeDao typedao = new TypeDao();
								ArrayList<TypeBean> data = (ArrayList<TypeBean>) typedao.get_ListInfo();
								data = (ArrayList<TypeBean>) typedao.get_ListInfo();
								for (TypeBean bean : data) {
							%>
							<option value="<%=bean.getName()%>"><%=bean.getName()%></option>
							<%
								}
							%>
						</select> 
						<input type="text" name="author" id="author" value="" placeholder="请输入作者名称" />
						<input type="text" name="press" id="press" value="" placeholder="请输入出版社" />
						<input type="text" name="num" id="num" value=""
							placeholder="请输入图书总数量" /> <input type="submit" value="提交">
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
					<p class="title">添加新图书</p>
					<p class="close2">×</p>
				</div>
				<div class="modal-content">
					<form action="UpdateBookServlet" method="post">
						<input type="hidden" id="updateBookId" name="updatebid">
						<input type="text" name="card" id="card" value="" placeholder="请输入书号" />
						<input type="text" name="name" id="name" value="" placeholder="请输入图书名称" />
						<select style="width: 200px;" name="type">
							<option value="-1" style="display:none">图书种类</option>
							<%
								TypeDao typedao2 = new TypeDao();
								ArrayList<TypeBean> data2 = (ArrayList<TypeBean>) typedao2.get_ListInfo();
								data2 = (ArrayList<TypeBean>) typedao.get_ListInfo();
								for (TypeBean bean : data2) {
							%>
							<option value="<%=bean.getName()%>"><%=bean.getName()%></option>
							<%
								}
							%>
						</select> 
						<input type="text" name="author" id="author" value="" placeholder="请输入作者名称" />
						<input type="text" name="press" id="press" value="" placeholder="请输入出版社" />
						<input type="text" name="num" id="num" value=""
							placeholder="请输入图书总数量" /> <input type="submit" value="提交">
					</form>
				</div>
				<div class="modal-footer">
					<button class="close2 btn">
						关闭
						<bttton>
				</div>
			</div>
		</div>
		<div class="admin_book_table">
			<table id="datalist" class="data_table" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>图书号</th>
						<th>图书类型</th>
						<th>图书名称</th>
						<th>作者名称</th>
						<th>出版社</th>
						<th>操作</th>
					</tr>
				</thead>
				<%
					ArrayList<BookBean> bookdata = new ArrayList<BookBean>();
					bookdata = (ArrayList<BookBean>) request.getAttribute("data");
					if (bookdata == null) {
						BookDao bookdao = new BookDao();
						bookdata = (ArrayList<BookBean>) bookdao.get_ListInfo();
					}

					for (BookBean bean : bookdata) {
				%>
				<tbody>
					<td><%=bean.getCard()%></td>
					<td><%=bean.getType()%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getAuthor()%></td>
					<td><%=bean.getPress()%></td>
					<td><button type="button" class="changeBtn" id="btn_change"
							onclick="showInfo2(<%=bean.getBid()%>)">修改</button>
						<button type="button" class="deleteBtn" id="btn_delete"
							onclick="deletebook(<%=bean.getBid()%>)">删除</button></td>
				</tbody>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="mask"></div>
	<script type="text/javascript">
	function showInfo2(bid) {
		document.getElementById("updateBookId").value = bid;
        var changeBtn=document.getElementById("btn_update");
		var changeModal=document.getElementsByClassName("changeModal")[0];
		var closes2 = document.getElementsByClassName("close2");
		var mask = document.getElementsByClassName("mask")[0];
		changeModal.style.display = "block";
		mask.style.display = "block";
    }
    function deletebook(bid) {
    	con=confirm("是否删除?"); 
    	if(con==true){
    		location.href = "DeleteServlet?bid="+bid;
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
