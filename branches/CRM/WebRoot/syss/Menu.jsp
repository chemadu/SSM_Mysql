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

</head>
<script type="text/javascript">
	function ConvertToTreeGridJson(rows, idFieldName, pidFieldName, fileds) {
		function exists(rows, ParentId) {
			for ( var i = 0; i < rows.length; i++) {
				if (rows[i][idFieldName] == ParentId)
					return true;
			}
			return false;
		}
		var nodes = [];
		// get the top level nodes
		for ( var i = 0; i < rows.length; i++) {
			var row = rows[i];
			if (!exists(rows, row[pidFieldName])) {
				var data = {
					id : row[idFieldName]
				}
				var arrFiled = fileds.split(",");
				for ( var j = 0; j < arrFiled.length; j++) {
					if (arrFiled[j] != idFieldName)
						data[arrFiled[j]] = row[arrFiled[j]];
				}
				nodes.push(data);
			}
		}
		console.info("根目录nodes：" + JSON.stringify(nodes));

		var toDo = [];
		for ( var i = 0; i < nodes.length; i++) {
			toDo.push(nodes[i]);
		}

		while (toDo.length) {
			var node = toDo.shift(); // the parent node
			// get the children nodes
			for ( var i = 0; i < rows.length; i++) {
				var row = rows[i];
				if (row[pidFieldName] == node.id) {
					var child = {
						id : row[idFieldName]
					};
					var arrFiled = fileds.split(",");
					for ( var j = 0; j < arrFiled.length; j++) {
						if (arrFiled[j] != idFieldName) {
							child[arrFiled[j]] = row[arrFiled[j]];
						}
					}
					if (node.children) {
						node.children.push(child);
					} else {
						node.children = [ child ];
					}
					toDo.push(child);
				}
			}
		}
		return nodes;
	};

	//id：节点ID，对加载远程数据很重要。
	//text：显示节点文本。
	//state：节点状态，'open' 或 'closed'，默认：'open'。如果为'closed'的时候，将不自动展开该节点。
	//checked：表示该节点是否被选中。
	//attributes: 被添加到节点的自定义属性。
	//children: 一个节点数组声明了若干节点。
	$(function() {
		//要显示的字段
		// var fileds = "id,text,createTime";
		 var fileds = "id,text,weight,parentId,path";

		//   $("#divResult").html(JSON.stringify(nodes));
		//实例化树型
		$("#tree").tree(
				{ 
					url : "/SSM_Mysql/AllMenu.action",//服务器数据

					loadFilter : function(data) {
						var nodes = ConvertToTreeGridJson(data, "id",
								"parentId", fileds);
						return nodes;
					},
					animate : true,
					//					data:treeData,//js数据 treeData
					lines : true,//显示虚线
					onClick : onclickTree
				})

	});
</script>

<script type="text/javascript">
	var url;

	function onclickTree() {

	}

	//删除树
	function deleteMenu(){
	var nodes = $('#tree').tree('getSelected');
	$.messager.confirm("系统提示","您确认要删掉这条数据吗？",function(r){
					if(r){
						$.post("/SSM_Mysql/DelMenu.action?ids="+nodes.id,function(result){
							if(result.success){
								$.messager.alert("系统提示","您已成功删除条数据!");
								$("#tree").tree("reload");
							}else{
								$.messager.alert("系统提示","删除失败");
							}
						},"json");
					}
				});
	
	}


	//添加树
	function openAddMenu() {
		url = "/SSM_Mysql/AddMenu.action";
		var nodes = $('#tree').tree('getSelected');
		if(nodes==null){
		alert("请选择一个父节点");
		}else{
			
			$("#id").val("");
			$("#text").val("");
			$("#parentId").val("");
			$("#url").val("");
			$("#weight").val("");
			$('#Menu').dialog('open').dialog("setTitle", "添加部门信息");
			
			Addoptions(nodes);
			
			$("#id").val(parseInt(nodes.id)+1);
				
		}
			
	}

	//修改信息
	function openUpDateMenu() {

		$('#Menu').dialog('open').dialog("setTitle", "修改模块信息");

		url = "/SSM_Mysql/UpMenu.action";
		//当前选中的tree
		var nodes = $('#tree').tree('getSelected');
	
	$("#text").val(nodes.text);	
	$("#url").val(nodes.path);	
	$("#id").val(nodes.id);	
	$("#weight").val(nodes.weight);
	options(nodes)
		
	
	}
	//添加下拉框
	function Addoptions(nodes){
		$('#parentId').combobox({
			url : '${pageContext.request.contextPath}/AllMenu.action',
			valueField : 'id',
			textField : 'text',
			onLoadSuccess : function(res) {
						$('#parentId').combobox('setValue', nodes.id);
						$("#parentId").val(nodes.parentId);	
						return;

			}

		});
	}
	
	//修改下拉框
	function options(nodes){
		$('#parentId').combobox({
			url : '${pageContext.request.contextPath}/AllMenu.action',
			valueField : 'id',
			textField : 'text',
			onLoadSuccess : function(res) {
				for ( var i = 0; i < res.length; i++) {
					if (res[i].id == nodes.parentId) {
						$('#parentId').combobox('setValue', res[i].id);
						$("#parentId").val(nodes.parentId);	
						return;
					}
				}

			}

		});
	}
	
	//保存修改
	function saveMenu(){
		$('#menuForm').form("submit",{
					url:url,
					onSubmit:function(){
						return $(this).form("validate");
					}, 
					success:function(res){
						if(res.success){
							$.messager.alert("系统提示","保存失败");
						}else{
							$.messager.alert("系统提示","保存成功");
							$("#Menu").dialog("close");
							$("#tree").tree("reload");
							
						}
					}
				});
	}
	
	//关闭
	function closeMenu(){
				$('#Menu').dialog("close");
			}
</script>

<body>


	<div style="padding:5px;" id="tb">
		<a href="javascript:openAddMenu()" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" plain="true">添加</a> <a
			href="javascript:openUpDateMenu()" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" plain="true">修改</a> <a
			href="javascript:deleteMenu()" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove'" plain="true">删除</a>

	</div>

	<ul id="tree" class="easyui-tree"></ul>
	<div id="Menu" class="easyui-dialog"
		style="width:400px;height:280px;padding:10px 20px;" closed="true"
		buttons="#dlg-buttons">
		<form id="menuForm" method="post">
			<table>
				<tr>
				<input type="hidden" name="id" id="id" >
				
					<td>模块名称：</td>
					<td><input type="text" name="text"
						id="text" class="easyui-validatebox" required="true">
					</td>
				</tr>
				<tr>
					<td>父类名称：</td>
					<td><input class="easyui-combobox" id="parentId"
						name="parentId" size="8" panelHeight="auto"  /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" name="path"
						id="url" class="easyui-validatebox" >
					</td>
				</tr>
				<tr>
					<td>权重：</td>
					<td><input type="text" name="weight"
						id="weight" class="easyui-validatebox" >
					</td>
				</tr>
			</table>
			
		<div id="dlg-buttons">
		<a href="javascript:saveMenu()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
		<a href="javascript:closeMenu()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
		</div>
		</form>
		
	</div>
</body>
</html>