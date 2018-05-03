package com.wcp.project.lab;
import com.wcp.DAO.Lab;
import com.wcp.DAO.Excute;
import com.wcp.DAO.LoadQuery;

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
	private String result1;
	private String result2;
	private String status;
	private String reportstatus;
	
	public String useracc=null;
	
	public String gotolab() throws Exception {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        useracc=query;
	        if(query!=null && query!="") {
	        	String role=(String)session.get("role");
	        	System.out.println("Go to "+query+"'s lab0 AS "+role);
	        	
	        	loadTime();		//加载开始、结束时间	
	        	
	        	switch(role) {
	        	case "student":{
	        		loadResult();
	        		loadStatus();
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
	public void loadStatus() throws Exception{
		if(result1=="No File" && result2=="No File") {
			status="未启动";
		}else if(result1.substring(0, 6).equals("Finish") && result2.substring(0, 6).equals("Finish")) {
			status="执行完毕";
		}else {
			status="出错";
		}
		/*
		try {
			LoadQuery lQuery=new LoadQuery();
			lQuery.queryHQL("")
		}catch(Exception e) {
			e.printStackTrace();
		}
		*/
	}
	public void loadResult() throws Exception{
		LoadQuery loadQuery=new LoadQuery();
		try {
			List<Object> list=loadQuery.query("Excute", "account", useracc, "number", "0-1");
			if(list.isEmpty()) {
				result1="No File";
				Excute excute=new Excute();
				excute.setAccount(useracc);
				excute.setNumber("0-1");
				excute.setInfo(result1);
				loadQuery.savein(excute);
			}
			else {
				Excute excute=(Excute) list.get(0);
				result1=excute.getInfo();
			}
			
			list=loadQuery.query("Excute", "account", useracc, "number", "0-2");
			if(list.isEmpty()) {
				result2="No File";
				Excute excute=new Excute();
				excute.setAccount(useracc);
				excute.setNumber("0-2");
				excute.setInfo(result2);
				loadQuery.savein(excute);
			}
			else {
				Excute excute=(Excute) list.get(0);
				result2=excute.getInfo();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
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

	public String getResult1() {
		return result1;
	}

	public void setResult1(String result1) {
		this.result1 = result1;
	}

	public String getResult2() {
		return result2;
	}

	public void setResult2(String result2) {
		this.result2 = result2;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReportstatus() {
		return reportstatus;
	}

	public void setReportstatus(String reportstatus) {
		this.reportstatus = reportstatus;
	}
	
	
}
