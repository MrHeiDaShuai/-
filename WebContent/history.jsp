<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*,bean.*,servlet.*,util.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书借阅系统</title>
<link rel="stylesheet" type="text/css" href="css/history.css" />
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
	<div class="select_frame">
		<div class="top">
			<a>欢迎使用图书借阅系统</a>
			<button type="button" onclick="location.href='login.jsp';" class="">退出</button>
		</div>
		<div class="container">
			<div class="content">
				<ul>
					<li><a href="select.jsp">图书查询<i
							class="fa fa-chevron-right"></i></a></li>
					<li><a href="borrow.jsp">借阅信息<i
							class="fa fa-chevron-right"></i></a></li>
					<li><a href="history.jsp">借阅历史<i
							class="fa fa-chevron-right"></i></a></li>
				</ul>
			</div>
			<div class="row">
				<div class="title">&nbsp;&nbsp;&nbsp;借阅记录</div>
			</div>
		</div>
		<div class="select_table">
			<table id="datalist" class="data_table" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>图书号</th>
						<th>图书名称</th>
						<th>读者账户</th>
						<th>读者名称</th>
						<th>借阅日期</th>
						<th>还书日期</th>
					</tr>
				</thead>
				<%
					ArrayList<HistoryBean> bookdata = new ArrayList<HistoryBean>();
					bookdata = (ArrayList<HistoryBean>) request.getAttribute("data");
					if (bookdata == null) {
						BookDao bookdao = new BookDao();
						bookdata = (ArrayList<HistoryBean>) bookdao.get_HistoryListInfo(0, aid);
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
				</tbody>
				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>
