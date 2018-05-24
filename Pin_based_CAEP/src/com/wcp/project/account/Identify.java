package com.wcp.project.account;
import com.wcp.tools.*;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class Identify {
	
	public String set() {
		UsualTools usualTools=new UsualTools();
		return usualTools.Identify();
	}
	
}
