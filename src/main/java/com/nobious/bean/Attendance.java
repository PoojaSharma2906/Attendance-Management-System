package com.nobious.bean;

public class Attendance {

	
	private int attendanceId;
	private String username;
	private String date;
	private int casualLeave;
	private int sickLeave;
	private int earnedLeave;
	
	public Attendance() {
		super();
	}
	
	public Attendance(int attendanceId, String username, String date) {
		super();
		this.attendanceId = attendanceId;
		this.username = username;
		this.date = date;
	} 
	public Attendance(int attendanceId, String username,String date, int casualLeave, int sickLeave,
			int earnedLeave) {
		super();
		this.attendanceId = attendanceId;
		this.username = username;
		this.date = date;
		this.casualLeave = casualLeave;
		this.sickLeave = sickLeave;
		this.earnedLeave = earnedLeave;
	}

	public int getAttendanceId() {
		return attendanceId;
	}

	public void setAttendanceId(int attendanceId) {
		this.attendanceId = attendanceId;
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
		return "Attendance [attendanceId=" + attendanceId + ", username=" + username + ", date="
				+ date + ", casualLeave=" + casualLeave + ", sickLeave=" + sickLeave + ", earnedLeave=" + earnedLeave
				+ "]";
	}
	
	
	
	
	
}