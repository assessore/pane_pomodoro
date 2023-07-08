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
import cn.eros.dao.ProductDao;
import cn.eros.model.Product;


/**
 * Servlet implementation class NewProductServlet
 */
@WebServlet("/new-product")
public class NewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	 public NewProductServlet() {
	        super();
 
	 }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("newproduct.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
		Product productModel = new Product();
		Double price = Double.parseDouble(request.getParameter("product-price"));
		
		productModel.setName(request.getParameter("product-name"));   
		productModel.setCategory(request.getParameter("product-category"));  
		productModel.setPrice(price);   
		productModel.setImage(request.getParameter("product-image"));

	
		try {
			ProductDao pdao = new ProductDao(DbCon.getConnection());
			boolean result = pdao.insertProduct(productModel);
			
			if(result) {
			
				response.sendRedirect("index.jsp");
			}else {
				out.print("inserimento fallito");
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
	
		}
	
	
}
	 }
