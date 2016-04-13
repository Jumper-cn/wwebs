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
								<h3 class="box-title">权限列表</h3>
								<div class="box-tools">
									<button class="btn bg-info btn-flat"
										href="javascript:void(0)" onclick="addObj(this);">新建权限</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table id="mainTable" class="table table-hover">
									<tr>
										<th class="text-center" width="5%">#</th>
										<th class="text-center" width="20%">名称</th>
										<th class="text-center" width="10%">描述</th>
										<th class="text-center" width="30%">URL</th>
										<th class="text-center" width="15%">是否有子菜单</th>
										<th style="display:none;" class="text-center" width="0"></th>
										<th class="text-center" width="20%">操作</th>
									</tr>
									<c:forEach var="item" items="${responesData.list}">
										<tr id="${item.id}">
											<td class="text-center">${item.id}</td>
											<td class="text-center">${item.name}</td>
											<td class="text-center">${item.description}</td>
											<td class="text-center">${item.url}</td>
											<td class="text-center">${item.hasChild}</td>
											<td style="display:none;" class="text-center">${item.parentId}</td>
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
									<label for="name">菜单名称</label> <input type="text"
										class="form-control" id="name" name="name">
								</div>
								<div class="form-group">
									<label for="name">菜单描述</label> <input type="text"
										class="form-control" id="description" name="description">
								</div>
								<div class="form-group">
									<label for="parent">上级菜单</label> <input type="text"
										class="form-control" id="parentId" name="parentId">
								</div>
								<div class="form-group">
									<label for="child">是否有子菜单</label> <input type="text"
										class="form-control" id="hasChild" name="hasChild">
								</div>
								<div class="form-group">
									<label for="url">URL</label> <input type="text"
										class="form-control" id="url" name="url">
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default pull-left"
								data-dismiss="modal">取消</button>
							<button id="savePermissions" name="savePermissions" type="button" class="btn btn-primary">保存</button>
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
		function addObj(obj) {
			$('#id').val(0);
			$('#name').val("");
			$('#description').val("");
			$('#url').val("");
			$('#hasChild').val("0");
			$('#parentId').val("0");
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
			$('#url').val(tds.eq(3).text());
			$('#hasChild').val(tds.eq(4).text());
			$('#parentId').val(tds.eq(5).text());
			$('#myModal').modal({
				backdrop : 'static',
				display : 'show'
			});
		};
		
		function removeObj(obj) {
			var itemId=$(obj).parent().parent().parent().find('td').eq(0).text();
			if(confirm("确认删除？")){
				$.ajax({
					type : "POST",
					url : "<%=request.getContextPath()%>/sysManager/removePermissions.jumper",
					data : {id:itemId},
					success : function(msg) {
						if( msg.responesCode != 0){
							alert(msg.responesMsg);
						}
						else{
							var tr = $("tr[id=" + itemId + "]");
							tr.remove();
						}
					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});
			}else{
				
			}
		};
		
		$("#savePermissions").click(function() {
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/sysManager/savePermissions.jumper",
				data : $('#saveForm').serialize(),
				success : function(msg) {
					//alert(msg.name);
					if ($('#id').val() == "0") {//新建
						var trHTML = "<tr id="+msg.permissionsItem.id+"><td class=\"text-center\">"
								+ msg.permissionsItem.id
								+ "</td><td class=\"text-center\">"
								+ msg.permissionsItem.name
								+ "</td><td class=\"text-center\">"
								+ msg.permissionsItem.description
								+ "</td><td class=\"text-center\">"
								+ msg.permissionsItem.url
								+ "</td><td class=\"text-center\">"
								+ msg.permissionsItem.hasChild
								+ "</td><td style=\"display:none;\" class=\"text-center\">"
								+ msg.permissionsItem.parentId
								+ "</td><td class=\"text-center\"><div class=\"btn-group\"><button type=\"button\" class=\"btn bg-info btn-flat margin\" href=\"javascript:void(0)\" onclick=\"modifyObj(this);\">修改</button><button type=\"button\" class=\"btn bg-danger btn-flat margin\" href=\"javascript:void(0)\" onclick=\"removeObj(this);\">删除</button></div></td></tr>"
						$("#mainTable").append(trHTML);//在table最后面添加一行
					} else {
						var tds = $(
								"tr[id=" + msg.permissionsItem.id + "]")
								.find('td');
						tds.eq(1).html(msg.permissionsItem.name);
						tds.eq(2).html(msg.permissionsItem.description);
						tds.eq(3).html(msg.permissionsItem.url);
						tds.eq(4).html(msg.permissionsItem.hasChild);
						tds.eq(5).html(msg.permissionsItem.parentId);
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
