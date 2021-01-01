<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,bean.*,dao.*,servlet.*,util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>图书借阅系统</title>
		<link rel="stylesheet" type="text/css" href="css/select.css" />
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.css" />
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
						&nbsp;&nbsp;&nbsp;查询
					</div>
					<div class="row_select">
						<form action="SelectServlet" method="post">
							<span class="select_name">
								图书名称
							</span>
							<input type="text" name="bookname" id="select_input" value="" />
							<input type="hidden" name="tip" value="-1">
							<button type="submit">查询</button>
						</form>
					</div>
				</div>
			</div>
			<div class="select_table">
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
								<%--<td><%= bean.getNum() %></td>--%>
								<td><button type="button" class="borrowBtn"
										data-toggle="modal" onclick="borrowbook(<%=bean.getBid()%>)">借阅</button>
								</td>

							</tbody>
							<%
								}
							%>
				</table>
			</div>
			<script type="text/javascript">
    function borrowbook(bid) {
    	con=confirm("是否借阅?"); 
    	if(con==true){
    		location.href = "BorrowServlet?tip=1&bid="+bid;
    	}
    }
    </script>
		</div>
		
	</body>
</html>
