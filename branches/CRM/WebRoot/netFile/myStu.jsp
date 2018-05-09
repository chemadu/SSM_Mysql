<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <head>
    <base href="<%=basePath%>">
    
    <title>学生</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
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
  
  <body>
  <table id="Studentdg" title="" class="easyui-datagrid"
		style="width:700px;height:250px" fitColumns="true" rownumbers="true"
		fit="true" pagination="true" pageSize="20"
		url="${pageContext.request.contextPath}/AllStudent.action" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'id' ,hidden:true">学生ID</th>
				<th data-options="field:'name'">学生名</th>
				<th data-options="field:'age' ">学生年龄</th>
				<th data-options="field:'sex' ">学生性别</th>
				<th data-options="field:'phone' ">学生电话</th>
				<th data-options="field:'stuStatus' ">学生学历</th>
				<th data-options="field:'perState' ">学生状态</th>
				<th data-options="field:'msgSource' ">学生公司</th>
				<th data-options="field:'sourceUrl' ">学生网站</th>
				<th data-options="field:'sourceKeyWord' ">学生课程</th>
				<th data-options="field:'address' ">学生城市</th>
				<th data-options="field:'netPusherId',hidden:true ">学生ID</th>
				<th data-options="field:'askerId',hidden:true ">学生ID</th>
				<th data-options="field:'qq' ">学生QQ</th>
				<th data-options="field:'weiXin' ">学生微信</th>
				<th data-options="field:'content' ">学生备注</th>
				<th data-options="field:'createTime' ">学生创建时间</th>
				<th data-options="field:'learnForward'">学习方向</th>
				<th data-options="field:'isValid'">确定吗</th>
				<th data-options="field:'record'">学生成绩</th>
				<th data-options="field:'isReturnVist'">是否回访</th>
				<th data-options="field:'firstVisitTime'">学生名</th>
				<th data-options="field:'isHome'">学生名</th>
			</tr>
		</thead>
	</table>
  </body>
</html>
