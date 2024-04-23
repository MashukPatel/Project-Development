package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.DressDetail;
import com.model.JacketDetail;
import com.model.JeansDetail;
import com.model.MenProductDetail;
import com.model.ProductModel;
import com.util.DBUtil;

public class AdminDao 
{
	Connection con=null;
	public int addProduct(ProductModel pm)
	{
		int x=0;
			String tablename=pm.getProductcategory()+"product";
		con=new DBUtil().getConnectionData();
		String query="";
		if(tablename.equals("menproduct"))
		{
			query="insert into "+tablename+"(menproductname, originalprice, sellingprice, image, producttype, discount) values(?,?,?,?,?,?)";
		}
		else if(tablename.equals("womenproduct"))
		{
			query="insert into "+tablename+"(womenproductname, originalprice, sellingprice, image, producttype, discount) values(?,?,?,?,?,?)";
		}
		try {
			PreparedStatement st=con.prepareStatement(query);
			if(tablename.equals("menproduct"))
			{
				st.setString(1, pm.getMenproductname());
			}
			else if(tablename.equals("womenproduct"))
			{
				st.setString(1, pm.getWomenproductname());
			}
			
		    st.setInt(2, pm.getOriginalprice());
		    st.setInt(3, pm.getSellingprice());
			st.setString(4, pm.getImage());
			st.setString(5, pm.getProducttype());
			st.setString(6, pm.getDiscount());
			
			x=st.executeUpdate();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	
	public int addProductDetails(MenProductDetail mpd)
	{
		int x=0;
		String query="";
		if(mpd.getProductcategory().equals("men") && ((mpd.getProducttype().equals("shirt")) || (mpd.getProducttype().equals("t-shirt")) ))
		{
			query="insert into menproductdetail(productid, materialcomposition, fittype, sleevetype,collarstyle,neckstyle,style,producttype) values(?,?,?,?,?,?,?,?)";
		}
		else if(mpd.getProductcategory().equals("women") && ((mpd.getProducttype().equals("shirt")) || (mpd.getProducttype().equals("t-shirt")) ))
		{
			query="insert into womenproductdetail(productid, materialcomposition, fittype, sleevetype,collarstyle,neckstyle,style,producttype) values(?,?,?,?,?,?,?,?)";
		}
		con=new DBUtil().getConnectionData();
		
		try {
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1, mpd.getProductid());
			st.setString(2, mpd.getMaterialcomposition());
			st.setString(3, mpd.getFittype());
			st.setString(4, mpd.getSleevetype());
			st.setString(5, mpd.getCollarstyle());
			st.setString(6, mpd.getNeckstyle());
			st.setString(7, mpd.getStyle());
			st.setString(8, mpd.getProducttype());
			
			x=st.executeUpdate();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	
	public int addJeansDetails(JeansDetail jd)
	{
		int x=0;
		String query="";
		if(jd.getProductcategory().equals("men"))
		{
			query="insert into menjeansdetail(productid, materialtype, length, style, closuretype, occasiontype, careinstruction) values(?,?,?,?,?,?,?)";
		}
		else if(jd.getProductcategory().equals("women"))
		{
			query="insert into womenjeansdetail(productid, materialtype, length, style, closuretype, occasiontype, careinstruction) values(?,?,?,?,?,?,?)";
		}
		con=new DBUtil().getConnectionData();
		try 
		{
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1, jd.getProductid());
			st.setString(2, jd.getMaterialtype());
			st.setString(3, jd.getLength());
			st.setString(4, jd.getStyle());
			st.setString(5, jd.getClosuretype());
			st.setString(6, jd.getOccasiontype());
			st.setString(7, jd.getCareinstruction());
			
			x=st.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return x;
	}
	
	public int addJacketDetails(JacketDetail jd)
	{
		int x=0;
		String query="";
		if(jd.getProductcategory().equals("men"))
		{
			query="insert into menjacketdetail(productid, materialcomposition, style, fittype, length, pattern, careinstruction) values(?,?,?,?,?,?,?)";
		}
		if(jd.getProductcategory().equals("women"))
		{
			query="insert into womenjacketdetail(productid, materialcomposition, style, fittype, length, pattern, careinstruction) values(?,?,?,?,?,?,?)";
		}
		con=new DBUtil().getConnectionData();
		try 
		{
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1, jd.getProductid());
			st.setString(2, jd.getMaterialcomposition());
			st.setString(3, jd.getStyle());
			st.setString(4, jd.getFittype());
			st.setString(5, jd.getLength());
			st.setString(6, jd.getPattern());
			st.setString(7, jd.getCareinstruction());
			
			x=st.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return x;
	}
	
	public int addDressDetails(DressDetail dd)
	{
		int x=0;
		String query="insert into womendressdetail(productid, materialtype, length, occasiontype, sleevetype, pattern, style) values(?,?,?,?,?,?,?)";
		con=new DBUtil().getConnectionData();
		try 
		{
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1, dd.getProductid());
			st.setString(2, dd.getMaterialtype());
			st.setString(3, dd.getLength());
			st.setString(4, dd.getOccasiontype());
			st.setString(5, dd.getSleevetype());
			st.setString(6, dd.getPattern());
			st.setString(7, dd.getStyle());
			
			x=st.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return x;
	}

}
