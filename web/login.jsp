<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 1/14/2015
  Time: 6:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<title>Login</title>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="cascading/style.css" rel="stylesheet">
</head>
<body>


<div class="container">
		<form method="post" action="/signin" class="form-signin">
				<h2 class="form-signin-heading">Please Sign In</h2>
				<input type="text" name="username" class="form-control" placeholder="Username"/>
				<br/>
				<input type="password" name="password" class="form-control" placeholder="Password"/>
				<br/>
				<button type="submit" class="btn btn-lg btn-primary btn-block">Sign in</button>
		</form>
</div>
</body>
</html>
