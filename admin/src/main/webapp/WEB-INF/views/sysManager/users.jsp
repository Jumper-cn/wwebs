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
								<h3 class="box-title">用户列表</h3>
								<div class="box-tools">
									<button class="btn bg-info btn-flat"
										href="javascript:void(0)" onclick="addObj(this);">新建用户</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table id="mainTable" class="table table-hover">
									<tr>
										<th class="text-center" width="5%">#</th>
										<th class="text-center" width="30%">账号</th>
										<th class="text-center" width="15%">角色ID</th>
										<th class="text-center" width="30%">角色</th>
										<th class="text-center" width="20%">操作</th>
									</tr>
									<c:forEach var="item" items="${responesData.listUsers}">
										<tr id="${item.id}">
											<td class="text-center">${item.id}</td>
											<td class="text-center">${item.account}</td>
											<td class="text-center">${item.roleId}</td>
											<td class="text-center">${item.roleName}</td>
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
									<label for="name">账号</label> <input type="text"
										class="form-control" id="account" name="account">
								</div>
								<div class="form-group">
									<label for="name">修改密码</label> <input type="password"
										class="form-control" id="password" name="password">
								</div>
								<div class="form-group">
									<label for="url">角色</label> <input id="roleId"
										name="roleId" type="hidden"> <input id="roleName"
										name="roleName" type="hidden"><select class="form-control select2" style="width: 100%;"
										id="roleSel" name="roleSel">
									</select>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default pull-left"
								data-dismiss="modal">取消</button>
							<button id="saveUser" name="saveUser" type="button" class="btn btn-primary">保存</button>
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
	<script src="<%=request.getContextPath()%>/plugins/jQuery/jquery.md5.js"></script>
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
		function initRoleSelected(){
			var listRole = ${responesData.listRoles};
			//初始化角色列表
			$("#roleSel option").remove();
			$('#roleSel').append("<option value='0' selected='selected'>选择角色</option>");
			$.each(listRole, function(n, value) {
				//alert(n+' '+value);
				$('#roleSel').append("<option value='"+value.id+"'>" + value.name + "</option>");
			});
		}
		
		function setDropdownRole(roleId) {
			var listRole = ${responesData.listRoles};
			$("#roleSel option").remove();
			var firstOption = "<option value='0'";
			if( roleId == 0 ){
				firstOption += " selected='selected'>选择角色</option>"
			}
			else{
				firstOption += ">选择角色</option>"
			}
			$('#roleSel').append(firstOption);
			$.each(listRole, function(n, value) {
				var itemOption = "<option ";
				if (value.id == roleId) {
					itemOption = itemOption + " selected='selected' ";
				}
				itemOption = itemOption + "value='" + value.id + "'>" + value.name + "</option>";
				$('#roleSel').append(itemOption);
			});
		}
		
		$('#roleSel').change(function() {
			var roleId = $(this).children('option:selected').val();
			var roleName = $(this).children('option:selected').text();
			$("#roleId").val(roleId);
			$("#roleName").val(roleName);
		});
		
		function addObj(obj) {
			$('#id').val(0);
			$('#account').val("");
			$('#password').val("");
			$('#roleId').val("");
			$('#roleName').val("");
			initRoleSelected();
			$('#myModal').modal({
				backdrop : 'static',
				display : 'show'
			});
		};

		function modifyObj(obj) {
			var tds = $(obj).parent().parent().parent().find('td');
			$('#id').val(tds.eq(0).text());
			$('#account').val(tds.eq(1).text());
			$('#password').val("");
			$('#roleId').val(tds.eq(2).text());
			$('#roleName').val(tds.eq(3).text());
			setDropdownRole(tds.eq(2).text());
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
					url : "<%=request.getContextPath()%>/sysManager/removeUser.jumper",
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
		
		$("#saveUser").click(function() {
			var passwd = $("#password").val();
			var md5 = $.md5(passwd);
			$("#password").val(md5);
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/sysManager/saveUser.jumper",
				data : $('#saveForm').serialize(),
				success : function(msg) {
					//alert(msg.name);
					if ($('#id').val() == "0") {//新建
						var trHTML = "<tr id="+msg.userItem.id+"><td class=\"text-center\">"
								+ msg.userItem.id
								+ "</td><td class=\"text-center\">"
								+ msg.userItem.account
								+ "</td><td class=\"text-center\">"
								+ msg.userItem.roleId
								+ "</td><td class=\"text-center\">"
								+ msg.userItem.roleName
								+ "</td><td class=\"text-center\"><div class=\"btn-group\"><button type=\"button\" class=\"btn bg-info btn-flat margin\" href=\"javascript:void(0)\" onclick=\"modifyObj(this);\">修改</button><button type=\"button\" class=\"btn bg-danger btn-flat margin\" href=\"javascript:void(0)\" onclick=\"removeObj(this);\">删除</button></div></td></tr>"
						$("#mainTable").append(trHTML);//在table最后面添加一行
					} else {
						var tds = $("tr[id=" + msg.userItem.id + "]").find('td');
						tds.eq(1).html(msg.userItem.account);
						tds.eq(2).html(msg.userItem.roleId);
						tds.eq(3).html(msg.userItem.roleName);
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
