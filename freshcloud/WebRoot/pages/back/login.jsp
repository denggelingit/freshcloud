<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String loginUrl = basePath + "pages/back/LoginActionBack!login.action" ;
%> 
<html>
<head>
<base href="<%=basePath%>">
<title>生鲜商城</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<jsp:include page="/pages/plugins/include_javascript.jsp" />
<script type="text/javascript" src="js/back/login.js"></script>
</head>
<body class="box">
	<div class="container login-box">
		<div class="login-title text-center">
			<h1><small><span class="glyphicon glyphicon-user"></span>&nbsp;生鲜商城后台管理系统</small></h1>
		</div>
		<div class="login-content">
			<form class="form-horizontal" id="myform" action="<%=loginUrl%>" method="post">
				<div class="form-group" id="member.midDiv">
					<div class="col-md-10 col-md-push-1">
						<input type="text" id="member.mid" name="member.mid" class="form-control"
							placeholder="请输入登录用户名">
					</div>
				</div>
				<div class="form-group" id="member.passwordDiv">
					<div class="col-md-10 col-md-push-1">
						<input type="password" id="member.password" name="member.password" class="form-control"
							placeholder="请输入登录密码">
					</div>
				</div>
				<div class="form-group" id="codeDiv">
					<div class="col-md-8 col-md-push-1">
						<input type="text" id="code" name="code" class="form-control"
							placeholder="请输入验证码" maxlength="4" size="4">
					</div>
					<div class="col-md-2"><img src="ImageCode" id="imageCode" title="看不清？单击换一张图片"></div>
				</div>
				<div class="form-group">
					<div class="col-md-6 col-md-offset-4">
						<button type="submit" class="btn btn-primary" id="editBtn">登录</button>
						<button type="reset" class="btn btn-warning">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
