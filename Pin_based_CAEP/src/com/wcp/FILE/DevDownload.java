package com.wcp.FILE;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class DevDownload extends ActionSupport{
	
	 // 文件的Mime类型  
    private String contentType; 
    // 文件的放置路径  
    private String filePath;  
    // 要下载的文件名称  
    private String fileName;  
    // 该属性设置与否都可以，但是比如提供get方法  
    private InputStream fileInputStream;  
          
    public InputStream getFileInputStream() {  
        System.out.println(filePath + "/" + fileName);

        // 以及文件的mime类型以及创建流  
        ServletContext context = ServletActionContext.getServletContext();  
        
        //String realpath=context.getRealPath(filePath + "/" + fileName);
        //System.out.println(realpath);
        
        String mimeType = context.getMimeType(filePath + "/" + fileName); 
        System.out.println(mimeType);
        setContentType(mimeType); 
           
        //return context.getResourceAsStream(filePath + "/" + fileName);  
        return new InputStream() {
			
			@Override
			public int read() throws IOException {
				// TODO Auto-generated method stub
				return 0;
			}
		};
    }

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	} 
    
}
