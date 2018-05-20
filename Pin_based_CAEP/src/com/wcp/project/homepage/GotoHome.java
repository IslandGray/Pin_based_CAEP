package com.wcp.project.homepage;
import com.wcp.DAO.LoadQuery;
import com.wcp.DAO.Lab;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class GotoHome {
	private Date[] st=new Date[5];
	private Date[] et=new Date[5];
	
	public String gohome() throws Exception {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        if(query!=null && query!="") {
	        	String role=(String)session.get("role");
	        	System.out.println("Go to "+query+"'s home AS "+role);
	        	LoadQuery loadQuery=new LoadQuery();
	        	
	        	List<Object> ls=loadQuery.query("Lab");
        		Lab lab=null;
        		int i=0;
        		for(Object l:ls) {
        			lab=(Lab)l;
        			System.out.println(lab.toString());
        			st[i]=lab.getBegin();
        			et[i]=lab.getEnd();
        			i++;
        		}
        		
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

	public Date[] getSt() {
		return st;
	}

	public void setSt(Date[] st) {
		this.st = st;
	}

	public Date[] getEt() {
		return et;
	}

	public void setEt(Date[] et) {
		this.et = et;
	}
	
}
