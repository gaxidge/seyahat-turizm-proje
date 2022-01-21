<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="../home/Aside.css">
<link rel="stylesheet" type="text/css" href="../home/Home.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Oda Rezervasyonu</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	$('#packagename').change(function(){
		var packagename =$('#packagename').find('option:selected').text();
		$('#packagetable').show();
		$.ajax({
			type:'POST',
			data:{ packagename:packagename},
			url:'../SelectPlace',
			success: function(result){
				$('#placebox').html(result);
			}
		});	
	});
	
	$('#button').click(function(){
		var hotelName = $('#hotelName').val();
		var roomType = $('#roomType').val();
		var roomSize = $('#roomSize').val();
		var roomCost = $('#roomCost').val();
		var roomDate = $('#roomDate').val();
		var packagename = $('#packagename').find('option:selected').text();
		var place = $('#placebox').find('option:selected').text();
		$.ajax({
			type:'POST',
			data:{ hotelName:hotelName,roomType:roomType,roomSize:roomSize,roomCost:roomCost,roomDate:roomDate, packagename:packagename, place:place},
			url:'../BookRoom',
			success: function(result){
				$('#validation').html(result);
			}
		});	
	});
});
</script>
<%@ include file ="Header.jsp" %>
<%@ include file ="Aside.jsp" %>
	<section class="section">
		<div class="sectiondev">
			<div class="container">
				<h2>Oda Rezervasyonu</h2>
				<div class="panel col-sm-8">
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-12">
								<form >
								<div class="col-sm-12">
			    				<div class="col-sm-4">
								<div class="form-group">
			    				Paket Adi Sec:
			    				</div>
			    				</div>
			    				<div class="col-sm-4">
			    				<div class="form-group">
			    					<%
						    		try {
						    			Class.forName("com.mysql.cj.jdbc.Driver");
						    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey","root","1234");
						    			PreparedStatement ps = con.prepareStatement("select DISTINCT packagename from bookpackage where email='"+session.getAttribute("email")+"'");
						    			ResultSet rs = ps.executeQuery();
						    		%>
						    			<select name="packagename" id="packagename" class="form-control">
						    			<option value="select">select</option>
						    			<%while(rs.next()){ %>
						    				<option value="<%=rs.getString(1)%>" ><%=rs.getString(1) %></option>
						    			<%} %>
						    			</select>
						    			<% 
						    			}
						    		catch (Exception e) {
						    			e.printStackTrace();
						    			}%>
			    				</div>
			    				</div>
			    				</div>
			    				<div class="col-sm-12">
			    				<div class="col-sm-4">
								<div class="form-group">
			    				Yer Sec:
			    				</div>
			    				</div>
			    				<div class="col-sm-4">
			    				<div class="form-group">
			    					<select id="placebox" class="form-control">
			    					<option value="select">Seç</option>
			    					</select>
			    				</div>
			    				</div>
			    				</div>
								<div class="col-sm-12">
			    				<div class="col-sm-4">
								<div class="form-group">
			    				Otel Adi:
			    				</div>
			    				</div>
			    				<div class="col-sm-4">
			    				<div class="form-group">
			    					<input class="form-control" value="<%=session.getAttribute("hotelName") %>" type="text" id="hotelName" name="hotelName" readonly>
			    				</div>
			    				</div>
			    			</div>
			    			<div class="col-sm-12">
			    			<div class="col-sm-4">
			    				<div class="form-group">
			    				Oda Turu:
			    				</div>
			    				</div>
			    				<div class="col-sm-4">
			    				<div class="form-group">
			    					<input class="form-control" value="<%=session.getAttribute("roomType") %>" type="text" id="roomType" name="roomType" readonly>
			    				</div>
			    				</div>
			    			</div>
			    			<div class="col-sm-12">
			    			<div class="col-sm-4">
			    				<div class="form-group">
			    				Oda Boyutu:
			    				</div>
			    				</div>
			    				<div class="col-sm-4">
			    				<div class="form-group">
			    					<input class="form-control" value="<%=session.getAttribute("roomSize") %>" type="text" id="roomSize" name="roomSize" readonly>
			    				</div>
			    				</div>
			    			</div>
			    			<div class="col-sm-12">
			    			<div class="col-sm-4">
			    				<div class="form-group">
			    				Fiyat:
			    				</div>
			    				</div>
			    				<div class="col-sm-4">
			    				<div class="form-group">
			    					<input class="form-control" type="text" value="<%=session.getAttribute("roomCost") %>" id="roomCost" name="roomCost" readonly>
			    				</div>
			    				</div>
			    				</div>
			    			<div class="col-sm-12">
			    			<div class="col-sm-4">
			    				<div class="form-group">
			    				Tarih Sec:
			    				</div>
			    				</div>
			    				<div class="col-sm-4">
			    				<div class="form-group">
			    					<input class="form-control" type="Date" id="roomDate" name="roomDate" required="true">
			    				</div>
			    				</div>
			    				</div>
			    			<div class="col-sm-8">
			    			<div class="col-sm-4">
			    				<div class="form-group">
			    					<div class="text-right"> 
			    						<input type="button" id="button" value="Odayi Rezervasyon Et" class="btn btn-primary">
			    					</div>
			    				</div>
			    				</div>
			    				</div>
			    				<div class="col-sm-12">
			    				<div class="col-sm-12">
			    				<div id="validation"></div>
			    				</div>
			    				</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</section>
<%@ include file="../home/Footer.jsp" %>
</body>
</html>