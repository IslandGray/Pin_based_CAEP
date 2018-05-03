package com.wcp.project.teacher.lab;
import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

import com.wcp.DAO.LoadQuery;

public class EditExcute {
	private String acc;
	private String to;
	
	private String startT;
	private String endT;
	
	public String edit() throws Exception{
		try {
			LoadQuery loadQuery=new LoadQuery();
			loadQuery.update("update X0 x set x.excute='"+to+"' where account = '"+acc+"'");
			
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		
		return "SUCCESS";
	}
	public String editTime() throws Exception{
		System.out.println(startT);
		try {
			LoadQuery loadQuery=new LoadQuery();
			loadQuery.update("update Lab x set x.begin='"+startT+" 00:00:00', x.end='"+endT+" 00:00:00' where number = 0");
			
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		
		return "SUCCESS";
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
	
	
}
