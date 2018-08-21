<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="text-center">
	<div class="row">
    <p style='height: 20px;line-height: 20px;padding: 15px 0px 0px 0px;'>欢迎访问生鲜商城，本项目部署在阿里云</p>
    <a href="https://www.cnblogs.com/denggelin/" target="_blank">我的博客园</a>
	<p style='height: 40px;line-height: 40px;border-top: 0px solid #e6e6e6;'>最佳浏览器：IE8、IE9、IE10、IE11、chrome 46及以上版本,建议分辨率为1024*768以上</p>
	</div>
</div>
