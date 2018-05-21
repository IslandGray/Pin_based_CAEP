package com.wcp.DAO;

public class User {
	private String Account;
	private int ID;
	private String Name;
	private String School;
	private String StudentID;
	private String Group;
	private String Role;
	private String Passwd;
	
	
	public String getAccount() {
		return Account;
	}
	public void setAccount(String account) {
		Account = account;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getSchool() {
		return School;
	}
	public void setSchool(String school) {
		School = school;
	}
	public String getStudentID() {
		return StudentID;
	}
	public void setStudentID(String studentID) {
		StudentID = studentID;
	}
	public String getGroup() {
		return Group;
	}
	public void setGroup(String group) {
		Group = group;
	}
	public String getPasswd() {
		return Passwd;
	}
	public void setPasswd(String passwd) {
		Passwd = passwd;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	@Override
	public String toString() {
		return "User [Account=" + Account + ", ID=" + ID + ", Name=" + Name + ", School=" + School + ", StudentID="
				+ StudentID + ", Group=" + Group + ", Role=" + Role + ", Passwd=" + Passwd + "]";
	}	
	
	
}
