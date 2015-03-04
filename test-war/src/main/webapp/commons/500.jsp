<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ page import="org.apache.commons.logging.LogFactory"%>
<%@ page
	import="org.caesar.test.template.assistant.SpringContextUtil"%>
<%@ page import="org.caesar.test.web.util.StaticRecouseUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>错误页面</title>
<%
	StaticRecouseUtil staticRecouseUtil = (StaticRecouseUtil)SpringContextUtil.getBean("StaticRecouseUtil");
	staticRecouseUtil.getStaticRecouseUtil(request); 
%>
<link href="${ctx}/style/default/css/reset_portal.css?v=${eppVersion}"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/style/default/css/layout_portal.css?v=${eppVersion}"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/style/default/css/shop2011.css?v=${eppVersion}"
	rel="stylesheet" type="text/css" />
</head>

<body style="height: 100%;">
	<%
		//Exception from JSP didn't log yet ,should log it here.
		String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
		LogFactory.getLog(requestUri).error(exception.getMessage(), exception);
	%>
	<div class="car_Headernav">
		<div class="logoimg">
			<a href="http://www.suning.com" title="返回苏宁易购首页"><img
				src="${ctx}/style/default/images/carlogo.jpg?v=${eppVersion}"
				width="193" height="53" alt="苏宁易购">
			</a><a href="#" class="logoY"><img
				src="${ctx}/style/default/images/logoY.jpg" width="64" height="18"
				alt="易付宝" />
			</a>
		</div>
		<div class="shopCarnav shopnav03">
			<span></span>
		</div>
	</div>
	<div
		style="background:url(${ctx}/style/default/images/error.jpg?v=${eppVersion}) no-repeat center center; width:520px; height:320px; border:8px solid #4c70b0; color:red; font-size:12px; margin:100px auto 0; line-height:20px;">
		<div style="margin: 65px 0 0 210px;">
			<h1
				style="font-family: Verdana, Geneva, sans-serif; color: red; font-size: 30px; padding-bottom: 20px;">Error</h1>
			<p>
				系统内部出错，请稍后再试。<br /> <a href="javascript:history.back();">点击返回</a>
			</p>
		</div>
		<div style="display: none;"></div>
	</div>
</body>
</html>
