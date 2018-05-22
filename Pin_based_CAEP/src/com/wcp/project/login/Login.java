package com.wcp.project.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.Case;

import com.opensymphony.xwork2.ActionContext;   
import com.opensymphony.xwork2.ActionSupport;

public class Login  extends ActionSupport{
	private String inputEmail;
	private String inputPassword;
	
	
	public String login() 
			throws Exception{
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
	     Connection connect=null;
	     Statement stmt=null;
	     try {
	    	  connect = DriverManager.getConnection(
			          "jdbc:mysql://localhost:3306/pin_based_caep","root","wcp19970221");
		      System.out.println("Success connect Mysql server!");
		      stmt = connect.createStatement();
		      ResultSet rs = stmt.executeQuery("select * from user where Account='"+inputEmail+"' and Passwd='"+inputPassword+"'");
		      if(rs.next()){
		    	  String username=rs.getString("Name");
		    	  int id=rs.getInt("ID");
		    	  System.out.println(inputEmail+" Login! Welcome "+username);
		    	  
		    	  ActionContext actionContext = ActionContext.getContext();    	  
		          Map<String, Object> session = actionContext.getSession();   
		          session.put("USER", inputEmail);
		          session.put("username", username);
		          session.put("ID", id);
		          
		          String role=rs.getString("Role");
		          switch(role) {
		          case "student":
		          case "teacher":
		          case "TA":
		          case "admin":
		          case "SuperAdmin":{
		        	  session.put("role", role);
		        	  stmt.close();
		        	  connect.close();
		        	  return "SUCCESS";
		          }
		          }
		          
		      }
	     }catch(Exception e) {
	    	 e.printStackTrace();
	     }
   	  	 System.out.print(inputEmail+" Login Failed");
   	  	 stmt.close();
   	  	 connect.close();
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
