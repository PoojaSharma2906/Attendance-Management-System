package com.nobious.bean;

public class User {

	
	private int userId;
	private String name;
	private String email;
	private Long phoneno;
	private String password;
	private Attendance attendance;
	
	public User() {
		super();
	}
	public User(int userId, String name, String email, Long phoneno,String password) {
		super();
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.phoneno = phoneno;
		this.password=password;
	}
	
	public User(int userId, String email, Long phoneno) {
		super();
		this.userId = userId;
		this.email = email;
		this.phoneno = phoneno;
	}
	
	
     public User(int userId, String name, String email, Long phoneno, Attendance attendance) {
		super();
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.phoneno = phoneno;
		this.attendance = attendance;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(Long phoneno) {
		this.phoneno = phoneno;
	}
	
	public Attendance getAttendance() {
		return attendance;
	}
	public void setAttendance(Attendance attendance) {
		this.attendance = attendance;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", email=" + email + ", phoneno=" + phoneno + ", password="
				+ password + ", attendance=" + attendance + "]";
	}
	
}
