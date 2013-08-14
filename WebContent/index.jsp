<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.io.*,java.util.*"%>

<%
	// 1. 获得Session创建时间, session对象在JSP中默认被构建
	Date createTime = new Date(session.getCreationTime());
	// 2. 获得上一次访问Session时间
	Date lastAccessTime = new Date(session.getLastAccessedTime());

	String title = "欢迎";
	Integer visitCount = 0;
	String visitCountKey = "visitCount";
	String userIDKey = "userID";

	// Check if this is new comer on your web page.
	if (session.isNew()) {
		title = "欢迎回来";
		session.setAttribute(visitCountKey, visitCount);
	}
	visitCount = (Integer) session.getAttribute(visitCountKey);
	visitCount = visitCount + 1;
	session.setAttribute(visitCountKey, visitCount);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 基于Java基本语法的JSP网站 -->
<html>
<head>
<title>Session Tracking</title>
</head>
<body>
	<h1>Session Tracking</h1>
	<table border="1">
		<tr>
			<th>Session info</th>
			<th>Value</th>
		</tr>
		<tr>
			<td>id</td>
			<td>
				<%=session.getId()%>
			</td>
		</tr>
		<tr>
			<td>Creation Time</td>
			<td>
				<%=createTime%>
			</td>
		</tr>
		<tr>
			<td>Time of Last Access</td>
			<td>
				<%=lastAccessTime%>
			</td>
		</tr>
		<tr>
			<td>Number of visits</td>
			<td>
				<%=visitCount%>
			</td>
		</tr>
	</table>
</body>
</html>