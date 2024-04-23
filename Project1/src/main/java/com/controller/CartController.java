package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.RegistrationDao;

public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cartid"));
		int x=new RegistrationDao().deleteCart(cid);
		if(x>0)
		{
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		//response.sendRedirect("cart.jsp");
	}

}
