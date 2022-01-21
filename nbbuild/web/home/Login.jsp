<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="Login.css">
<link rel="stylesheet" type="text/css" href="Home.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<title>Kullanici Girisi</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	$('#loginsubmit').click(function(){
		var name = $('#username').val();
		var pass =$('#password').val();
		$.ajax({
			type:'POST',
			data:{ email:name, password:pass},
			url:'../Login',
			success: function(result){
				var a = result;
				  if(a.trim() =="Gecerli"){
					window.location.href ="../User/User.jsp";
				}else{  
				$('#validation').html(a);}
				
			}
		});	
	});
});
</script>

<%@ include file ="Header.jsp" %>
<div id="login">
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Giris Yap</a>
							</div>
							<div class="col-xs-6">
								<a href="Register.jsp" id="register-form-link">Kayit Ol</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form method="post" id="login-form"  role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="email" id="username" tabindex="1" class="form-control" placeholder="Email Id" required>
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Sifre" required="required">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<div class="text-center">
												<input type="button" name="login-submit" id="loginsubmit" tabindex="4" class="btn btn-primary" value="Giris Yap" style="padding-left:5px;padding-right:5px;">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="Recover.jsp" tabindex="5" class="forgot-password">Sifreyi Unuttum?</a>
												</div>
											</div>
										</div>
									</div>
									<div id="validation"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>