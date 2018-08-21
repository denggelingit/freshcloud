<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
	<div class="navbar-header">
		<a class="navbar-brand" href="index.jsp"><strong>生鲜商城</strong></a>
	</div>
	<ul class="nav navbar-nav">
		<c:if test="${id == null}">
			<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;注册/登录</a></li>
		</c:if>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;个人中心<span class="caret"></span></a>
			<ul class="dropdown-menu"> 
				<li><a href="pages/front/center/member/MemberActionFront!editBasicPre.action">
					<span class="glyphicon glyphicon-list"></span>&nbsp;个人信息管理</a></li>
				<li><a href="pages/front/center/member/member_password_edit.jsp">
					<span class="glyphicon glyphicon-edit"></span>&nbsp;修改密码</a></li>
				<li><a href="pages/front/center/address/AddressActionFront!list.action">
					<span class="glyphicon glyphicon-map-marker"></span>&nbsp;收货地址</a></li>
				<li class="divider">&nbsp;</li>
				<li><a href="pages/front/center/orders/OrdersActionFront!list.action">
					<span class="glyphicon glyphicon-list-alt"></span>&nbsp;我的订单</a></li>
			</ul></li>
		<c:if test="${id != null }">
			<li><a href="ShopcarActionFront!list.action">
				<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;我的购物车</a></li>
		</c:if>
		<c:if test="${id == null }">
		<li><a href="ShopcarActionFront!list.action">
			<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;我的购物车</a></li>
		</c:if>
	</ul>  
	<c:if test="${id != null}">
	<ul class="nav navbar-nav navbar-right">
		<li class="dropdown"><a href="javascript:;"
			class="dropdown-toggle" data-toggle="dropdown"> <i
				class="glyphicon glyphicon-user"></i>&nbsp;${id}&nbsp;<span
				class="glyphicon glyphicon-chevron-down"></span></a>
			<ul class="dropdown-menu main-list">
				<li><a href="pages/front/center/member/member_password_edit.jsp"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改密码</a></li>
				<li class="divider"></li>
				<li><a href="LoginActionFront!logout.action"><i class="glyphicon glyphicon-log-out"></i>&nbsp;退出</a></li>
			</ul></li>
		<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
	</ul>
	</c:if>
</nav>
