package com.wcp.project.lab;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class GotoLab {
	
	public String gotolab() throws Exception {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        if(query!=null && query!="") {
	        	String role=(String)session.get("role");
	        	System.out.println("Go to "+query+"'s lab AS "+role);
	        	switch(role) {
	        	case "student":{
		        	  return "stuLOGGED";
		          }
		          case "teacher":{
		        	  return "teaLOGGED";
		          }
		          case "TA":{
		        	  return "taLOGGED";
		          }
		          case "admin":{
		        	  return "adLOGGED";
		          }
		          case "SuperAdmin":{
		        	  return "suLOGGED";
		          }
		          default:return "FAILED";
	        	}
	        }	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "FAILED";
	}
}
