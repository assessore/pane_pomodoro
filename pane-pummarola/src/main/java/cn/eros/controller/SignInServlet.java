package cn.eros.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.eros.connection.DbCon;
import cn.eros.dao.UsersDao;
import cn.eros.model.Users;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/sign-in")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("signin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			Users usersModel = new Users();
			
			usersModel.setName(request.getParameter("signin-name"));   
			usersModel.setIndirizzo(request.getParameter("signin-address"));  
			usersModel.setEmail(request.getParameter("signin-email"));   
			usersModel.setPassword(request.getParameter("signin-password"));
			usersModel.setCarta(request.getParameter("signin-card"));
		
			try {
				UsersDao udao = new UsersDao(DbCon.getConnection());
				boolean result = udao.registerUser(usersModel);
				
				if(result) {
				
					response.sendRedirect("index.jsp");
				}else {
					out.print("registrazione fallita");
				}
			} catch (ClassNotFoundException | SQLException e) {
	
				e.printStackTrace();
			}
		
		
		
		
	}

}
}
