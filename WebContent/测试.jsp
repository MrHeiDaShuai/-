<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>弹出框</title>
<style>
* {
	padding: 0;
	margin: 0;
}

body {
	width: 100%;
	height: 100%;
	background: #fff;
}

.addBtn {
	padding: 10px 20px;
	color: white;
	background: #409EFF;
	border: none;
	box-shadow: 2px 3px 20px rgba(0, 0, 0, 0.2);
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.mask {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	z-index: 100;
	display: none;
}

.addModal {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	transform: translate(-50%, -50%);
	border-radius: 5px;
	background: #fff;
	box-shadow: 2px 3px 20px rgba(0, 0, 0, 0.2);
	z-index: 120;
	display: none;
}

.addModal .modal-header {
	height: 50px;
	border-bottom: 1px solid #f5f5f5;
	padding: 0 15px;
}

.addModal .modal-header p {
	line-height: 50px;
	display: inline-block;
}

.addModal .modal-header .title {
	font-size: 18px;
	color: #333;
}

.addModal .modal-header .close {
	float: right;
	font-size: 26px;
	margin-top: -2px;
	color: #9C9FA4;
	cursor: default;
}

.addModal .modal-content {
	min-height: 100px;
	text-align: center;
}

.addModal .modal-content input {
	width: 200px;
}

.addModal .modal-content select>option {
	text-align: center;
}

.addModal .modal-footer .btn {
	padding: 0 20px;
	height: 36px;
	line-height: 36px;
	color: white;
	background: #409EFF;
	border: none;
}

.addModal .modal-footer {
	border-top: 1px solid #f5f5f5;
	padding: 15px;
	text-align: right;
}

.container::after {
	content: "";
	display: block;
	clear: both;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<form action="">
				<button type="button" class="addBtn" id="addBtn">
					添加图书
					<button>
			</form>
		</div>
		<div class="addModal">
			<div class="modal-header">
				<p class="title">联系人详细信息</p>
				<p class="close">×</p>
			</div>
			<div class="modal-content">
				<form action="" method="">
					<input type="text" name="" id="num" value="" placeholder="请输入书号" />
					<input type="text" name="" id="num" value="" placeholder="请输入图书名称" />
					<input type="text" name="" id="num" value="" placeholder="请输入作者名称" />
					<select style="width: 200px;">
						<option value="历史名著">历史名著</option>
						<option value="lalal">人物传记</option>
					</select> <input type="text" name="" id="num" value="" placeholder="请输入出版社" />
					<input type="text" name="" id="num" value="" placeholder="请输入图书总数量" />
				</form>

			</div>
			<div class="modal-footer">
				<button class="close btn">
					关闭
					<bttton>
			</div>
		</div>
		<div class="mask"></div>
	</div>
	<script type="text/javascript">
		function deletebook(bid) {
			con = confirm("是否删除?");
			if (con == true) {
				location.href = "DeleteServlet?bid=" + bid;
			}
		}
		window.onload = function() {
			// 获取需要使用到的元素
			var addBtn = document.getElementById("addBtn");
			var container = document.getElementsByClassName("container")[0];
			var mask = document.getElementsByClassName("mask")[0];
			var addModal = document.getElementsByClassName("addModal")[0];
			var closes = document.getElementsByClassName("close");
			addBtn.onclick = show;
			closes[0].onclick = close;
			closes[1].onclick = close;
			function show() {
				mask.style.display = "block";
				addModal.style.display = "block";
			}
			function close() {
				mask.style.display = "none";
				addModal.style.display = "none";
			}
		}
	</script>

</body>
<ml>