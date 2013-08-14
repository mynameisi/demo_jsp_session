<%@page import="java.util.Date"%><!-- 用ctrl+space就可以直接在JSP文件中导入类 -->
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 这个引入，是为了使用JSTL(Java Standard Tag Library) -->
<% Logger logger = LoggerFactory.getLogger(this.getClass());//this is for server level logger %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Session 监控</title>
</head>
<body>
	<h1>Session 监控</h1>
	<ul>
		<li>Session ID: <%=session.getId()%>
		<li>Session 创建时间: <%=new Date(session.getCreationTime())%>
		<li>Session 上次访问时间: <%=new Date(session.getLastAccessedTime())%>
	</ul>
	<fieldset>
		<legend>一般JSP实现的Session访问次数统计</legend>
		<%
			session.setAttribute("VC", session.getAttribute("VC") == null ? 1 : ((Integer) session.getAttribute("VC") + 1));
			logger.debug("基于一般JSP代码的Session变量 VC 现在的值是: "+session.getAttribute("VC"));
		%>
		<%=session.getAttribute("VC")%>
	</fieldset>
	<hr>
	<fieldset>
		<legend>JSTL实现的Session访问次数统计</legend>
		<c:set var="PC" scope="session" value="${sessionScope.PC==null?1:sessionScope.PC+1}" />
		<c:out value="${sessionScope.PC}" />
		<% logger.debug("基于JSTL的Session变量 PC 现在的值是: "+session.getAttribute("PC")); %>
	</fieldset>

</body>
</html>