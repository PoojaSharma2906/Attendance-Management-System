package com.nobious.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.nobious.bean.Attendance;
import com.nobious.dao.UserDao;


public class UserDaoImpl implements UserDao 
{
	private Connection con=null;
	public UserDaoImpl() 
	{
		 con = ConnectionProvider.getConnection();
	}
	@Override
	public ArrayList<Attendance> getAllAttendance() {
		try 
		{
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from attendance;");
			ArrayList<Attendance> list=new ArrayList<>();
			while(rs.next())
			{
				Attendance att=new Attendance(rs.getInt(1), rs.getString(2),rs.getString(3));
				list.add(att);
			}
			return list;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return null;
	}
	@Override
	public Attendance getAttendanceByUsername(String username) {
		return null;
	}
	@Override
	public boolean approveLeave(String username, String leaveType) {

		PreparedStatement ps=null;
		try 
		{
			
			ps=con.prepareStatement("call approveLeave(?,?)");
			ps.setString(1,username);
			ps.setString(2,leaveType);
			int status=ps.executeUpdate();
			con.close();
			return status>0?true:false;
					
		}
		catch (Exception e) {

			e.printStackTrace();
		}
		
		return false;
	}
	@Override
	public boolean disApproveLeave(String username, String leaveType) {

		PreparedStatement ps=null;
		try
		{
			ps=con.prepareStatement("call disApproveLeave(?,?)");
			ps.setString(1,username);
			ps.setString(2,leaveType);
			int status=ps.executeUpdate();
			con.close();
			return status>0?true:false;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	
}