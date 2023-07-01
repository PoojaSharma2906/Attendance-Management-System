package com.nobious.bean;

public class Leave {
	private int LeaveId;
	private String username;
	private String date;
	private int casualLeave;
	private int sickLeave;
	private int earnedLeave;
	public Leave(int leaveId, String username, String date, int casualLeave, int sickLeave, int earnedLeave) {
		super();
		LeaveId = leaveId;
		this.username = username;
		this.date = date;
		this.casualLeave = casualLeave;
		this.sickLeave = sickLeave;
		this.earnedLeave = earnedLeave;
	}
	public Leave(int leaveId, String username, int casualLeave, int sickLeave, int earnedLeave) {
		super();
		LeaveId = leaveId;
		this.username = username;
		this.casualLeave = casualLeave;
		this.sickLeave = sickLeave;
		this.earnedLeave = earnedLeave;
	}
	public int getLeaveId() {
		return LeaveId;
	}
	public void setLeaveId(int leaveId) {
		LeaveId = leaveId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCasualLeave() {
		return casualLeave;
	}
	public void setCasualLeave(int casualLeave) {
		this.casualLeave = casualLeave;
	}
	public int getSickLeave() {
		return sickLeave;
	}
	public void setSickLeave(int sickLeave) {
		this.sickLeave = sickLeave;
	}
	public int getEarnedLeave() {
		return earnedLeave;
	}
	public void setEarnedLeave(int earnedLeave) {
		this.earnedLeave = earnedLeave;
	}
	@Override
	public String toString() {
		return "Leave [LeaveId=" + LeaveId + ", username=" + username + ", date=" + date + ", casualLeave="
				+ casualLeave + ", sickLeave=" + sickLeave + ", earnedLeave=" + earnedLeave + "]";
	}
	
	
	
	
	
}