<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科帮网部门管理</title>

<!--
	    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
		-->
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

<script type="text/javascript">
	var url;
	function searchDepartment() {
		$('#dg').datagrid('load', {
			Name : $('#s_Name').val()
		});
	}
	function deleteDepartment() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		//var ids=strIds.join(",");
		$.messager.confirm(
						"系统提示",
						"您确认要删掉这<font color=red>" + selectedRows.length
								+ "</font>条数据吗？",
						function(r) {
							if (r) {
								$.post("/SSM_Mysql/DelDepartment.action?delIds="+ strIds,
												function(result) {
													if (result.success) {
														$.messager
																.alert(
																		"系统提示",
																		"您已成功删除<font color=red>"
																				+ result.message
																				+ "</font>条数据!");
														$("#dg").datagrid(
																"reload");
													} else {
														$.messager
																.alert(
																		"系统提示",
																		'<font color=red>'
																				+ selectedRows[result.errorIndex].departmentName
																				+ '</font>'
																				+ result.errorMsg);
													}
												}, "json");
							}
						});
	}
	function openDepartmentAddDialog() {
		$('#dlg').dialog('open').dialog("setTitle", "部门信息");
		url = ("/SSM_Mysql/AddDepartment.action");
	}

	function openDepartmentModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "编辑部门信息");

		//				$('#fm').form('load',row);
		$("#Name").val(row.name);
		url = "/SSM_Mysql/UpDepartment.action?Id=" + row.id;
	}

	function closeDepartmentDialog() {
		$('#dlg').dialog("close");
		resetValue();
	}

	function resetValue() {
		$('#Name').val("");
	}

	function saveDepartment() {
		$('#fm').form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				if (result.errorMsg) {
					$.messager.alert("系统提示", result.errorMsg);
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


//设置当前角色的模块
	function RoleQx(value, row, index) {
		return "<a style='cursor: pointer;' onclick='RoleQxfun(" + index
				+ ")'>设置</a>";
	}
		//显示当前角色模块的方法
		var roleId;
		function RoleQxfun(index) {
			
		$("#qx_window").window("open")
		
		var data = $("#dgrole").datagrid("getData"); //获取datagrid对应的json数据（对象集合）
	
		var row = data.rows[index]; //获取第index行对应的json对象。 index为传递过来的索引参数，从0开始，就像数组下标。
		
		roleId = row.id;
		
		
		//$("#qxid").val(roleId);
		 var fileds = "id,text,weight,parentId,path,checked";
		$("#treemenuRole").tree({
			url:"/SSM_Mysql/AllUserCheck.action?LoginName="+row.name,
			loadFilter: function(data){ 
					 var nodes = ConvertToTreeGridJson(data, "id", "parentId", fileds);
       					 return nodes;   
   					 },
			lines: true,
			checkbox: true,
			queryParams: {
				roleId: roleId
			}
		});
	}
	
	//设置角色信息成功后保存的方法
	function submitqxForm() {
		var data = $("#dgrole").datagrid("getRows"); //获取datagrid对应的json数据（对象集合）
		//获取被选中的复选框的数据
		var nodes = $("#treemenuRole").tree("getChecked",['checked','indeterminate']); 
		
		//var roleId = $("#qxid").val();
		var ModuleId = [];
		var RoleId = roleId;
		
		for(var i = 0;i<nodes.length;i++){
			ModuleId[i] = nodes[i].id;
		//	RoleId[i] = roleId;
		}
		$.post(
			"/SSM_Mysql/AddRole.action?ModuleId="+ModuleId+"&RoleId="+RoleId,
			function(res) {
				if(res.success) {
					$.messager.alert("提示信息", "修改成功");
					$("#qx_window").window("close");
				} else {
					$.messager.alert("提示信息", "修改失败");
				}
			}, "json");
	}

	
	
	
	 function ConvertToTreeGridJson(rows, idFieldName, pidFieldName, fileds) {
            function exists(rows, ParentId) {
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i][idFieldName] == ParentId)
                        return true;
                }
                return false;
            }
            var nodes = [];
            // get the top level nodes
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                if (!exists(rows, row[pidFieldName])) {
                    var data = {
                        id: row[idFieldName]
                    }
                    var arrFiled = fileds.split(",");
                    for (var j = 0; j < arrFiled.length; j++)
                    {
                        if (arrFiled[j] != idFieldName)
                            data[arrFiled[j]] = row[arrFiled[j]];
                    }
                    nodes.push(data);
                }
            }
            console.info("根目录nodes："+JSON.stringify(nodes));


            var toDo = [];
            for (var i = 0; i < nodes.length; i++) {
                toDo.push(nodes[i]);
            }

            while (toDo.length) {
                var node = toDo.shift(); // the parent node
                // get the children nodes
                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    if (row[pidFieldName] == node.id) {
                        var child = {
                            id: row[idFieldName]
                        };
                        var arrFiled = fileds.split(",");
                        for (var j = 0; j < arrFiled.length; j++) {
                            if (arrFiled[j] != idFieldName) {
                                child[arrFiled[j]] = row[arrFiled[j]];
                            }
                        }
                        if (node.children) {
                            node.children.push(child);
                        } else {
                            node.children = [child];
                        }
                        toDo.push(child);
                    }
                }
            }
            return nodes;
        };
</script>
</head>
<body>
	<table id="dgrole" title="" class="easyui-datagrid"
		style="width:500px;height:250px" fitColumns="true" rownumbers="true"
		fit="true" pagination="true" pageSize="20"
		url="${pageContext.request.contextPath}/department.action"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th data-options="field:'id'" width="10">编号</th>
				<th data-options="field:'name'" width="40">部门名称</th>
				<th data-options="field:'qx',width:10,align:'center',formatter:RoleQx">权限</th>
				
			</tr>
		</thead>
	</table>
	<div style="padding:5px;" id="tb">
		<a href="javascript:openDepartmentAddDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			plain="true">添加</a> <a href="javascript:openDepartmentModifyDialog()"
			class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
			plain="true">修改</a> <a href="javascript:deleteDepartment()"
			class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
			plain="true">删除</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名称：&nbsp;<input
			type="text" name="Name" id="s_Name" />&nbsp; <a
			href="javascript:searchDepartment()" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width:400px;height:280px;padding:10px 20px;" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>角色名称：</td>
					<td><input type="text" name="Name" id="Name"
						class="easyui-validatebox" required="true">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveDepartment()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a
			href="javascript:closeDepartmentDialog()" class="easyui-linkbutton"
			iconCls="icon-cancel">关闭</a>
	</div>
	
	
	<!--设置方法-->
<div id="qx_window" class="easyui-window" title="修改角色" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:600px;padding:10px;">
	<input type="hidden" id="qxid" value="" />
	<!--<table class="easyui-datagrid" id="qxrole" style="width:600;height:800" data-options="singleSelect:true">-->

	<div id="modulfun" title="请选择模块">
		<ul id="treemenuRole"></ul>
	</div>
	<div style="text-align:center;padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitqxForm()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearqxForm()">取消</a>
	</div>
	<!--</table>-->

</div>
</body>
</html>