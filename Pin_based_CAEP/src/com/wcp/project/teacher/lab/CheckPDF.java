package com.wcp.project.teacher.lab;

import java.io.File;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CheckPDF  extends ActionSupport{
	private String id;
	private String filename;
	
	private String findfile;
	
	final String addr="/usr/services/pin-3.5/source/tools/ManualExamples";
	
	public String check() throws Exception{
		try {				//读取session的登录信息
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        //id=String.valueOf( (int)session.get("ID") ); 
	        //acc=(String) session.get("USER");
		}catch(Exception e) {
			e.printStackTrace();
			return "NOLOGIN";
		}
		
		File pdFile=null;
		try {
			File file=new File(addr+"/"+id);
			if(!file.exists()){
				return "NOFILE";
			}
			File myPDF=new File(file, filename);
			if(!myPDF.exists()) {
				return "NOFILE";
			}
			findfile="/pinsrc/"+id+"/"+filename;
			System.out.println(findfile);
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		
		return "SUCCESS";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFindfile() {
		return findfile;
	}

	public void setFindfile(String findfile) {
		this.findfile = findfile;
	}
	
	
}
