<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XX科技 | 运营后台</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/font-awesome-4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/ionicons-2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- include header -->
		<%@ include file="../include/header.jsp"%>
		<!-- include left menu -->
		<%@ include file="../include/leftMenu.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- include content header -->
			<%@ include file="../include/contentHeader.jsp"%>

			<!-- Main content -->
			<section class="content">
				<div class="callout callout-info">
					<h4>操作指引</h4>
					<p>############################</p>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">角色列表</h3>
								<div class="box-tools">
									<button class="btn bg-info btn-flat" href="javascript:void(0)"
										onclick="addObj(this);">新建角色</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table id="mainTable" class="table table-hover">
									<tr>
										<th class="text-center" width="5%">#</th>
										<th class="text-center" width="20%">角色名称</th>
										<th class="text-center" width="35%">角色描述</th>
										<th class="text-center" width="20%">角色权限</th>
										<th class="text-center" width="20%">操作</th>
									</tr>
									<c:forEach var="item" items="${responesData.listRole}">
										<tr id="${item.id}">
											<td class="text-center">${item.id}</td>
											<td class="text-center">${item.name}</td>
											<td class="text-center">${item.description}</td>
											<td class="text-center">${item.listPermissions}</td>
											<td class="text-center">
												<div class="btn-group">
													<button type="button" class="btn bg-info btn-flat margin"
														href="javascript:void(0)" onclick="modifyObj(this);">修改</button>
													<button type="button" class="btn bg-danger btn-flat margin"
														href="javascript:void(0)" onclick="removeObj(this);">删除</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form id="saveForm" name="saveForm" role="form" action=""
						method="post">
						<div class="modal-header">
							<h4 class="modal-title">编辑</h4>
						</div>
						<div class="modal-body">

							<div class="box-body">
								<input id="id" name="id" type="hidden">
								<div class="form-group">
									<label for="name">角色名称</label> <input type="text"
										class="form-control" id="name" name="name">
								</div>
								<div class="form-group">
									<label for="name">角色描述</label> <input type="text"
										class="form-control" id="description" name="description">
								</div>
								<div class="form-group">
									<label for="parent">角色权限</label> <input id="permissionsIds" name="permissionsIds" type="hidden">
									<div id="permissionsTree" name="permissionsTree"></div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default pull-left"
								data-dismiss="modal">取消</button>
							<button id="saveRole" name="saveRole" type="button"
								class="btn btn-primary">保存</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.1.4 -->
	<script src="<%=request.getContextPath()%>/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/plugins/bootstrap-treeview/bootstrap-treeview.js"></script>
	<!-- Slimscroll -->
	<script src="<%=request.getContextPath()%>/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="<%=request.getContextPath()%>/plugins/fastclick/fastclick.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/dist/js/demo.js"></script>
	<!-- qiniu -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/plugins/plupload/plupload.full.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/plugins/plupload/i18n/zh_CN.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/plugins/qiniu/ui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/plugins/qiniu/qiniu.js"></script>
	<script>
		function initTreeView( checkedIds){
			$('#permissionsTree').treeview({
				data		: getTreeData(checkedIds),
				levels		: 1,
				multiSelect	: false,
				enableLinks	: false,
				highlightSearchResults:true,
				highlightSelected:false,
				showBorder	: true,
				showCheckbox: true,
				showIcon	: true,
				showTags	: true,
				backColor	: "white",
				borderColor	: "black",
				color		: "black",
				onhoverColor: "#F5F5F5",
				//searchResultBackColor: "#F5F5F5",
				searchResultColor: "#D9534F",
				selectedBackColor: "#428bca",
				selectedColor: "#FFFFFF",
				expandIcon	: "glyphicon glyphicon-plus",
				collapseIcon: "glyphicon glyphicon-minus",
				//nodeIcon	: "glyphicon glyphicon-road",
				emptyIcon	: "glyphicon",
				//selectedIcon: "glyphicon glyphicon-stop",
				checkedIcon	: "glyphicon glyphicon-check",
				uncheckedIcon:"glyphicon glyphicon-unchecked"
			});
			
			$('#permissionsTree').on('nodeChecked', function(event, data) {
				var ids = [];
				if($('#permissionsIds').val().length > 1){
					var tmp = $('#permissionsIds').val().trim();
					tmp = tmp.replace(/[ ]/g,"");
					tmp = tmp.replace("[","");
					tmp = tmp.replace("]","");
					ids = tmp.split(',');
				}
				var currentId = data.id;
				if(data.hasChild == "1"){//父节点，其全部子节点选中状态
					ids.push(currentId);
					$('#permissionsTree').treeview('expandNode', [ data.nodeId, { silent: true } ]);
					$.each(data.nodes,function(n,value) {
						$('#permissionsTree').treeview('checkNode', [ value.nodeId, { silent: true } ]);
						ids.push(value.id);
					});
				}
				else{
					var parentNode = $('#permissionsTree').treeview('getParent', data);
					if( !parentNode.state.checked ){
						$('#permissionsTree').treeview('checkNode', [ parentNode.nodeId, { silent: true } ]);
						ids.push(parentNode.id);
					}
					ids.push(currentId);
				}
				$('#permissionsIds').val(ids);
			});
			
			$('#permissionsTree').on('nodeUnchecked', function(event, data) {
				var ids = [];
				if($('#permissionsIds').val().length > 1){
					var tmp = $('#permissionsIds').val().trim();
					tmp = tmp.replace(/[ ]/g,"");
					tmp = tmp.replace("[","");
					tmp = tmp.replace("]","");
					ids = tmp.split(',');
				}
				var currentId = data.id;
				if(data.hasChild == "1"){//父节点，其全部子节点选中状态
					$.each(data.nodes,function(n,value) {
						$.each(ids,function(i,id) {
							if( id == value.id){
								ids.splice(i, 1);
							}
						});
						$('#permissionsTree').treeview('uncheckNode', [ value.nodeId, { silent: true } ]);
					});
					$.each(ids,function(i,id) {
						if( id == data.id){
							ids.splice(i, 1);
						}
					});
					$('#permissionsTree').treeview('uncheckNode', [ data.nodeId, { silent: true } ]);
				}
				else{
					$.each(ids,function(i,id) {
						if( id == data.id){
							ids.splice(i, 1);
						}
					});
					$('#permissionsTree').treeview('uncheckNode', [ data.nodeId, { silent: true } ]);
					var parentNode = $('#permissionsTree').treeview('getParent', data);
					if( parentNode.state.checked ){
						var isNodesUnchecked = true;
						$.each(parentNode.nodes,function(n,value) {
							if(value.state.checked){
								isNodesUnchecked = false;
								return false;
							}
						});
						if( isNodesUnchecked ){
							$.each(ids,function(i,id) {
								if( id == parentNode.id){
									ids.splice(i, 1);
								}
							});
							$('#permissionsTree').treeview('uncheckNode', [ parentNode.nodeId, { silent: true } ]);
						}
					}
				}
				$('#permissionsIds').val(ids);
			});
		}
		
		function getTreeData(checkedIds) {
			var list = ${responesData.listPermissions};
			var checkedIdList = [];
			if(checkedIds.length > 1){
				checkedIdList = checkedIds.split(',');
			}
			var tree=[];
			$.each(list,function(i,parent) {
				if(parent.parentId == "0"){
					var parentNode={id:'',text:'',parentId:'',hasChild:'',state:{checked:false,disabled:false,expanded:false,selected:false},nodes:[]};
					parentNode.id	= parent.id;
					parentNode.text	= parent.name;
					parentNode.parentId = parent.parentId;
					parentNode.hasChild = parent.hasChild;
					var childList=[];
					$.each(list,function(j,child) {
						if(child.parentId == parent.id){
							var childNode={id:'',text:'',parentId:'',hasChild:'',state:{checked:false,disabled:false,expanded:false,selected:false}};
							childNode.id = child.id;
							childNode.text	= child.name;
							childNode.parentId = child.parentId;
							childNode.hasChild = child.hasChild;
							$.each(checkedIdList,function(m,checkedId) {
								if(checkedId == child.id){
									childNode.state.checked = true;
									return false;
								}
							});
							childList.push(childNode);
						}
					});
					parentNode.nodes = childList;
					$.each(checkedIdList,function(m,checkedId) {
						if(checkedId == parent.id){
							parentNode.state.checked = true;
							return false;
						}
					});
					tree.push(parentNode);
				}
			});
			return tree;
		}

		function addObj(obj){
			$('#id').val(0);
			$('#name').val("");
			$('#description').val("");
			$('#permissionsIds').val("");
			initTreeView("");
			$('#myModal').modal({
				backdrop : 'static',
				display : 'show'
			});
		};

		function modifyObj(obj) {
			var tds = $(obj).parent().parent().parent().find('td');
			$('#id').val(tds.eq(0).text());
			$('#name').val(tds.eq(1).text());
			$('#description').val(tds.eq(2).text());
			$('#permissionsIds').val(tds.eq(3).text());
			var checkedIds = tds.eq(3).text().trim();
			checkedIds = checkedIds.replace(/[ ]/g,"");
			checkedIds = checkedIds.replace("[","");
			checkedIds = checkedIds.replace("]","");
			initTreeView(checkedIds);
			$('#myModal').modal({
				backdrop : 'static',
				display : 'show'
			});
		};

		function removeObj(obj) {
			var itemId = $(obj).parent().parent().parent().find('td').eq(0)
					.text();
			if (confirm("确认删除？")) {
				$.ajax({
					type : "POST",
					url : "<%=request.getContextPath()%>/sysManager/removeRole.jumper",
					data : {
						id : itemId
					},
					success : function(msg) {
						if (msg.responesCode != 0) {
							alert(msg.responesMsg);
						} else {
							var tr = $("tr[id=" + itemId + "]");
							tr.remove();
						}
					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});
			} else {

			}
		};

		$("#saveRole").click(function() {
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/sysManager/saveRole.jumper",
				data : $('#saveForm').serialize(),
				success : function(msg) {
					//alert(msg.name);
					if ($('#id').val() == "0") {//新建
						var trHTML = "<tr id="+msg.roleItem.id+"><td class=\"text-center\">"
								+ msg.roleItem.id
								+ "</td><td class=\"text-center\">"
								+ msg.roleItem.name
								+ "</td><td class=\"text-center\">"
								+ msg.roleItem.description
								+ "</td><td class=\"text-center\">"
								+ "[" + msg.roleItem.permissionsIds + "]"
								+ "</td><td class=\"text-center\"><div class=\"btn-group\"><button type=\"button\" class=\"btn bg-info btn-flat margin\" href=\"javascript:void(0)\" onclick=\"modifyObj(this);\">修改</button><button type=\"button\" class=\"btn bg-danger btn-flat margin\" href=\"javascript:void(0)\" onclick=\"removeObj(this);\">删除</button></div></td></tr>"
						$("#mainTable").append(trHTML);//在table最后面添加一行
					} else {
						var tds = $("tr[id=" + msg.roleItem.id + "]").find('td');
						tds.eq(1).html(msg.roleItem.name);
						tds.eq(2).html(msg.roleItem.description);
						var perIds = "[";
						$.each(msg.roleItem.permissionsIds,function(n,value) {
							perIds = perIds + "" + value;
							if( n < (msg.roleItem.permissionsIds.length-1)){
								perIds += ",";
							}
						});
						perIds += "]";
						tds.eq(3).html(perIds);
					}
					$('#myModal').modal('hide');
				},
				error : function(XMLResponse) {
					alert(XMLResponse.responseText);
					$('#myModal').modal('hide');
				}
			});
		});
	</script>
</body>
</html>
