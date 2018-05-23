package com.wcp.project.lab;
import com.wcp.DAO.Lab;
import com.wcp.DAO.LoadQuery;
import com.wcp.DAO.X2;
import com.wcp.FILE.*;
import com.wcp.tools.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.*;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Lab2Upload extends ActionSupport{
	//输入输出jsp相关变量
	private File lab2file;
	private String lab2fileFileName;
	private String lab2fileContentType;
	
	private File lab2report;
	private String lab2reportFileName;
	private String lab2reportContentType;
	
	private String resultstr1;
	//类内变量
	final String addr="/usr/services/pin-3.5/source/tools/ManualExamples";
	final String testBin="/home/wcp/Documents/testCache";
	String id;
	String acc;
	
	public String upload() throws Exception{
		//String id;
		//String acc;
		File newFile1 = null;
		try {				//读取session的登录信息
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        //String user=(String)session.get("USER");
	        id=String.valueOf( (int)session.get("ID") ); 
	        acc=(String) session.get("USER");
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		
		//添加时间检测逻辑！！！！！！
		int checktime=testTime();
		if(checktime==1) {
			return "FAILED";
		}
		
		try {				//保存文件到指定路径
			File file = new File(addr+"/"+id );
			if(!file.exists()){
				file.mkdirs();
			}
			
			//剪切：把临时文件剪切指定的位置，并且给他重命名。 注意：临时文件没有了
			newFile1=new File(file,"BranchPredictor.h");
			lab2file.renameTo(newFile1);
			System.out.println(newFile1.getPath()+" has saved.");
			
			File fileLAB=new File(addr+"/"+id);
			if(!file.exists()){
				file.mkdirs();
			}
			FileUtils.copyFile(new File(addr+"/lab2.cpp"), new File(file,id+"_lab2.cpp"));
			
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		try {
			//建立输出路径
			File file = new File(addr+"/obj-intel64/"+id );
			String resultstr = null;

			if(!file.exists()){
				file.mkdirs();
			}
			//尝试make
			UsualTools tool=new UsualTools();
			if((resultstr=tool.excuteLinux("make TEST_TOOL_ROOTS="+id+"/"+id+"_lab2", addr ,"错误"))!=null) {
				System.out.println("Find Error: "+resultstr);
				resultstr1=resultstr;
			}else {//尝试运行
				resultstr=tool.excuteLinux("../../../pin -t obj-intel64/"+id+"/"+id+"_lab2.so "
						+ "-o "+id+"/lab2.out -- "+testBin, addr ,"错误");
				if(resultstr!=null) {
					System.out.println("Find Error: "+resultstr);
					resultstr1=resultstr;
					//resultstr1=java.net.URLEncoder.encode(resultstr, "UTF-8");
				}else {
					resultstr1="Finish! ";
					ReadFile rd=new ReadFile();
					resultstr1=resultstr1+rd.getOUTline(addr+"/"+id+"/lab2.out");
					System.out.println(resultstr1);
				}
			}
						
			//pro.destroy();
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		try {
			LoadQuery loadQuery=new LoadQuery();
						
			int lab2excute=0;
			if(resultstr1.contains("Finish")) {
				String[] liStrings=resultstr1.split(" ");
				for(String i:liStrings) {
					System.out.print(i+" ");	
				}
				/***********Grade***********/
				
		        UsualTools tools=new UsualTools();
		        String grade=tools.getStringFrom(liStrings[1]).get(0);
				lab2excute=Integer.parseInt(grade.substring(0, grade.length()-1));
				/************************/
			}
			
			List<Object> l=loadQuery.queryHQL("from X2 where account = '"+acc+"'");
			if(l.isEmpty()) {
				X2 x=new X2();
				x.setAccount(acc);
				x.setExcute(lab2excute);
				loadQuery.savein(x);
			}else {
				loadQuery.update("update X2 x set x.excute = "+lab2excute+" where account = '"+acc+"'");
			}
			//保存执行结果
			loadQuery.update("update Excute e set e.info = '"+resultstr1+"' where account = '"+acc+"' and number = '2'");
			
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		return "SUCCESS";
	}
		
	public String uploadPDF() {
		try {				//读取session的登录信息
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        //String user=(String)session.get("USER");
	        id=String.valueOf( (int)session.get("ID") ); 
	        acc=(String) session.get("USER");
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		//添加时间检测逻辑！！！！！！
		int checktime=testTime();
		if(checktime==1) {
			return "FAILED";
		}
		File newPDF=null;
		try {				//保存文件到指定路径
			//如果这个真实的目录不存在，需要创建
			File file = new File(addr+"/"+id );
			if(!file.exists()){
				file.mkdirs();
			}
			//拷贝：把文件的临时文件复制到指定的位置。注意：临时文件还在
			//FileUtils.copyFile(myfile, new File(file,myfileFileName));
			
			//剪切：把临时文件剪切指定的位置，并且给他重命名。 注意：临时文件没有了
			newPDF=new File(file,id+"_lab2.pdf");
			lab2report.renameTo(newPDF);
			System.out.println(newPDF.getPath()+" has saved.");
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		return "SUCCESS";
	}
	
	public int testTime(){
		try {
			LoadQuery loadQuery=new LoadQuery();
			Lab list=(Lab)loadQuery.queryRTN("Lab", "number", "2","");
			if(list!=null) {
				Date sDate=list.getBegin();
				Date eDate=list.getEnd();
				Date now=new Date();
				if(now.before(sDate) || now.after(eDate)) {
					System.out.println(now.toString()+"["+sDate.toString()+"-"+eDate.toString()+"]");
					return 1;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public File getLab2file() {
		return lab2file;
	}

	public void setLab2file(File lab2file) {
		this.lab2file = lab2file;
	}

	public String getLab2fileFileName() {
		return lab2fileFileName;
	}

	public void setLab2fileFileName(String lab2fileFileName) {
		this.lab2fileFileName = lab2fileFileName;
	}

	public String getLab2fileContentType() {
		return lab2fileContentType;
	}

	public void setLab2fileContentType(String lab2fileContentType) {
		this.lab2fileContentType = lab2fileContentType;
	}

	public File getLab2report() {
		return lab2report;
	}

	public void setLab2report(File lab2report) {
		this.lab2report = lab2report;
	}

	public String getLab2reportFileName() {
		return lab2reportFileName;
	}

	public void setLab2reportFileName(String lab2reportFileName) {
		this.lab2reportFileName = lab2reportFileName;
	}

	public String getLab2reportContentType() {
		return lab2reportContentType;
	}

	public void setLab2reportContentType(String lab2reportContentType) {
		this.lab2reportContentType = lab2reportContentType;
	}

	public String getResultstr1() {
		return resultstr1;
	}

	public void setResultstr1(String resultstr1) {
		this.resultstr1 = resultstr1;
	}

	

	
	
}
