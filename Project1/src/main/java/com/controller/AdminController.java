package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.dao.AdminDao;
import com.model.DressDetail;
import com.model.JacketDetail;
import com.model.JeansDetail;
import com.model.MenProductDetail;
import com.model.ProductModel;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, // 512MB
maxFileSize = 1024 * 1024 * 512, // 512MB
maxRequestSize = 1024 * 1024 * 512) // 512MB

public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

    private String extractfilename(Part file) {
	    String cd = file.getHeader("content-disposition");
	    System.out.println("Cd is.. "+cd);
	    String[] items = cd.split(";");
	    for (String string : items) {
	        if (string.trim().startsWith("filename")) {
	            return string.substring(string.indexOf("=") + 2, string.length()-1);
	        }
	    }
	    return "";
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("signin"))
		{
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			if(email.equalsIgnoreCase("mashukpatel02@gmail.com") && password.equalsIgnoreCase("mashuk"))
			{
				response.sendRedirect("Admin/dashboard.jsp");
			}
			else
			{
				response.sendRedirect("Admin/index.jsp"); 
			}
		}
		
		else if(action.equalsIgnoreCase("addproduct"))
		{
			ProductModel pm=new ProductModel();
			int op=Integer.parseInt(request.getParameter("originalprice"));
			int sp=Integer.parseInt(request.getParameter("sellingprice"));
			float diff=op-sp;
			float ratio=((diff/op) * 100);
			int discount=(int) ratio;
			if(request.getParameter("productcategory").equals("men"))
			{
				pm.setMenproductname(request.getParameter("productname"));
			}
			else if(request.getParameter("productcategory").equals("women"))
			{
				pm.setWomenproductname(request.getParameter("productname"));
			}
			pm.setOriginalprice(Integer.parseInt(request.getParameter("originalprice")));
			pm.setSellingprice(Integer.parseInt(request.getParameter("sellingprice")));
			pm.setProductcategory(request.getParameter("productcategory"));
			pm.setProducttype(request.getParameter("producttype"));
			pm.setDiscount(discount+"%");
			
            String savePath = "C:\\Users\\mashu\\eclipse-workspace\\Project1\\src\\main\\webapp\\productimages";
			
			File fileSaveDir=new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
				
			}
		
			Part file=request.getPart("image");
		 	String fileName=extractfilename(file);
		    file.write(savePath+File.separator+fileName);
		    String filePath=savePath+File.separator+fileName;
		    
			pm.setImage(fileName);
			
			
			int x=new AdminDao().addProduct(pm);
			if(x>0)
			{
				response.sendRedirect("Admin/dashboard.jsp");
			}
			else
			{
				response.sendRedirect("Admin/addproduct.jsp");
			}
		}
		
		else if(action.equalsIgnoreCase("addproductdetail"))
		{
			String category = request.getParameter("category");
			String subcategory = request.getParameter("subcategory");
			int x=0;
			
			if(((category.equals("men")) || (category.equals("women"))) && ((subcategory.equals("shirt")) || (subcategory.equals("t-shirt")) ))
			{
				MenProductDetail mpd=new MenProductDetail();
				mpd.setProductid(Integer.parseInt(request.getParameter("selectname")));
				mpd.setMaterialcomposition(request.getParameter("materialcomposition"));
				mpd.setFittype(request.getParameter("fittype"));
				mpd.setSleevetype(request.getParameter("sleevetype"));
				mpd.setCollarstyle(request.getParameter("collarstyle"));
				mpd.setNeckstyle(request.getParameter("neckstyle"));
				mpd.setStyle(request.getParameter("style"));
				mpd.setProducttype(subcategory);
				mpd.setProductcategory(category);
				
				x=new AdminDao().addProductDetails(mpd);
				
			}
			else if(((category.equals("men")) || (category.equals("women")) ) && subcategory.equals("jeanspant"))
			{
				JeansDetail jd=new JeansDetail();
				jd.setProductid(Integer.parseInt(request.getParameter("selectname")));
				jd.setMaterialtype(request.getParameter("materialtype"));
				jd.setLength(request.getParameter("length"));
				jd.setStyle(request.getParameter("style"));
				jd.setClosuretype(request.getParameter("closuretype"));
				jd.setOccasiontype(request.getParameter("occasiontype"));
				jd.setCareinstruction(request.getParameter("careinstruction"));
				jd.setProductcategory(category);
				
				x=new AdminDao().addJeansDetails(jd);
			}
			
			else if(((category.equals("men")) || (category.equals("women")) ) && subcategory.equals("jacket"))
			{
				JacketDetail jd=new JacketDetail();
				jd.setProductid(Integer.parseInt(request.getParameter("selectname")));
				jd.setMaterialcomposition(request.getParameter("materialcomposition"));
				jd.setStyle(request.getParameter("style"));
				jd.setFittype(request.getParameter("fittype"));
				jd.setLength(request.getParameter("length"));
				jd.setPattern(request.getParameter("pattern"));
				jd.setCareinstruction(request.getParameter("careinstruction"));
				jd.setProductcategory(category);
				
				x=new AdminDao().addJacketDetails(jd);
			}
			else if(category.equals("women") && subcategory.equals("dress"))
			{
				DressDetail dd=new DressDetail();
				dd.setProductid(Integer.parseInt(request.getParameter("selectname")));
				dd.setMaterialtype(request.getParameter("materialtype"));
				dd.setLength(request.getParameter("length"));
				dd.setOccasiontype(request.getParameter("occasiontype"));
				dd.setSleevetype(request.getParameter("sleevetype"));
				dd.setPattern(request.getParameter("pattern"));
				dd.setStyle(request.getParameter("style"));
				dd.setProductcategory(category);
				
				x=new AdminDao().addDressDetails(dd);
			}
			
			if(x>0)
			{
				response.sendRedirect("Admin/dashboard.jsp");
			}
			else
			{
				response.sendRedirect("Admin/addproductdetails.jsp");
			}
			
		}
	}

}
