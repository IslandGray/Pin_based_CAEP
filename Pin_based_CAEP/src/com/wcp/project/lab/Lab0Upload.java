package com.wcp.project.lab;
import com.wcp.DAO.LoadQuery;
import com.wcp.FILE.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Lab0Upload extends ActionSupport{
	//输入输出jsp相关变量
	private File lab01file;
	private File lab02file;
	private String lab01fileFileName;
	private String lab02fileFileName;
	private String lab01fileContentType;
	private String lab02fileContentType;
	
	private String resultstr1;
	private String resultstr2;
	//类内变量
	final String addr="/usr/services/pin-3.5/source/tools/ManualExamples";
	String id;
	
	public String upload0() throws Exception{
		//String id;
		String acc;
		File newFile1 = null;
		File newFile2=null;
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
		try {				//保存文件到指定路径
			//1.拿到ServletContext
			//ServletContext servletContext = ServletActionContext.getServletContext();
			//2.调用realPath方法，获取根据一个虚拟目录得到的真实目录	
			//String realPath = servletContext.getRealPath("/WEB-INF/UserFiles/cpp"+"/"+id);
			//3.如果这个真实的目录不存在，需要创建
			//File file = new File(realPath );
			File file = new File(addr+"/"+id );
			if(!file.exists()){
				file.mkdirs();
			}
			//4.把文件存过去
			//拷贝：把文件的临时文件复制到指定的位置。注意：临时文件还在
			//FileUtils.copyFile(myfile, new File(file,myfileFileName));
			
			//剪切：把临时文件剪切指定的位置，并且给他重命名。 注意：临时文件没有了
			newFile1=new File(file,id+"_lab0-1.cpp");
			newFile2=new File(file,id+"_lab0-2.cpp");
			lab01file.renameTo(newFile1);
			lab02file.renameTo(newFile2);
			
			System.out.println(newFile1.getPath()+" has saved.");
			
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
			if((resultstr=excuteLinux("make TEST_TOOL_ROOTS="+id+"/"+id+"_lab0-1", addr ,"错误"))!=null) {
				System.out.println("Find Error: "+resultstr);
				resultstr1=resultstr;
				//resultstr1=java.net.URLEncoder.encode(resultstr, "UTF-8");
			}else {//尝试运行
				resultstr=excuteLinux("../../../pin -t obj-intel64/"+id+"/"+id+"_lab0-1.so "
						+ "-o "+id+"/lab0-1.out -- /home/wcp/Documents/testCache", addr ,"错误");
				if(resultstr!=null) {
					System.out.println("Find Error: "+resultstr);
					resultstr1=resultstr;
					//resultstr1=java.net.URLEncoder.encode(resultstr, "UTF-8");
				}else {
					resultstr1="Finish!		";
					ReadFile rd=new ReadFile();
					resultstr1=resultstr1+rd.getOUTline(addr+"/"+id+"/lab0-1.out");
					System.out.println(resultstr1);
				}
			}
			//make
			resultstr=excuteLinux("make TEST_TOOL_ROOTS="+id+"/"+id+"_lab0-2", addr ,"错误");
			if(resultstr!=null) {
				System.out.println("Find Error: "+resultstr);
				resultstr2=resultstr;
				//resultstr2=java.net.URLEncoder.encode(resultstr, "UTF-8");
			}else {//运行
				resultstr=excuteLinux("../../../pin -t obj-intel64/"+id+"/"+id+"_lab0-2.so "
						+ "-o "+id+"/lab0-2.out -- /home/wcp/Documents/testCache", addr ,"错误");
				if(resultstr!=null) {
					System.out.println("Find Error: "+resultstr);
					resultstr2=resultstr;
					//resultstr2=java.net.URLEncoder.encode(resultstr, "UTF-8");
				}else {
					resultstr2="Finish!		";
					ReadFile rd=new ReadFile();
					resultstr2=resultstr2+rd.getOUTline(addr+"/"+id+"/lab0-2.out");
					System.out.println(resultstr2);
				}
			}
						
			//pro.destroy();
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		try {				//输出信息存储到数据库
			LoadQuery loadQuery=new LoadQuery();
			loadQuery.update("update Excute e set e.info = '"+resultstr1+"' where account = '"+acc+"' and number = '0-1'");
			loadQuery.update("update Excute e set e.info = '"+resultstr2+"' where account = '"+acc+"' and number = '0-2'");
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
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return resultstr;
	}

	public File getLab01file() {
		return lab01file;
	}

	public void setLab01file(File lab01file) {
		this.lab01file = lab01file;
	}

	public File getLab02file() {
		return lab02file;
	}

	public void setLab02file(File lab02file) {
		this.lab02file = lab02file;
	}

	public String getLab01fileFileName() {
		return lab01fileFileName;
	}

	public void setLab01fileFileName(String lab01fileFileName) {
		this.lab01fileFileName = lab01fileFileName;
	}

	public String getLab02fileFileName() {
		return lab02fileFileName;
	}

	public void setLab02fileFileName(String lab02fileFileName) {
		this.lab02fileFileName = lab02fileFileName;
	}

	public String getLab01fileContentType() {
		return lab01fileContentType;
	}

	public void setLab01fileContentType(String lab01fileContentType) {
		this.lab01fileContentType = lab01fileContentType;
	}

	public String getLab02fileContentType() {
		return lab02fileContentType;
	}

	public void setLab02fileContentType(String lab02fileContentType) {
		this.lab02fileContentType = lab02fileContentType;
	}
	
}
