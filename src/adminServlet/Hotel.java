package adminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connection.ConnectionString;
import jakarta.servlet.http.Cookie;
import java.sql.*;
/**
 * Servlet implementation class Hotel
 */
@WebServlet("/Hotel")
public class Hotel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelName = request.getParameter("hotelName");
		PrintWriter out = response.getWriter();
		
		try{
			Connection con=ConnectionString.getCon();//getting db connection
			PreparedStatement ps = con.prepareStatement("select hotelName from hotel where hotelName ='"+hotelName +"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				out.println(""+ hotelName +" zaten var. Lutfen baska bir otel girin");
				
			}else if(hotelName.equals("")){
				out.println("Gecersiz ayrintilar");
				
			}else{
				PreparedStatement p = con.prepareStatement("insert into hotel value(?)");
				p.setString(1, hotelName);
				p.executeUpdate();
                                        for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("hotelSayisi")) {
                   String nowCookieValue= cookie.getValue();
                   int nowValueInt = Integer.parseInt(nowCookieValue);
                   nowValueInt++;
                   cookie.setValue(String.valueOf(nowValueInt));
                   response.addCookie(cookie);
                }
            }
				out.print(hotelName+" Basariyla Eklendi");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
