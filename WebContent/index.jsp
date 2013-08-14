<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.io.*,java.util.*"%>

<%
	//以下代码负责进行Session计数，思想很简单
	//从session中获取已有的数
	//如果有，表示是老session，就+1，然后再放回Session
	//如果没有，表示是新session，就创建一个键值对("VK", 1),保存这个计数器
	final String VISIT_COUNT_KEY = "VCK";
	Integer visitCount  = (Integer) session.getAttribute(VISIT_COUNT_KEY);
	
	if(visitCount!=null){
		session.setAttribute(VISIT_COUNT_KEY, visitCount+1);
	}else{
		session.setAttribute(VISIT_COUNT_KEY, 1);
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Session 监控</title>
</head>
<body>
	<h1>Session 监控</h1>
	<ul>
		<li>Session ID: <%=session.getId() %>
		<li>Session 创建时间: <%=new Date(session.getCreationTime()) %>
		<li>Session 上次访问时间: <%=new Date(session.getLastAccessedTime()) %>
		<li>Session 访问次数: <%=session.getAttribute(VISIT_COUNT_KEY) %>
	</ul>
</body>
</html>