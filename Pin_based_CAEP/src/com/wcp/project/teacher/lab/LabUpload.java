package com.wcp.project.teacher.lab;

import java.io.File;

public class LabUpload {
	private File labguide;
	private String labguideFileName;
	private String labguideContentType;
	
	private String upPath;
	
	final String addr="/usr/services/tomcat-9/webapps/Pin_based_CAEP";
	
	public String upload0() throws Exception{
		File newPDF=null;
		try {
			File file=new File(addr);
			if(!file.exists()){
				file.mkdirs();
			}
			newPDF=new File(file,upPath);
			labguide.renameTo(newPDF);
			System.out.println(newPDF.getPath()+" has saved.");
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		return "SUCCESS";
	}

	public File getLabguide() {
		return labguide;
	}

	public void setLabguide(File labguide) {
		this.labguide = labguide;
	}

	public String getLabguideFileName() {
		return labguideFileName;
	}

	public void setLabguideFileName(String labguideFileName) {
		this.labguideFileName = labguideFileName;
	}

	public String getLabguideContentType() {
		return labguideContentType;
	}

	public void setLabguideContentType(String labguideContentType) {
		this.labguideContentType = labguideContentType;
	}

	public String getUpPath() {
		return upPath;
	}

	public void setUpPath(String upPath) {
		this.upPath = upPath;
	}

	
	
}
