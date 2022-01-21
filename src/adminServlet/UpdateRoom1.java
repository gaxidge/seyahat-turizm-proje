package adminServlet;

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
 * Servlet implementation class UpdateRoom1
 */
@WebServlet("/UpdateRoom1")
public class UpdateRoom1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hotelName = request.getParameter("hotelName");
		String roomType = request.getParameter("roomType");
		String roomSize = request.getParameter("roomSize");
		String roomCost = request.getParameter("roomCost");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		try{
			Connection con=ConnectionString.getCon();//getting db connection
			PreparedStatement ps = con.prepareStatement("update room set hotelName =?,roomType=?,roomSize=?,roomCost=? where hotelName='"+hotelName+"'and roomType='"+roomType+"'and roomSize='"+roomSize+"'");
			ps.setString(1,hotelName );
			ps.setString(2,roomType );
			ps.setString(3,roomSize );
			ps.setString(4,roomCost );
			ps.executeUpdate();
			
			out.println(hotelName+"Oteli Basariyla Degistirildi");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
