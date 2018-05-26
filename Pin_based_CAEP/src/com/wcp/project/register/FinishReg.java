package com.wcp.project.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.*;

import com.wcp.DAO.User;

public class FinishReg {
	private String inputEmail;
	private String inputName;
	private String inputPassword;
	private String inputRole;
	private String inputSchool;
	private String inputStuID;
	private String inputPhone;
	
	
	public String finishReg() throws Exception {
		User u=new User();
		try {
			
			u.setAccount(inputEmail);
			u.setName(inputName);
			u.setPasswd(inputPassword);
			switch(inputSchool) {
			case "0":{
				u.setSchool("哈尔滨工业大学");break;
			}
			case "65535":{
				u.setSchool("Others");break;
			}
			default:u.setSchool("Free");
			}
			
			u.setStudentID(inputStuID);
			switch(inputRole) {
			case "0":{
				u.setRole("student");
				u.setGroup(inputPhone);
				break;
			}
			case "1":{
				u.setRole("teacher");
				u.setGroup("teacher");
				break;
			}
			case "2":{
				u.setRole("TA");
				u.setGroup("TA");
				break;
			}
			default:u.setRole("student");
					u.setGroup(inputPhone);
			}
		}catch(Exception e) {
			System.out.println(toString());
			e.printStackTrace();
		}
		try {
			Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
			SessionFactory sessionFactory=config.buildSessionFactory();
			Session session=sessionFactory.openSession();// 相当于得到一个Connection
			// 开启事务
	        session.beginTransaction();
	        // 操作
	        session.save(u);
	        // 事务提交
	        session.getTransaction().commit();
	        session.close();
	        sessionFactory.close();
	        
		    System.out.println(inputEmail+" sign up successfully");
	        return "SUCCESS";
		}catch(Exception e) {
			System.out.println(toString());
			System.out.println(u.toString());
			e.printStackTrace();
		}
		System.out.println(inputEmail+" sign up failed");
		return "FAILED";
		
	}


	public String getInputEmail() {
		return inputEmail;
	}


	public void setInputEmail(String inputEmail) {
		this.inputEmail = inputEmail;
	}


	public String getInputName() {
		return inputName;
	}


	public void setInputName(String inputName) {
		this.inputName = inputName;
	}


	public String getInputRole() {
		return inputRole;
	}


	public void setInputRole(String inputRole) {
		this.inputRole = inputRole;
	}


	public String getInputSchool() {
		return inputSchool;
	}


	public void setInputSchool(String inputSchool) {
		this.inputSchool = inputSchool;
	}


	public String getInputPhone() {
		return inputPhone;
	}


	public void setInputPhone(String inputPhone) {
		this.inputPhone = inputPhone;
	}


	public String getInputStuID() {
		return inputStuID;
	}


	public void setInputStuID(String inputStuID) {
		this.inputStuID = inputStuID;
	}


	public String getInputPassword() {
		return inputPassword;
	}


	public void setInputPassword(String inputPassword) {
		this.inputPassword = inputPassword;
	}


	@Override
	public String toString() {
		return "FinishReg [inputEmail=" + inputEmail + ", inputName=" + inputName + ", inputPasswd=" + inputPassword
				+ ", inputRole=" + inputRole + ", inputSchool=" + inputSchool + ", inputStuID=" + inputStuID
				+ ", inputPhone=" + inputPhone + "]";
	}
}
