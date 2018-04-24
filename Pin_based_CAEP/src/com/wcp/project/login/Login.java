package com.wcp.project.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Login {
	private String inputEmail;
	private String inputPassword;
	
	public String login() throws Exception{
	     System.out.println(inputEmail);
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
		      ResultSet rs = stmt.executeQuery("select * from user where Account='"+inputEmail+"' and Password='"+inputPassword+"'");
		      if(rs.next()){
		    	  System.out.print(inputEmail+" Login!");
		    	  return "SUCCESS";
		      }
	     }catch(Exception e) {
	    	 e.printStackTrace();
		      return "ERROR";
	     }
   	  	 System.out.print(inputEmail+" Login Failed");
	     return "ERROR";
	}

	public String getInputEmail() {
		return inputEmail;
	}

	public void setInputEmail(String inputEmail) {
		this.inputEmail = inputEmail;
	}

	public String getInputPassword() {
		return inputPassword;
	}

	public void setInputPassword(String inputPassword) {
		this.inputPassword = inputPassword;
	}
	
	
}
