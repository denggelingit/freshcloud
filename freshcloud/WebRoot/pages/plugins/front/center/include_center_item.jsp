<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<ul class="nav nav-pills nav-stacked">									<!-- 定义导航 -->
	<li class="${param.ch == 1 ? "active" : ""}"><a href="pages/front/center/orders/OrdersActionFront!list.action">我的订单</a></li>			<!-- 活跃导航项 -->
	<li class="${param.ch == 2 ? "active" : ""}"><a href="pages/front/center/member/MemberActionFront!editBasicPre.action">个人信息管理</a></li>
	<li class="${param.ch == 3 ? "active" : ""}"><a href="pages/front/center/member/member_password_edit.jsp">修改密码</a></li>
	<li class="${param.ch == 4 ? "active" : ""}"><a href="ShopcarActionFront!list.action">我的购物车</a></li>			<!-- 禁用导航项 -->
	<li class="${param.ch == 5 ? "active" : ""}"><a href="pages/front/center/address/AddressActionFront!list.action">收货地址</a></li>
</ul>
