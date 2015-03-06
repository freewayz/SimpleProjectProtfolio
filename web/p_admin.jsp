<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 1/14/2015
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="pitaside.model.ProjectInfo" %>
<%@ page import="pitaside.persistent.DAOImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();%>
<html>
<head>
	<title>Admin</title>
	<link href="cascading/style.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<%--<script type="text/javascript">--%>
		<%--$(document).ready(function(){--%>
			<%--$("#addproject").modal('show');--%>
		<%--});--%>
	<%--</script>--%>
</head>
<body>
<%--<div class="main-container">--%>


	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/p_admin.jsp">HOME</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#addproject" role="button"
					       data-toggle="modal">Create Portfolio</a></li>
					<li><a href="porfolio.jsp">Portfolio</a></li>
					<li><a href="#">Help</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</div>


	<div id="addproject" class="modal fade">
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal"  aria-hidden="true">x</button>
						<h4 class="modal-title">Add New Projects</h4>
					</div>

					<div class="modal-body">
						<form class="form" enctype="multipart/form-data" method="post"
						      action="<%=blobstoreService.createUploadUrl("/upload")%>">


							<div class="row">
								<%--<div class="col-lg-5">--%>
									<div class="form-group">
										<label class="form-control" for="p_name">Project Name</label>
										<input type="text" name="p_name" id="p_name" class="form-control"/>
									</div>
									<div class="form-group">
										<label class="form-control" for="p_type">Project Type</label>
										<select class="form-control" id="p_type" name="p_type">
											<option value="Android Project">Android Project</option>
											<option value="Java Project">Java Project</option>
											<option value="Website Project">Website Project</option>
											<option value="Freelance">Freelance</option>
											<option value="Challenge Project">Challenges Project</option>
										</select>
									</div>


									<div class="form-group">
										<label class="form-control">Github URL</label>
										<input type="url" name="p_link" class="form-control"/>
									</div>


									<div class="form-group">
										<label class="form-control">Project Descriptions</label>
										<textarea class="form-control" name="p_desc"></textarea>
									</div>


									<div class="form-group">
										<label class="form-control">Project Image</label>
										<input class="form-control" type="file" name="p_img_key"/>
									</div>


									<p>
										<button class="btn btn-lg btn-primary" type="submit">Add To Portfolio</button>
									</p>
								<%--</div>--%>
							</div>

						</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
				</div>
		</div>
	</div>


	<%
		List<ProjectInfo> projectInfos = DAOImpl.Datastore.getAllProjects();
		pageContext.setAttribute("projectInfos", projectInfos);
	%>
	<div class="container">
		<h2>All Project Portofolio</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
				<th>#S/N</th>
				<th>Project Name</th>
				<th>Project Type</th>
				<th>Description</th>
				<th>Github URL</th>
				<th>Last Updated</th>
				</thead>
					<c:forEach var="project" items="${pageScope.projectInfos}" varStatus="count">
						<tr>
							<td>${count.index}</td>
							<td>${project.project_name}</td>
							<td>${project.project_type}</td>
							<td>${project.project_description}</td>
							<td>${project.project_link}</td>
							<td>${project.timestamp}</td>
							<td><a class="btn btn-default" href="/update.do?p_name=${project.project_name}">Update</a>
							<td><a class="btn btn-danger" href="/delete.do?id=${project.project_id}&&blob_key=${project.project_image_key}">X</a>
							</td>
							<td></td>
						</tr>
					</c:forEach>
			</table>
		</div>
	</div>

<%--</div>--%>

<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
