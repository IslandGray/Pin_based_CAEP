package com.wcp.project.teacher.lab;

import com.wcp.DAO.LoadQuery;

public class EditExcute {
	private String acc;
	private String to;
	
	private String startT;
	private String endT;
	
	private String labnum;
	
	public String edit() throws Exception{
		try {
			LoadQuery loadQuery=new LoadQuery();
			String labTag=null;
			switch(labnum) {
			case "0":{
				labTag="X0";
				break;
			}
			case "1":{
				labTag="X1";
				break;
			}
			case "2":{
				labTag="X2";
				break;
			}
			case "3":{
				labTag="X3";
				break;
			}
			}
			loadQuery.update("update "+labTag+" x set x.excute='"+to+"' where account = '"+acc+"'");
			
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED"+labnum;
		}
		
		return "SUCCESS"+labnum;
	}
	public String editTime() throws Exception{
		System.out.println(startT);
		try {
			LoadQuery loadQuery=new LoadQuery();
			loadQuery.update("update Lab x set x.begin='"+startT+" 00:00:00', x.end='"+endT+" 00:00:00' where number = "+labnum);
			
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED"+labnum;
		}
		
		return "SUCCESS"+labnum;
	}
	public String editPDF() throws Exception{
		try {
			LoadQuery loadQuery=new LoadQuery();
			String labTag=null;
			switch(labnum) {
			case "0":{
				labTag="X0";
				break;
			}
			case "1":{
				labTag="X1";
				break;
			}
			case "2":{
				labTag="X2";
				break;
			}
			case "3":{
				labTag="X3";
				break;
			}
			}
			loadQuery.update("update "+labTag+" x set x.report='"+to+"' where account = '"+acc+"'");
			
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED"+labnum;
		}
		
		return "SUCCESS"+labnum;
	}

	public String getAcc() {
		return acc;
	}

	public void setAcc(String acc) {
		this.acc = acc;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}
	public String getStartT() {
		return startT;
	}
	public void setStartT(String startT) {
		this.startT = startT;
	}
	public String getEndT() {
		return endT;
	}
	public void setEndT(String endT) {
		this.endT = endT;
	}
	public String getLabnum() {
		return labnum;
	}
	public void setLabnum(String labnum) {
		this.labnum = labnum;
	}
	
	
}
