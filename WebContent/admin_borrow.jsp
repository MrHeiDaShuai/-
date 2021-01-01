<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,dao.*,bean.*,servlet.*,util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书借阅系统</title>
<link rel="stylesheet" type="text/css" href="css/admin_borrow.css" />
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
	<div class="admin_borrow_frame">
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
				<div class="title">&nbsp;&nbsp;&nbsp;图书借阅信息</div>
				<div class="row_select">
					<form action="SelectAdminnameServlet" method="post">
						<span class="select_adminname"> 读者账号</span> <input type="text"
							name="adminname" id="select_input" value="" />
						<button type="submit">查询</button>
					</form>
				</div>
			</div>
		</div>
		<div class="admin_borrow_table">
			<table id="datalist" class="data_table" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>图书号</th>
						<th>图书名称</th>
						<th>读者账号</th>
						<th>读者名称</th>
						<th>借阅日期</th>
						<th>截止还书日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<%
					ArrayList<HistoryBean> bookdata = new ArrayList<HistoryBean>();
					bookdata = (ArrayList<HistoryBean>) request.getAttribute("data");
					if (bookdata == null) {
						BookDao bookdao = new BookDao();
						bookdata = (ArrayList<HistoryBean>) bookdao.get_HistoryListInfo2(1);
					}
					for (HistoryBean bean : bookdata) {
				%>
				<tbody>
					<td><%=bean.getCard()%></td>
					<td><%=bean.getBookname()%></td>
					<td><%=bean.getAdminname()%></td>
					<td><%=bean.getUsername()%></td>
					<td><%=bean.getBegintime()%></td>
					<td><%=bean.getEndtime()%></td>
					<td><button type="button" class="returnBtn"
							id="btn_return" onclick="huanbook(<%=bean.getHid()%>)">还书</button>
					</td>
				</tbody>
				<%
					}
				%>
			</table>
		</div>
		<script type="text/javascript">
    function huanbook(hid) {
    	con=confirm("是否还书?"); 
    	if(con==true){
    		location.href = "BorrowServlet?tip=2&show=2&hid="+hid;
    	}
    }
    </script>
	</div>
</body>
</html>
