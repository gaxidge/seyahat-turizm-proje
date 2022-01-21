
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import connection.ConnectionString;
import java.sql.*;
import jakarta.servlet.http.Cookie;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			Connection con = ConnectionString.getCon();// getting db connection
			PreparedStatement ps = con
					.prepareStatement("select name, email, mobile,password  from register where email= ? and password = ?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String name = rs.getString(1);
				String emailid = rs.getString(2);
				String mobile = rs.getString(3);
                                //Session
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("email", emailid);
				session.setAttribute("mobile", mobile);
                                
                                // cookiler 
                                Cookie MobileCookie = new Cookie("mobile", mobile);
                                Cookie passwordCookie = new Cookie("password", password);

                                  MobileCookie.setMaxAge(1000000);
                                  passwordCookie.setMaxAge(1000000);

                                  response.addCookie(MobileCookie);          
                                  response.addCookie(passwordCookie);
                                  
                                  
                                  
                                  
                                    String SQL_QUERY = "SELECT COUNT(*) as rowcount FROM hotel ";
                       Statement statementProduct1=null;
                       ResultSet rs2 = null;
                       statementProduct1 = con.createStatement();
                       rs2 = statementProduct1.executeQuery(SQL_QUERY);
                        while(rs2.next()) {
                  int count = rs2.getInt("rowcount");
                                             Cookie userCookieUserRezervasyonCount = new Cookie("hotelSayisi", String.valueOf(count));
                                             userCookieUserRezervasyonCount.setMaxAge(1000000);
                                             response.addCookie(userCookieUserRezervasyonCount);
                        }
                                  

                                // cookiler 
                                
				out.println("Gecerli");
			} else {
				out.println("Gecersiz kullanici adi veya sifre");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
