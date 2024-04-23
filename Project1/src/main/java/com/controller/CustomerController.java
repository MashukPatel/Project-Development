package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.RegistrationDao;
import com.model.CustomerCart;
import com.model.UserModel;

public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("create"))
		{
			UserModel rmodel=new UserModel();
			rmodel.setFirstname(request.getParameter("firstname"));
			rmodel.setLastname(request.getParameter("lastname"));
			rmodel.setEmail(request.getParameter("email"));
			rmodel.setMobileno(request.getParameter("mobileno"));
			rmodel.setPassword(request.getParameter("password"));
			
			int x=new RegistrationDao().userRegistration(rmodel);
			if(x > 0) {
				request.setAttribute("msg", "Record Inserted");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Record Not inserted");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}

		}
		
		else if(action.equalsIgnoreCase("Sign In"))
		{
			UserModel lmodel=new UserModel();
			lmodel.setEmail(request.getParameter("email"));
			lmodel.setPassword(request.getParameter("password"));
			
			UserModel model=new RegistrationDao().customerLogin(lmodel);
			if(model != null)
			{
				HttpSession session=request.getSession(true);
				session.setAttribute("customerid", model.getCustomerid());
				session.setAttribute("firstname", model.getFirstname());
				session.setAttribute("lastname", model.getLastname());
				session.setAttribute("totalcartitem", model.getTotalcartitem());
				session.setAttribute("model", model);
				response.sendRedirect("cust-home.jsp");
			}
			else
			{
				response.sendRedirect("login.jsp");
			}
			
		}
		
		else if(action.equalsIgnoreCase("addcart"))
		{
			CustomerCart cmodel=new CustomerCart();
			cmodel.setCustomerid(Integer.parseInt(request.getParameter("customerid")));
			cmodel.setProductid(Integer.parseInt(request.getParameter("productid")));
			cmodel.setProductname(request.getParameter("productname"));
			cmodel.setPrice(Integer.parseInt(request.getParameter("price")));
			cmodel.setSize(request.getParameter("size"));
			cmodel.setColor(request.getParameter("color"));
			cmodel.setCategory(request.getParameter("category"));
			cmodel.setImage(request.getParameter("image"));
			cmodel.setOriginalprice(Integer.parseInt(request.getParameter("originalprice")));
			cmodel.setDiscount(request.getParameter("discount"));
			
			int x=new RegistrationDao().userCart(cmodel);
			if(x > 0) {
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Item added to your cart.');");
		        out.println("</script>");
		        if(request.getParameter("category").equals("menproduct"))
		        {
		        	response.sendRedirect("menproducts.jsp");
		        }
		        else if(request.getParameter("category").equals("womenproduct"))
		        {
		        	response.sendRedirect("womenproduct.jsp");
		        }
		        
				
			}else {
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Something went wrong please try again!!');");
		        out.println("</script>");
		        response.sendRedirect("productmoredetail.jsp");
			}

		}

				
	}

}
