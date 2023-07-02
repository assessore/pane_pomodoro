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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/users-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String email = request.getParameter("login-email");  //preso dalla login.jsp nome class
			String password = request.getParameter("login-password");

			try {
				UsersDao udao = new UsersDao(DbCon.getConnection());
				Users users = udao.userLogin(email, password);
				
				if(users != null) {
					
					request.getSession().setAttribute("auth", users);
					response.sendRedirect("index.jsp");
				}else {
					out.print("user login fallito");
				}
			} catch (ClassNotFoundException | SQLException e) {
	
				e.printStackTrace();
			}
			
			
		
		}
	}
}

