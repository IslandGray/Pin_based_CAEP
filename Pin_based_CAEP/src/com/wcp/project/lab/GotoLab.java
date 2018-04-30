package com.wcp.project.lab;
import com.wcp.DAO.Lab;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.opensymphony.xwork2.ActionContext;



public class GotoLab {
	private Date starttime;
	private Date endtime;
	
	public String gotolab() throws Exception {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        if(query!=null && query!="") {
	        	String role=(String)session.get("role");
	        	System.out.println("Go to "+query+"'s lab0 AS "+role);
	        	
	        	loadTime();		//加载开始、结束时间	
	        	
		        
	        	switch(role) {
	        	case "student":{
	        		loadStatus();
	        		loadResult();
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
	
	public void loadTime() throws Exception{
		try {
			Configuration config=new Configuration().configure();// Hibernate框架加载hibernate.cfg.xml文件
			SessionFactory sessionFactory=config.buildSessionFactory();
			Session session2=sessionFactory.openSession();// 相当于得到一个Connection
			// 开启事务
	        session2.beginTransaction();
	        Query query2 = session2.createQuery("from Lab where number = ?");
	        query2.setInteger(0, 0);
	        List<Lab> list=query2.list();
	        for(Lab lab:list) {
	        	starttime=lab.getBegin();
	        	endtime=lab.getEnd();
	        }
	        session2.getTransaction().commit();
	        session2.close();
	        sessionFactory.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void loadStatus() {
		
	}
	public void loadResult() {
		
	}

	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
	
}
