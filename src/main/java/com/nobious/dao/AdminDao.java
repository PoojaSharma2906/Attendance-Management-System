package com.nobious.dao;

import java.util.ArrayList;
import java.util.List;
import com.nobious.bean.Attendance;
import com.nobious.bean.Leave;
import com.nobious.bean.User;

public interface AdminDao 
{
	boolean addUser(User user);
	String validateUser(String uname,String pass);
	boolean updateUser(User newuser);
	boolean deleteUser(String name);
	ArrayList<User> getAllUsers();
	ArrayList<Attendance> getAllAttendance();
	ArrayList<Attendance> getAttendance(String username);
	ArrayList<Object[]> getAllLeaveRequest();
	ArrayList<Leave> getAllLeaveDetails();
	ArrayList<Object[]> getLeaveDetails(String username);
	boolean approveLeaveTransaction(String username,String leaveType,String date);
	boolean disApproveLeaveTransaction(String username,String leaveType,String date);
	List<Object[]> getAcknowledgement(String username);
	
}