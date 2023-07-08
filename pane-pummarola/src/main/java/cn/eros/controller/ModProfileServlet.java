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
 * Servlet implementation class ModProfileServlet
 */
@WebServlet("/mod-profile")
public class ModProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("profile.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			Users usersModel = new Users();
			 
			int id = Integer.parseInt(request.getParameter("signin-id"));
			
			usersModel.setId(id);
			usersModel.setName(request.getParameter("signin-name"));   
			usersModel.setIndirizzo(request.getParameter("signin-address"));  
			usersModel.setEmail(request.getParameter("signin-email"));   
			usersModel.setPassword(request.getParameter("signin-password"));
			usersModel.setCarta(request.getParameter("signin-card"));
			
	
		
			try {
				UsersDao udao = new UsersDao(DbCon.getConnection());
				boolean result = udao.changeUser(usersModel);
				
				if(result) {
				
					if(request.getSession().getAttribute("auth") != null) {
						request.getSession().removeAttribute("auth");
						response.sendRedirect("login.jsp");
						
				  
						
					} else {
						response.sendRedirect("index.jsp");
					}
				}else {
					out.print("modifica fallita");
				}
			} catch (ClassNotFoundException | SQLException e) {
	
				e.printStackTrace();
			}
		
		
		
		
	}

}
}
