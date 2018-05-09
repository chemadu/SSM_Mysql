<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.4/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.4/themes/icon.css">
		<script type="text/javascript" src="jquery-easyui-1.4.4/jquery.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">

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

//id：节点ID，对加载远程数据很重要。
//text：显示节点文本。
//state：节点状态，'open' 或 'closed'，默认：'open'。如果为'closed'的时候，将不自动展开该节点。
//checked：表示该节点是否被选中。
//attributes: 被添加到节点的自定义属性。
//children: 一个节点数组声明了若干节点。
			$(function(){
			var loginname = $("#sloginname").html()
			 //要显示的字段
           // var fileds = "id,text,createTime";
            var fileds = "id,text,weight,parentId,path";
         //   $("#divResult").html(JSON.stringify(nodes));
				//实例化树型
				$("#tree").tree({
					url:"UserRoleMondel.action?LoginName="+loginname,//服务器数据
					
					 loadFilter: function(data){ 
					 
					 //alert(data[0].department[0].menu) 
					 
					 var res    = data[0].department[0].menu;
					 var nodes = ConvertToTreeGridJson(res, "id", "parentId", fileds);
       					 return nodes;   
   					 }  ,
					animate:true,
//					data:treeData,//js数据 treeData
					lines:true,//显示虚线
					onClick:onclickTree
				})
				
			});
		</script>
		
		<script type="text/javascript">
			function onclickTree(node){
				//alert("被单击的节点是  => "+node.attributes.url);
						if(node.path!=null && node.path!=""){//子菜单
							openTab(node.text,node.path);
						}
				
			}
		</script>
		
		<script type="text/javascript">
				//新增tab
				function openTab(text,url){
					if($("#tabs").tabs('exists',text)){
						$("#tabs").tabs('select',text);
					}else{
						var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%;' src="+url+"></iframe>";
						$("#tabs").tabs('add',{
							title:text,
							closable:true,
							content:content			
						});				
					}
				}
		</script>
<title>人力资源管理系统</title>

</head>
<body class="easyui-layout">

        <div data-options="region:'north'" style="height:100px;background-color:#F9F7F8">
        	<img alt="" src="images/main.jpg" style="height:98px;width:700px;float:left;"  >
        	<%String name =  (String)session.getAttribute("name");
        	if(name!=null){
        	 %>
        	
        	<div style="margin:60px 50px 20px;float:right;"><font color="green" >欢迎您：</font>&nbsp;<font color="red" id="sloginname"><%=name %>&nbsp;&nbsp;</font><font color="green" ><span id="currentdate"></span></font></div>
        <%} %>
        </div>
        <div data-options="region:'south'" style="height:30px;padding:5px;" align="center"  ><font color="green">版权所有&nbsp;&nbsp;</font><a href="http://stu.ysd3g.com" style="text-decoration: none;color: purple" >ms@http://stu.ysd3g.com</a></div>
        <div data-options="region:'west',split:true" title="导航菜单" style="width:200px;">
        	<ul id="tree" class="easyui-tree" ></ul>
        </div>
        <div data-options="region:'center'">
            <div class="easyui-tabs" fit="true" border="false" id="tabs" >
				<div title="首页" style="padding:10px">
					<div align="center" style="padding-top:100px;"><font color="red" size="7">欢迎使用</font></div>
				</div>
			</div>	
        </div>
</body>


<script type="text/javascript" src="js/myjs/currentdate.js"></script>


</html>