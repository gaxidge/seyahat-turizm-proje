package adminServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connection.ConnectionString;

/**
 * Servlet implementation class DeleteFood
 */
@WebServlet("/DeleteFood")
public class DeleteFood extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foodType = request.getParameter("foodType");
		String foodName = request.getParameter("foodName");
		
		try{
			Connection con=ConnectionString.getCon();//getting db connection
			PreparedStatement ps = con.prepareStatement("delete from food where foodType='"+foodType+"'and foodName='"+foodName+"'");
			ps.executeUpdate();
			response.sendRedirect("Admin/ModifyFood.jsp");
			
			} catch (Exception e) {
			e.printStackTrace();
			}
	}

}
