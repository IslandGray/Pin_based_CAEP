package com.wcp.project.lab;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wcp.DAO.Excute;
import com.wcp.DAO.Lab;
import com.wcp.DAO.LoadQuery;
import com.wcp.DAO.X3;
import com.wcp.tools.UsualTools;

public class Lab3Upload extends ActionSupport{
	//输入输出jsp相关变量
	private File lab3file;
	private String lab3fileFileName;
	private String lab3fileContentType;
	
	private File lab3report;
	private String lab3reportFileName;
	private String lab3reportContentType;
	
	private String resultstr1;
	//类内变量
	final String addr="/usr/services/cmurphi5.4/src";
	final String pdfaddr="/usr/services/pin-3.5/source/tools/ManualExamples";
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
		
		//时间检测
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
			newFile1=new File(file,"lab3.m");
			lab3file.renameTo(newFile1);
			System.out.println(newFile1.getPath()+" has saved.");
			/*
			File fileLAB=new File(addr+"/"+id);
			if(!file.exists()){
				file.mkdirs();
			}
			FileUtils.copyFile(new File(addr+"/lab3.cpp"), new File(file,id+"_lab3.cpp"));
			*/
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		try {
			//建立输出路径
			String resultstr = null;
			/*
			File file = new File(addr+"/obj-intel64/"+id );
			

			if(!file.exists()){
				file.mkdirs();
			}*/
			//尝试make
			UsualTools tool=new UsualTools();
			if((resultstr=tool.excuteLinuxReverse("../mu lab3.m", addr+"/"+id ,"Code generated in file"))!=null) {
				//resultstr="Find Error: 无法通过.m文件生成.cpp，检查文件内容或语法 ";
				System.out.println(resultstr);
				resultstr1=resultstr;
			}else {//尝试运行
				if((resultstr=tool.excuteLinuxOutLog("g++ -ggdb -o lab3.o lab3.cpp -I ../../include -lm", addr+"/"+id ,"错误"))!=null) {
					System.out.println("Find Error: "+resultstr);
					resultstr1=resultstr;
				}else {
				
					resultstr=tool.excuteLinuxOutLog("./lab3.o", addr+"/"+id ,"No error found");
					if(resultstr!=null) {
						resultstr="Finish! No error found [100]";
						System.out.println(resultstr);
						resultstr1=resultstr;
						//resultstr1=java.net.URLEncoder.encode(resultstr, "UTF-8");
					}else {
						resultstr1="Find Error: "+resultstr;
						//ReadFile rd=new ReadFile();
						//resultstr1=resultstr1+rd.getOUTline(addr+"/"+id+"/lab3.out");
						System.out.println(resultstr1);
					}
				}
			}
						
			//pro.destroy();
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		try {
			LoadQuery loadQuery=new LoadQuery();
						
			int lab3excute=0;
			if(resultstr1.contains("Finish")) {
				String[] liStrings=resultstr1.split(" ");
				for(String i:liStrings) {
					System.out.print(i+" ");	
				}
				/***********Grade***********/
				/*
		        UsualTools tools=new UsualTools();
		        String grade=tools.getStringFrom(liStrings[1]).get(0);
				lab3excute=Integer.parseInt(grade.substring(0, grade.length()-1));
				*/
				lab3excute=100;
				/************************/
			}
			
			List<Object> l=loadQuery.queryHQL("from X3 where account = '"+acc+"'");
			if(l.isEmpty()) {
				X3 x=new X3();
				x.setAccount(acc);
				x.setExcute(lab3excute);
				loadQuery.savein(x);
			}else {
				loadQuery.update("update X3 x set x.excute = "+lab3excute+" where account = '"+acc+"'");
			}
			//保存执行结果
			loadQuery.update("update Excute e set e.info = '"+resultstr1+"' where account = '"+acc+"' and number = '3'");
			
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
		//时间检测
		int checktime=testTime();
		if(checktime==1) {
			return "FAILED";
		}
		
		File newPDF=null;
		try {				//保存文件到指定路径
			//如果这个真实的目录不存在，需要创建
			File file = new File(pdfaddr+"/"+id );
			if(!file.exists()){
				file.mkdirs();
			}
			//拷贝：把文件的临时文件复制到指定的位置。注意：临时文件还在
			//FileUtils.copyFile(myfile, new File(file,myfileFileName));
			
			//剪切：把临时文件剪切指定的位置，并且给他重命名。 注意：临时文件没有了
			newPDF=new File(file,id+"_lab3.pdf");
			lab3report.renameTo(newPDF);
			System.out.println(newPDF.getPath()+" has saved.");

			LoadQuery ld=new LoadQuery();
			Excute excute=new Excute();
			excute.setAccount(acc);
			excute.setNumber("lab3");
			excute.setInfo("true");
			ld.savein(excute);
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		return "SUCCESS";
	}
	
	public int testTime(){
		try {
			LoadQuery loadQuery=new LoadQuery();
			Lab list=(Lab)loadQuery.queryRTN("Lab", "number", "3","");
			if(list!=null) {
				Date sDate=list.getBegin();
				Date eDate=list.getEnd();
				Date now=new Date();
				if(now.before(sDate) || now.after(eDate)) {
					return 1;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public File getLab3file() {
		return lab3file;
	}

	public void setLab3file(File lab3file) {
		this.lab3file = lab3file;
	}

	public String getLab3fileFileName() {
		return lab3fileFileName;
	}

	public void setLab3fileFileName(String lab3fileFileName) {
		this.lab3fileFileName = lab3fileFileName;
	}

	public String getLab3fileContentType() {
		return lab3fileContentType;
	}

	public void setLab3fileContentType(String lab3fileContentType) {
		this.lab3fileContentType = lab3fileContentType;
	}

	public File getLab3report() {
		return lab3report;
	}

	public void setLab3report(File lab3report) {
		this.lab3report = lab3report;
	}

	public String getLab3reportFileName() {
		return lab3reportFileName;
	}

	public void setLab3reportFileName(String lab3reportFileName) {
		this.lab3reportFileName = lab3reportFileName;
	}

	public String getLab3reportContentType() {
		return lab3reportContentType;
	}

	public void setLab3reportContentType(String lab3reportContentType) {
		this.lab3reportContentType = lab3reportContentType;
	}

	public String getResultstr1() {
		return resultstr1;
	}

	public void setResultstr1(String resultstr1) {
		this.resultstr1 = resultstr1;
	}
	
	
}
