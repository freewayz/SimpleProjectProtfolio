<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 1/14/2015
  Time: 6:01 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="pitaside.model.ProjectInfo" %>
<%@ page import="pitaside.persistent.DAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta name="authors" content="">
	<meta name="description" content="">
	<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-social.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/font-awesome.css">
	<link href="cascading/style.css" rel="stylesheet">

	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<title>Portfolio</title>
</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">

	<div class="container-fluid">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collaspe" data-target=".navbar-collaspe">
				<span class="sr-only">Toggle Navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Abole
				<span style="font-size: 12px">&bigstar;</span> Portfolio</a>
		</div>

		<div class="navbar  navbar-right">
			<p class="pull-right">
				<a class="btn btn-social-icon btn-facebook" href="#">
					<i class="fa fa-facebook"> </i>
				</a>

				<a class="btn btn-social-icon btn-google-plus" href="#">
					<i class="fa fa-google-plus"> </i>
				</a>

				<a class="btn btn-social-icon btn-twitter" href="#">
					<i class="fa fa-twitter"> </i>
				</a>

				<a class="btn btn-social-icon btn-instagram" href="#">
					<i class="fa fa-instagram"> </i>
				</a>

			</p>
		</div>

		<form class="navbar-form navbar-right form-inline" method="get" action="porfolio.jsp">
			<p>
				<label class="badge">Filter Portfolio</label>
				<select class="form-control" name="p_type">
					<option name="p_type" value="Android Project">Android Project</option>
					<option name="p_type" value="Website Project">Website Project</option>
					<option name="p_type" value="Java Project">Java Project</option>
					<option name="p_type" value="Freelance Project">Freelance</option>
					<option name="p_type" value="Challenge Project">Challenge Project</option>
				</select>
				<button class="btn btn-primary" role="button" type="submit">Lookup</button>
			</p>
		</form>

	</div>
</div>

<%
	//	String project_type = request.getParameter("p_type");
	List<ProjectInfo> projectInfoList = DAOImpl.Datastore.getProject(request.getParameter("p_type"));
	List<ProjectInfo> allProjects = DAOImpl.Datastore.getAllProjects();
	pageContext.setAttribute("allProjects", allProjects);
	pageContext.setAttribute("projectInfoList", projectInfoList);
%>
<div class="container">

	<%
		if (request.getParameter("p_type") == null) {
	%>
	<c:forEach var="allproject" items="${pageScope.allProjects}" varStatus="count">
		<div id="project" class="col-lg-3">
			<img src="/image.do?project_image_key=${allproject.project_image_key}" class="img-thumbnail"
			     style="width: 400; height: 400">

			<div class="caption">
				<h3>${allproject.project_name}</h3>

				<p>
					<button type="button" class="btn btn-info"
					        data-toggle="popover" data-content="${allproject.project_description}"
					        placement="top" title="Short Description">
						Description
					</button>
					<a class="btn-link btn btn-social-icon" href="${allproject.project_link}">
						<i class="fa fa-github"></i>
					</a>
					<br/>
					<label>Last Updated</label><span
					style="color: #007bb6; font-style: italic">${allproject.timestamp}</span>
				</p>
			</div>
		</div>
	</c:forEach>

	<%
	} else {
	%>

	<c:forEach var="project" items="${pageScope.projectInfoList}" varStatus="count">
		<div id="project" class="col-lg-3">
			<img src="/image.do?project_image_key=${project.project_image_key}" class="img-thumbnail"
			     style="width: 400; height: 400">

			<div class="caption">
				<h3>
						${project.project_name}</h3>

				<p>
					<button type="button" class="btn btn-info"
					        data-toggle="popover" data-content="${project.project_description}"
					        data-container="body"
					        placement="top" title="Short Description">
						Description
					</button>
					<a class="btn-link btn btn-social-icon" href="${project.project_link}">
						<i class="fa fa-github"></i>
					</a>
					<br>
					<span style="color: #007bb6">Last Updated Since ${project.timestamp}</span>
				</p>
			</div>
		</div>
	</c:forEach>
	<%}%>
</div>
<script>
	$(function () {
		$("['popover']").popover('show');
	});
</script>
</body>
</html>
