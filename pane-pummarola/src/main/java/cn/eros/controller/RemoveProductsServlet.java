package cn.eros.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.eros.connection.*;
import cn.eros.dao.ProductDao;


/**
 * Servlet implementation class RemoveProductsServlet
 */
@WebServlet("/remove-products")
public class RemoveProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			int id = Integer.parseInt(request.getParameter("id"));
			ProductDao pd = new ProductDao(DbCon.getConnection());
			pd.removeProduct(id);
			response.sendRedirect("index.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
