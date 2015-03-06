<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="pitaside.controller.Update" %>
<%@ page import="pitaside.model.ProjectInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 3/5/2015
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
<html>
<head>
	<title>Admin</title>
	<link href="cascading/style.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<title>Update Profile</title>
</head>
<body>

<div class="container-fluid">

<%
	if (session.getAttribute("update_project") != null) {

		ProjectInfo projectInfo = (ProjectInfo) session.getAttribute("update_project");
%>


<form class="form" enctype="multipart/form-data" method="post"
      action="<%=blobstoreService.createUploadUrl("/upload")%>">


	<%--<div class="row">--%>
		<%--<div class="col-lg-5">--%>
		<div class="form-group">
			<input type="hidden" name="key" value="<%=projectInfo.getProject_id()%>"/>
			<label class="form-control" for="p_name">Project Name</label>
			<input type="text" name="p_name" id="p_name" value="<%=projectInfo.getProject_name()%>" class="form-control"/>
		</div>



		<div class="form-group">
			<label class="form-control">Github URL</label>
			<input type="url" name="p_link" value="<%=projectInfo.getProject_link()%>" class="form-control"/>
		</div>


		<div class="form-group">
			<label class="form-control">Project Descriptions</label>
			<textarea class="form-control" name="p_desc" content="<%=projectInfo.getProject_description()%>"></textarea>
		</div>


		<div class="form-group">
			<label class="form-control">Project Image</label>
			<input class="form-control" type="file" name="p_img_key"/>
		</div>


		<p>
			<button class="btn btn-lg btn-primary" type="submit">Update</button>
		</p>
		<%--</div>--%>
	<%--</div>--%>

</form>

<%}%>
</body>
</html>
