package userServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import connection.ConnectionString;

/**
 * Servlet implementation class BookRoom
 */
@WebServlet("/BookRoom")
public class BookRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelName = request.getParameter("hotelName");
		String roomType = request.getParameter("roomType");
		String roomSize = request.getParameter("roomSize");
		int roomCost = Integer.parseInt(request.getParameter("roomCost"));
		String roomDate = request.getParameter("roomDate");
		String packagename = request.getParameter("packagename");
		String place = request.getParameter("place");
		HttpSession session = request.getSession();
		String email =(String) session.getAttribute("email");
		PrintWriter out = response.getWriter();
		
	if(packagename.equals("select")||place.equals("select")||roomDate.equals("")){
		out.println("Lutfen dogru ayrintilari girin");
	}else{
		
		try{
			Connection con=ConnectionString.getCon();//getting db connection
				PreparedStatement p = con.prepareStatement("insert into bookroom value(?,?,?,?,?,?,?,?)");
				p.setString(1, hotelName);
				p.setString(2, roomType);
				p.setString(3, roomSize);
				p.setInt(4, roomCost);
				p.setString(5, roomDate);
				p.setString(6, email);
				p.setString(7, packagename);
				p.setString(8, place);
				p.executeUpdate();
				out.print(hotelName+" Basariyla Rezerve Edildi");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}

}
