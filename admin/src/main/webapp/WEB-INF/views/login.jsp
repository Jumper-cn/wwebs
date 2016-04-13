<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录到后台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/font-awesome-4.4.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/ionicons-2.0.1/css/ionicons.min.css">    <!-- Theme style -->
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="#"><b>XXX</b>科技</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">登录到后台管理系统</p>
		<p id="errorMsg" name="errorMsg" style="display:none;color:red;"></p>
        <form id="loginForm" name="loginForm" method="post">
          <div class="form-group has-feedback">
            <input id="loginAccount" name="loginAccount" type="text" class="form-control" placeholder="账号">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input id="loginPassword" name="loginPassword" type="password" class="form-control" placeholder="密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-4">
              <button id="doLoginBtn" name="doLoginBtn" type="button" class="btn btn-primary btn-block btn-flat">登录</button>
            </div><!-- /.col -->
          </div>
        </form>

        <!-- <a href="register.jumper" class="text-center">注册新账号</a> -->

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="<%=request.getContextPath()%>/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="<%=request.getContextPath()%>/plugins/jQuery/jquery.md5.js"></script>

    <!-- Bootstrap 3.3.5 -->
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="<%=request.getContextPath()%>/plugins/iCheck/icheck.min.js"></script>
    <script>
	    $("#doLoginBtn").click(function() {
	    	var passwd = $("#loginPassword").val();
			if( $("#loginAccount").val() == "" ||passwd == ""){
				alert("请输入账号和密码");
			}
			else{
				var md5 = $.md5(passwd);
				$("#loginPassword").val(md5);
				//提交表单
				$.ajax({
					type : "POST",
					url : "<%=request.getContextPath()%>/doLogin.jumper",
					data : $('#loginForm').serialize(),
					success : function(msg) {
						if(msg.responesCode != 0){
							$("#errorMsg").html(msg.responesMsg);
							$("#errorMsg").show();
						}
						else{
							window.location.href="<%=request.getContextPath()%>/index.jumper";
						}
					},
					error : function(XMLResponse) {
						alert(XMLResponse.responseText);
					}
				});
			}
		});
	    
		$(function () {
		  $('input').iCheck({
		    checkboxClass: 'icheckbox_square-blue',
		    radioClass: 'iradio_square-blue',
		    increaseArea: '20%' // optional
		  });
		});
    </script>
  </body>
</html>
