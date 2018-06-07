package com.wcp.project.admin;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.wcp.DAO.Group;
import com.wcp.DAO.LoadQuery;
import com.wcp.DAO.User;

public class Admin {
	private String id;
	
	private String inputTea;
	private String inputGroup;
	
	public String admit() {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        String role=(String)session.get("role");
	        if(query!=null && query!="" && role!=null && (role.equals("admin")||role.equals("SuperAdmin")) ) {
	        	LoadQuery loadQuery=new LoadQuery();
	        	User t=(User)loadQuery.queryRTN("User", "ID", id, "");
	        	if(t.getGroup().equals("invalid")) {
	        		t.setGroup("teacher");
	        		loadQuery.savein(t);
	        	}
	        	return "SUCCESS";
	        }		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "FAILED";
	}
	public String refuse() {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        String role=(String)session.get("role");
	        if(query!=null && query!="" && role!=null && (role.equals("admin")||role.equals("SuperAdmin")) ) {
	        	LoadQuery loadQuery=new LoadQuery();
	        	User t=(User)loadQuery.queryRTN("User", "ID", id, "");
	        	if(t.getGroup().equals("invalid")) {
	        		loadQuery.delect(t);
	        	}
	        	return "SUCCESS";
	        }		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "FAILED";
	}
	public String add() {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        String role=(String)session.get("role");
	        if(query!=null && query!="" && role!=null && (role.equals("admin")||role.equals("SuperAdmin")) ) {
	        	LoadQuery loadQuery=new LoadQuery();
	        	/*
	        	List<Object> gList=loadQuery.query("Group", "account", inputTea);
	        	for(Object i:gList) {
	        		Group t=(Group)i;
	        		if(t.getGroup().equals(inputGroup)) {
	        			return "SUCCESS";
	        		}
	        	}
	        	*/
	        	Group nGroup=new Group();
	        	nGroup.setAccount(inputTea);
	        	nGroup.setGroup(inputGroup);
	        	loadQuery.savein(nGroup);
	        	return "SUCCESS";
	        }		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "FAILED";
	}
	public String del() {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        String role=(String)session.get("role");
	        if(query!=null && query!="" && role!=null && (role.equals("admin")||role.equals("SuperAdmin")) ) {
	        	LoadQuery loadQuery=new LoadQuery();
	        	
	        	List<Object> gList=loadQuery.query("Group", "account", inputTea);
	        	for(Object i:gList) {
	        		Group t=(Group)i;
	        		if(t.getGroup().equals(inputGroup)) {
	        			loadQuery.delect(t);
	        			return "SUCCESS";
	        		}
	        	}
	        	
	        }		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "FAILED";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getInputTea() {
		return inputTea;
	}
	public void setInputTea(String inputTea) {
		this.inputTea = inputTea;
	}
	public String getInputGroup() {
		return inputGroup;
	}
	public void setInputGroup(String inputGroup) {
		this.inputGroup = inputGroup;
	}
	
	
}
