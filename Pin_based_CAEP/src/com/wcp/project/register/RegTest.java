package com.wcp.project.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class RegTest {
	private String inputEmail;
	
	public String registerTest() throws Exception{
	     System.out.println(inputEmail);
	     if(inputEmail.isEmpty()) {
	    	 return "ERROR";
	     }
	     try {
		      Class.forName("com.mysql.jdbc.Driver");     //加载MYSQL JDBC驱动程序   
		     System.out.println("Success loading Mysql Driver!");
		    }
		    catch (Exception e) {
		      System.out.print("Error loading Mysql Driver!");
		      e.printStackTrace();
		      return "ERROR";
		    }
	     try {
	    	 Connection connect = DriverManager.getConnection(
			          "jdbc:mysql://localhost:3306/pin_based_caep","root","wcp19970221");
		      System.out.println("Success connect Mysql server!");
		      Statement stmt = connect.createStatement();
		      ResultSet rs = stmt.executeQuery("select * from user where Account='"+inputEmail+"'");
		      if(rs.next()){
		    	  System.out.print("Already Registed!");
		    	  return "REGISTED";
		      }
	     }catch(Exception e) {
	    	 e.printStackTrace();
		      return "ERROR";
	     }
	     return "SUCCESS";
	}

	public String getInputEmail() {
		return inputEmail;
	}

	public void setInputEmail(String inputEmail) {
		this.inputEmail = inputEmail;
	}
	
	
}
