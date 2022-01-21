<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="home/Aside.css">
<link rel="stylesheet" type="text/css" href="home/Home.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>aside</title>
</head>
<body>
	<aside class="aside">
			<ul class="nav navbar-nav">
				<li><a href="User.jsp">Ana Sayfa</a></li>
				<li><a href="Profile.jsp">Profil</a></li>
				<li><a href="Package.jsp">Paket Seçimi</a></li>
				<li><a href="Room.jsp">Oda Seçimi</a></li>
				<li><a href="Food.jsp">Yemek Seçimi</a></li>
				<li><a href="Transport.jsp">Ulasim Seçimi</a></li>
				<li><a href="ModifyPackage.jsp">Paketi Güncelle</a></li>
				<li><a href="ModifyRoom.jsp">Oda Güncelle</a></li>
				<li><a href="ModifyFood.jsp">Yemegi Güncelle</a></li>
				<li><a href="ModifyTransport.jsp">Ulasim Güncelle</a></li>
				<li><a href="Confirmation.jsp">Onayla</a></li>
                                 <li>
                            <a>
                           Toplam Hotel Sayisi :  <%
                           Cookie[] cookies2 = request.getCookies();

if (cookies2 != null) {
 for (Cookie cookie : cookies2) {
   if (cookie.getName().equals("hotelSayisi")) {
       %>
       <span><%=cookie.getValue()%></span>
                           
                           <%
    }
  }
}
                           
                           %>
                            </a>
                        </li>
			</ul>
			
	</aside>
</body>
</html>