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

/**
 * Servlet implementation class Transport
 */
@WebServlet("/Transport")
public class Transport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String transportType = request.getParameter("transportType");
		String vehicleType= request.getParameter("vehicleType");
		String vehicleName = request.getParameter("vehicleName");
		String vehicleCost = request.getParameter("vehicleCost");
		PrintWriter out = response.getWriter();
		
		try{
			Connection con=ConnectionString.getCon();//getting db connection
			PreparedStatement ps = con.prepareStatement("select * from transport where transportType ='"+transportType +"' and vehicleName='"+vehicleName+"'and vehicleType='"+vehicleType+"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				out.println("Arac Zaten Var. Lutfen baska bir arac girin");
				
			}else if(transportType.equals("")||vehicleType.equals("")||vehicleName.equals("")||vehicleCost.equals("")){
				out.println("Gecersiz Ayrintilar");
				
			}else{
				PreparedStatement p = con.prepareStatement("insert into transport value(?,?,?,?)");
				p.setString(1, transportType);
				p.setString(2, vehicleType);
				p.setString(3, vehicleName);
				p.setString(4, vehicleCost);
				p.executeUpdate();
				out.print(vehicleName+" Basariyla Eklendi");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
