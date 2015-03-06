<%@ page import="pitaside.model.Accounts" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 1/14/2015
  Time: 6:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Admin Panel</title>
</head>
<body>

<%
	Accounts accounts = (Accounts) session.getAttribute("accounts");
	if (accounts != null) {
		if (accounts.getUsername().equals("admin")) {
%>
<jsp:include page="index.jsp" flush="false"/>
<%
	} else {
		response.sendRedirect("/login.jsp");
	}

%>
<%
} else {
%>
<p>Welcome Guest <a href="login.jsp">Login Into Admin</a></p>
<%
	}
%>

</body>
</html>
