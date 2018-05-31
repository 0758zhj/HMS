<%@ page contentType="text/html; charset=gbk" language="java" %>
<html>
<head>
<title>正在退出</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
session.setAttribute("manager", null);
session.setAttribute("position", null);

session.invalidate();
response.sendRedirect("login.jsp");
%>
</body>
</html>
