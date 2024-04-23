package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.CustomerCart;
import com.model.UserModel;
import com.util.DBUtil;

public class RegistrationDao 
{
	Connection con=null;
	
	public int userRegistration(UserModel rModel)
	{
		int x=0;
		con=new DBUtil().getConnectionData();
		String query="insert into customer(firstname, lastname, email, mobileno, password) values(?,?,?,?,?)";
		try {
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, rModel.getFirstname());
			st.setString(2, rModel.getLastname());
			st.setString(3, rModel.getEmail());
			st.setString(4, rModel.getMobileno());
			st.setString(5, rModel.getPassword());
			
			x=st.executeUpdate();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	
	public UserModel customerLogin(UserModel lmodel)
	{
		UserModel model=null;
		con=new DBUtil().getConnectionData();
		String query="select * from customer where email=? and password=?";
		try {
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, lmodel.getEmail());
			st.setString(2, lmodel.getPassword());
			
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				model=new UserModel();
				model.setCustomerid(rs.getInt(1));
				model.setFirstname(rs.getString(2));
				model.setLastname(rs.getString(3));
				model.setEmail(rs.getString(4));
				model.setMobileno(rs.getString(5));
				model.setPassword(rs.getString(6));
			}
			String query2="select count(*) as cartid from customercart where customerid=?";
			st=con.prepareStatement(query2);
			st.setInt(1, model.getCustomerid());
			rs=st.executeQuery();
			if(rs.next())
			{
				model.setTotalcartitem(rs.getInt("cartid"));
			}
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return model;
	}
	
	public int userCart(CustomerCart cModel)
	{
		int x=0;
		con=new DBUtil().getConnectionData();
		String query="insert into customercart(customerid, productid, productname, price, size, color, category, image, originalprice, discount) values(?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1, cModel.getCustomerid());
			st.setInt(2, cModel.getProductid());
			st.setString(3, cModel.getProductname());
			st.setInt(4, cModel.getPrice());
			st.setString(5, cModel.getSize());
			st.setString(6, cModel.getColor());
			st.setString(7, cModel.getCategory());
			st.setString(8, cModel.getImage());
			st.setInt(9, cModel.getOriginalprice());
			st.setString(10, cModel.getDiscount());
			
			x=st.executeUpdate();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	
	public int deleteCart(int cartid)
	{
		int x=0;
		con=new DBUtil().getConnectionData();
		String qry="delete from customercart where cartid=?";
		try {
			PreparedStatement st=con.prepareStatement(qry);
			st.setInt(1,cartid);
			
			x=st.executeUpdate();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}

}
