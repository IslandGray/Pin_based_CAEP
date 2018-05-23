package com.wcp.project.lab;
import com.wcp.DAO.Lab;
import com.wcp.DAO.LoadQuery;
import com.wcp.DAO.X1;
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

public class Lab1Upload extends ActionSupport{
	//输入输出jsp相关变量
	private File lab1file;
	private String lab1fileFileName;
	private String lab1fileContentType;
	
	private File lab1report;
	private String lab1reportFileName;
	private String lab1reportContentType;
	
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
		
		//检测时间
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
			newFile1=new File(file,"CacheModel.h");
			lab1file.renameTo(newFile1);
			System.out.println(newFile1.getPath()+" has saved.");
			
			File fileLAB=new File(addr+"/"+id);
			if(!file.exists()){
				file.mkdirs();
			}
			FileUtils.copyFile(new File(addr+"/lab1.cpp"), new File(file,id+"_lab1.cpp"));
			
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
			if((resultstr=excuteLinux("make TEST_TOOL_ROOTS="+id+"/"+id+"_lab1", addr ,"错误"))!=null) {
				System.out.println("Find Error: "+resultstr);
				resultstr1=resultstr;
			}else {//尝试运行
				resultstr=excuteLinux("../../../pin -t obj-intel64/"+id+"/"+id+"_lab1.so "
						+ "-o "+id+"/lab1.out -- "+testBin, addr ,"错误");
				if(resultstr!=null) {
					System.out.println("Find Error: "+resultstr);
					resultstr1=resultstr;
					//resultstr1=java.net.URLEncoder.encode(resultstr, "UTF-8");
				}else {
					resultstr1="Finish! ";
					ReadFile rd=new ReadFile();
					resultstr1=resultstr1+rd.getOUTline(addr+"/"+id+"/lab1.out");
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
						
			int lab1excute=0;
			if(resultstr1.contains("Finish")) {
				String[] liStrings=resultstr1.split(" ");
				for(String i:liStrings) {
					System.out.print(i+" ");	
				}
				/***********Grade***********/
				
		        UsualTools tools=new UsualTools();
		        String grade=tools.getStringFrom(liStrings[1]).get(0);
				lab1excute=Integer.parseInt(grade.substring(0, grade.length()-1));
				/************************/
			}
			
			List<Object> l=loadQuery.queryHQL("from X1 where account = '"+acc+"'");
			if(l.isEmpty()) {
				X1 x=new X1();
				x.setAccount(acc);
				x.setExcute(lab1excute);
				loadQuery.savein(x);
			}else {
				loadQuery.update("update X1 x set x.excute = "+lab1excute+" where account = '"+acc+"'");
			}
			//保存执行结果
			loadQuery.update("update Excute e set e.info = '"+resultstr1+"' where account = '"+acc+"' and number = '1'");
			
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		return "SUCCESS";
	}
	
	private String excuteLinux(String cmd,String ADDR,String find) throws Exception {
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
			File file = new File(addr+"/"+id );
			if(!file.exists()){
				file.mkdirs();
			}
			//拷贝：把文件的临时文件复制到指定的位置。注意：临时文件还在
			//FileUtils.copyFile(myfile, new File(file,myfileFileName));
			
			//剪切：把临时文件剪切指定的位置，并且给他重命名。 注意：临时文件没有了
			newPDF=new File(file,id+"_lab1.pdf");
			lab1report.renameTo(newPDF);
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
			Lab list=(Lab)loadQuery.queryRTN("Lab", "number", "1","");
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

	public File getLab1file() {
		return lab1file;
	}

	public void setLab1file(File lab1file) {
		this.lab1file = lab1file;
	}

	public String getLab1fileFileName() {
		return lab1fileFileName;
	}

	public void setLab1fileFileName(String lab1fileFileName) {
		this.lab1fileFileName = lab1fileFileName;
	}

	public String getLab1fileContentType() {
		return lab1fileContentType;
	}

	public void setLab1fileContentType(String lab1fileContentType) {
		this.lab1fileContentType = lab1fileContentType;
	}

	public File getLab1report() {
		return lab1report;
	}

	public void setLab1report(File lab1report) {
		this.lab1report = lab1report;
	}

	public String getLab1reportFileName() {
		return lab1reportFileName;
	}

	public void setLab1reportFileName(String lab1reportFileName) {
		this.lab1reportFileName = lab1reportFileName;
	}

	public String getLab1reportContentType() {
		return lab1reportContentType;
	}

	public void setLab1reportContentType(String lab1reportContentType) {
		this.lab1reportContentType = lab1reportContentType;
	}

	public String getResultstr1() {
		return resultstr1;
	}

	public void setResultstr1(String resultstr1) {
		this.resultstr1 = resultstr1;
	}

	
	
}
