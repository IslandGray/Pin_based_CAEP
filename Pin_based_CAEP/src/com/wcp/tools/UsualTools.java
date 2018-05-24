package com.wcp.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionContext;

public class UsualTools {
	
	public List<String> getStringFrom(String str){
		List<String> list=new ArrayList<String>();  
        Pattern p = Pattern.compile("(\\[[^\\]]*\\])");  
        Matcher m = p.matcher(str); 
        while(m.find()){  
            list.add(m.group().substring(1, m.group().length()-1));  
        }
        return list;
	}
	
	public String excuteLinux(String cmd,String ADDR,String find) throws Exception {
		String line=null;
		String resultstr=null;
		try {
			Process pro=Runtime.getRuntime().exec(cmd, null, new File(ADDR));
			InputStream ret=pro.getErrorStream();
			BufferedReader br=new BufferedReader(new InputStreamReader(ret, "UTF-8"));
			while((line=br.readLine())!=null) {
				System.out.println(line);
				if(line.contains(find)) {
					resultstr=line;
					break;
				}
			}
			
			pro.waitFor();
			pro.destroy();
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return resultstr;
	}
	
	public String excuteLinuxReverse(String cmd,String ADDR,String find) throws Exception {
		String line=null;
		String resultstr=null;
		try {
			Process pro=Runtime.getRuntime().exec(cmd, null, new File(ADDR));
			InputStream ret=pro.getInputStream();
			BufferedReader br=new BufferedReader(new InputStreamReader(ret, "UTF-8"));
			while((line=br.readLine())!=null) {
				System.out.println(line);
				resultstr=line;
				if(line.contains(find)) {
					resultstr=null;
					break;
				}
			}
			
			pro.waitFor();
			pro.destroy();
		}catch(Exception e) {
			e.printStackTrace();
			return "Error";
		}
		return resultstr;
	}
	public String excuteLinuxOutLog(String cmd,String ADDR,String find) throws Exception {
		String line=null;
		String resultstr=null;
		try {
			Process pro=Runtime.getRuntime().exec(cmd, null, new File(ADDR));
			InputStream ret=pro.getInputStream();
			BufferedReader br=new BufferedReader(new InputStreamReader(ret, "UTF-8"));
			while((line=br.readLine())!=null) {
				System.out.println(line);
				if(line.contains(find)) {
					resultstr=line;
					break;
				}
			}
			
			pro.waitFor();
			pro.destroy();
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return resultstr;
	}
	public String Identify() {
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        if(query!=null && query!="") {
	        	String role=(String)session.get("role");
	        	System.out.println("Go to "+query+"'s pages AS "+role);
	            
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
	public String exchangeSchool(String inputSchool) {
		switch(inputSchool) {
		case "0":{
			return "哈尔滨工业大学";
		}
		case "65535":{
			return "Others";
		}
		default:return "Free";
		}
	}
	public String exchangeRole(String inputRole) {
		switch(inputRole) {
		case "0":{
			return "student";
		}
		case "1":{
			return "teacher";
		}
		case "2":{
			return "ta";
		}
		default:return "student";
		}
	}
}
