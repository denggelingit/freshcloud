<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>生鲜商城</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<jsp:include page="/pages/plugins/include_javascript.jsp" />
<script type="text/javascript" src="js/front/center/orders/orders_list.js"></script>
</head>
<body>
	<div class="container">
		<div id="headDiv" class="row">
			<div class="col-md-12 col-xs-12">
				<jsp:include page="/pages/plugins/front/include_menu_member.jsp" />
			</div>
		</div>
		<div id="contentDiv" class="row">
			<div class="col-md-2 col-xs-2">
				<jsp:include page="/pages/plugins/front/center/include_center_item.jsp">
					<jsp:param value="1" name="ch"/>
				</jsp:include>
			</div>
			<div class="col-md-10 col-xs-10">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<strong><span class="glyphicon glyphicon-list-alt"></span>&nbsp;我的订单</strong>
					</div>
					<div class="panel-body">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th class="text-center"><strong>订单编号</strong></th>
									<th class="text-center"><strong>总额</strong></th>
									<th class="text-center"><strong>创建时间</strong></th>
									<th class="text-center"><strong>交易操作</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allOrderses}" var="orders">
									<tr>
										<td class="text-center">${orders.oid}</td>
										<td class="text-center">${orders.price}</td>
										<td class="text-center">${orders.subdate}</td>
										<td class="text-center"> 
											<a type="button" class="btn btn-primary btn-xs" href="pages/front/center/orders/OrdersActionFront!show.action?oid=${orders.oid}">
												<span class="glyphicon glyphicon-list-alt"></span>&nbsp;查看详情</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="splitBarDiv" style="float:right">
							<jsp:include page="/pages/plugins/split_page_plugin_bar.jsp"/> 
						</div>
					</div>
					<div class="panel-footer">
						<jsp:include page="/pages/plugins/include_alert.jsp"/>
					</div>
				</div>
			</div>
		</div>
		<div id="footDiv" class="row navbar-fixed-bottom">
			<jsp:include page="/pages/plugins/include_foot.jsp" />
		</div>
		<jsp:include page="/pages/plugins/back/include_member_show.jsp"/>
	</div>
</body>
</html>
