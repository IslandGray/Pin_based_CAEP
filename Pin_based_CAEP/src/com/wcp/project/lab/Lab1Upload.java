package com.wcp.project.lab;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Lab1Upload extends ActionSupport{
	private File lab01file;
	private File lab02file;
	private String lab01fileFileName;
	private String lab02fileFileName;
	private String lab01fileContentType;
	private String lab02fileContentType;
	
	public String upload() throws Exception{
		String id;
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        //String user=(String)session.get("USER");
	        id=String.valueOf( (int)session.get("ID") ); 
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		try {
			//1.拿到ServletContext
			ServletContext servletContext = ServletActionContext.getServletContext();
			//2.调用realPath方法，获取根据一个虚拟目录得到的真实目录	
			String realPath = servletContext.getRealPath("/WEB-INF/UserFiles/cpp"+"/"+id);
			//3.如果这个真实的目录不存在，需要创建
			//File file = new File(realPath );
			File file = new File("D:\\others\\"+id );
			if(!file.exists()){
				file.mkdirs();
			}
			//4.把文件存过去
			//拷贝：把文件的临时文件复制到指定的位置。注意：临时文件还在
			//FileUtils.copyFile(myfile, new File(file,myfileFileName));
			
			//剪切：把临时文件剪切指定的位置，并且给他重命名。 注意：临时文件没有了
			File newFile=new File(file,id+"_CacheModel.h");
			lab01file.renameTo(newFile);
			lab02file.renameTo(new File(file,id+"_testCache.cpp"));
			
			System.out.println(newFile.getPath());

			return "SUCCESS";
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "FAILED";
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
