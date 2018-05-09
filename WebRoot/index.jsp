<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人力资源管理系统登录</title>

<style type="text/css">
body {
	font-size: 12px;
	margin: 0;
	padding: 0;
	width: 100%
}

#main {
	background: url("images/login.jpg") no-repeat;
	background-position: center;
	background-attachment: fixed;
	width: 1200px;
	height: 650px;
	margin: 0 auto;
	position: relative;
}

form {
	margin: 0 auto;
	position: absolute;
	left: 380px;
	top: 385px;
}

#input {
	
}

.inp {
	width: 100px;
}

#error {
	padding: 10px 0;
}
</style>
<script type="text/javascript" src="jquery-easyui-1.4.4/jquery.min.js"></script>
</head>
<body>
	<div id="main">
		<form id="loginform">
			<table id="input">
				<tr>
					<td>用户名：</td>
					<td><input type="text" value="管理员" class="inp" name="LoginName"
						id="LoginName" />
					</td>
					<td>密&nbsp;码：</td>
					<td class="name"><input type="password" value="ysd123" class="inp"
						name="Password" id="Password" />
					</td>
					<td><input type="button" value="登录" onclick="login()" />
					</td>
					<td><input type="button" value="重置"
						onclick="javascript:resetValue();" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td id="error"><font color="red">${error}</font>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>

<script type="text/javascript">
	function login() {

		$.post("/SSM_Mysql/Login.action", $("#loginform").serialize(),
				function(res) {
					if (res.success)
						location.href = "main.jsp";
					else
						alert("提交失败");
				}, "json")

	}
</script>

<script type="text/javascript">
	function resetValue() {
		document.getElementById("userName").value = "";
		document.getElementById("password").value = "";
	}
</script>
</html>