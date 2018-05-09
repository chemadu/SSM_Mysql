<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科帮网员工管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>


<style type="text/css">
input {
	width: 80px;
}
</style>
<script type="text/javascript">
	var url;
	function searchEmployee() {
		$('#dg').datagrid('load', {
			LoginName : $('#LoginName').val(),
			IsLockout : $('#IsLockout').val(),
			ProtectEMail : $('#ProtectEMail').val(),
			protectMTel : $('#protectMTel').val()
		});
	}
	function deleteEmployee() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确认要删掉这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("/SSM_Mysql/DelUser.action?delIds=" + strIds, function(
						result) {
					if (result.success) {
						$.messager.alert("系统提示", "您已成功删除<font color=red>"
								+ result.message + "</font>条数据!");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert("系统提示", '<font color=red>'
								+ selectedRows[result.errorIndex].name
								+ '</font>' + result.errorMsg);
					}
				}, "json");
			}
		});
	}
	function openEmployeeAddDialog() {
		$('#dlg').dialog('open').dialog("setTitle", "员工信息");
		resetValue();
		url = ("/SSM_Mysql/AddUser.action");
	}

	function openEmployeeModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		var row = selectedRows[0];
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}

		$("#u_LoginName").val(row.loginName);
		$("#u_ProtectEMail").val(row.protectEMail);
		$("#u_protectMTel").val(row.protectMTel);
		$("#u_IsLockout").val(row.isLockout);

		$("#dlg").dialog("open").dialog("setTitle", "编辑员工信息");

		url = "/SSM_Mysql/UpUser.action?id=" + row.id;
	}

	function closeEmployeeDialog() {
		$('#dlg').dialog("close");
		resetValue();
	}

	function resetValue() {
		$('#u_LoginName').val("");

		$('#u_ProtectEMail').val("");
		$('#u_protectMTel').val("");
		$('#u_IsLockout').val("");
	}

	function saveEmployee() {
		$('#fm').form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				if (result.success) {
					$.messager.alert("系统提示", "保存失败");
					return;
				} else {
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
	function exportEmployee() {
		$('#search').form("submit", {
			url : "employee!ExportEmployee"
		})
		//window.location.href="employee!ExportEmployee";
	}
	//设置角色权限
	var data;
	var row;
	function showRoles(index) {

		data = $("#dg").datagrid("getData"); //获取datagrid对应的json数据（对象集合）
		row = data.rows[index]; //获取第index行对应的json对象。 index为传递过来的索引参数，从0开始，就像数组下标。
		//获取用户信息
		//thisRoleAndAllRole(row)

		$("#updateuserRole_window").window("open");
		//所有角色	
		$("#AllRole").datagrid({
			url : "/SSM_Mysql/department.action", //数据接口的地址
			queryParams : { //要发送的参数列表
			}
		});

		//点击用户的角色	
		$("#thisRoleTable").datagrid({
			url : "/SSM_Mysql/roleByName.action?name=" + row.id, //数据接口的地址
			queryParams : { //要发送的参数列表
			}
		});

	}

	//锁定和解锁用户
	function formatterLockUser(value, row, index) {
		return "<a style='cursor: pointer;' onclick='lockUser("
				+ index
				+ ")'>锁定用户</a> <a style='cursor: pointer;' onclick='unlockUser("
				+ index + ")'>解锁用户</a>";
	}
	//设置角色权限
	function formatterSetRole(value, row, index) {
		return "<a style='cursor: pointer;' onclick='showRoles(" + index
				+ ")'>设置</a>";
	}
	//重置密码
	function formatterResetPassword(value, row, index) {
		return "<a style='cursor: pointer;' onclick='resetPassword(" + index
				+ ")'>重置密码</a>";
	}
	//操作用户
	function formatterOPUser(value, row, index) {
		return "<a style='cursor: pointer;' onclick='updateInfo(" + index
				+ ")'>编辑</a> <a style='cursor: pointer;' onclick='deleteInfo("
				+ index + ")'>删除</a>";
	}
	//给当前用户添加角色 
	function addRolebyUser(value, row, index) {
		return "<a style='cursor: pointer;'  onclick='addRolebyUserfun("
				+ index + ")'><h2>+</h2></a>";
	}
	//移除当前用户的角色
	function removeRolebyUser(value, row, index) {
		return "<a style='cursor: pointer;'  onclick='Delrole("
				+ index + ")'><h2>-</h2></a>";
	}

	function addRolebyUserfun(index) {

		var data1 = $("#AllRole").datagrid("getData"); //获取datagrid对应的json数据（对象集合）

		var row1 = data1.rows[index]; //获取第index行对应的json对象。 index为传递过来的索引参数，从0开始，就像数组下标。
		/* 		alert(row.loginName)
		 alert(row1.name) */

		$.messager.confirm('确认', '您确认想要添加当前角色吗', function(r) {
			if (r) {
				$.post("/SSM_Mysql/AddUserToRole.action", {
					uId : row.id,
					rId : row1.id,
				}, function(res) {
					if (res.success) {
						$.messager.alert("提示信息", "添加成功")
						//所有角色	
						$("#AllRole").datagrid({
							url : "/SSM_Mysql/department.action", //数据接口的地址
							queryParams : { //要发送的参数列表
							}
						});
						//点击用户的角色	
						$("#thisRoleTable").datagrid(
								{
									url : "/SSM_Mysql/roleByName.action?name="
											+ row.id, //数据接口的地址
									queryParams : { //要发送的参数列表
									}
								});
					}
				}, "json");
			}
		});
		
		
		

	}

	//给当前用户减少角色
	function Delrole(index){
	
		var data1 = $("#thisRoleTable").datagrid("getData"); //获取datagrid对应的json数据（对象集合）

		var row1 = data1.rows[index]; //获取第index行对应的json对象。 index为传递过来的索引参数，从0开始，就像数组下标。
	
		$.messager.confirm('确认', '您确认想要从当前角色移除吗', function(r) {
			if(r) {
				$.post(
					"/SSM_Mysql/DelUserToRole.action", {
						uId : row.id,
						rId : row1.id,
					},
					function(res) {
						if(res.success) {
							$.messager.alert("提示信息", "移除成功")
							//所有角色	
						$("#AllRole").datagrid({
							url : "/SSM_Mysql/department.action", //数据接口的地址
							queryParams : { //要发送的参数列表
							}
						});
						//点击用户的角色	
						$("#thisRoleTable").datagrid(
								{
									url : "/SSM_Mysql/roleByName.action?name="
											+ row.id, //数据接口的地址
									queryParams : { //要发送的参数列表
									}
								});
						}else{
							$.messager.alert("提示信息", "移除失败")
						}
					}, "json");
			}
		});
	}
</script>
</head>
<body>
	<table id="dg" title="" class="easyui-datagrid"
		style="width:700px;height:250px" fitColumns="true" rownumbers="true"
		fit="true" pagination="true" pageSize="20"
		url="${pageContext.request.contextPath}/AllUser.action" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'id',width:280,hidden:true">用户ID</th>
				<th data-options="field:'loginName',width:100">用户名</th>
				<th data-options="field:'protectEMail',width:100">邮箱</th>
				<th data-options="field:'protectMTel',width:100,">手机号</th>
				<th data-options="field:'isLockout',width:100,">是否锁定</th>
				<th data-options="field:'createTime',width:160,">创建时间</th>
				<th data-options="field:'lastLoginTime',width:160,">最后登录的时间</th>
				<th
					data-options="field:'setRoleAction',width:60,align:'center',formatter:formatterSetRole">角色</th>
				<th
					data-options="field:'setUserAction',width:120,align:'center',formatter:formatterOPUser">操作</th>
				<th
					data-options="field:'setPassword',width:80,align:'center',formatter:formatterResetPassword">操作</th>
				<th
					data-options="field:'setLock',width:140,align:'center',formatter:formatterLockUser">用户操作</th>
			</tr>
		</thead>
	</table>


	<div id="tb">
		<div>
			<a href="javascript:openEmployeeAddDialog()"
				class="easyui-linkbutton" data-options="iconCls:'icon-add'"
				plain="true">添加</a> <a href="javascript:openEmployeeModifyDialog()"
				class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
				plain="true">修改</a> <a href="javascript:deleteEmployee()"
				class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
				plain="true">删除</a>
		</div>
		<div>
			<form id="search" method="post">
				&nbsp;姓名:&nbsp;<input type="text" name="LoginName" id="LoginName"
					size="10" /> &nbsp;邮箱:&nbsp;<input type="text" name="ProtectEMail"
					id="ProtectEMail" size="10" /> &nbsp;手机号:&nbsp;<input type="text"
					name="protectMTel" id="protectMTel" size="10" /> &nbsp;是否锁定:&nbsp;<select
					name="IsLockout" id="IsLockout">
					<option value="是">是</option>
					<option value="否">否</option>
				</select> <a href="javascript:searchEmployee()" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
			</form>
		</div>
		<br />
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width:400px;height:250px;padding:20px 10px 0;" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>&nbsp;姓名:&nbsp;</td>
					<td><input type="text" name="LoginName" id="u_LoginName"
						class="easyui-validatebox" required="true"></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;邮箱:&nbsp;</td>
					<td><input type="text" name="ProtectEMail" id="u_ProtectEMail"
						class="easyui-validatebox" required="true"></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;手机号:&nbsp;</td>
					<td><input type="text" name="protectMTel" id="u_protectMTel"
						class="easyui-validatebox" required="true"></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;是否锁定:&nbsp;</td>
					<td><select name="IsLockout" id="u_IsLockout">
							<option value="是">是</option>
							<option value="否">否</option>
					</select></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveEmployee()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeEmployeeDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

	<!--修改用户角色-->
	<div id="updateuserRole_window" class="easyui-window" title="修改用户角色"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:440px;height:500px;padding:10px;">
		<div id="cc" class="easyui-layout" style="width:440px;height:500px;">
			<div data-options="region:'east',title:'当前用户角色'"
				style="padding:5px;background:#eee;width:220px;">
				<form id="thisRoleForm">
					<table style="width: 150px;" id="thisRoleTable"
						class="easyui-datagrid">
						<thead>
							<tr>
								<th data-options="field:'name'" width="80">角色名称</th>
								<th
									data-options="field:'cz',width:60,align:'center',formatter:removeRolebyUser"
									width="40">操作</th>
							</tr>
						</thead>
					</table>
				</form>
			</div>
			<div
				data-options="region:'center',iconCls:'icon-reload',title:'所有角色',split:true">
				<form id="AllRoleForm">
					<table style="width: 150px;" class="easyui-datagrid" id="AllRole"
						data-options="rownumbers:true,singleSelect:true">
						<thead>
							<tr>
								<th data-options="field:'name',align:'center',width:80">角色名称</th>
								<th
									data-options="field:'cz',width:60,align:'center',formatter:addRolebyUser"
									width="40">操作</th>
							</tr>
						</thead>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>