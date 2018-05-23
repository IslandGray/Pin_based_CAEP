package com.wcp.project.teacher.lab;

import com.wcp.DAO.Dup_Check;
import com.wcp.DAO.LoadQuery;

import java.io.File;
import java.util.Collection;
import java.util.Date;
import java.net.URL;

import org.apache.commons.io.FileUtils;

import it.zielke.moji.SocketClient;

public class CheckDup {
	private String resultURL;
	
	final private String addr="/usr/services/pin-3.5/source/tools/ManualExamples";
	
	public String check() throws Exception{
		try {
			// a list of students' source code files located in the prepared
			// directory.
			Collection<File> files = FileUtils.listFiles(new File(addr), new String[] { "cpp" }, true);
	
			// a list of base files that was given to the students for this
			// assignment.
			//Collection<File> baseFiles = FileUtils.listFiles(new File("/usr/services/tomcat-9/webapps/Pin_based_CAEP/WEB-INF/ServerFiles/0"), new String[] { "cpp" }, true);
			
			//get a new socket client to communicate with the Moss server
			//and set its parameters.
			SocketClient socketClient = new SocketClient();
			
			//set your Moss user ID
			socketClient.setUserID("820178322");
			//socketClient.setOpt...
			
			//set the programming language of all student source codes
			socketClient.setLanguage("c");
			
			//initialize connection and send parameters
			socketClient.run();
			/*
			// upload all base files
			for (File f : baseFiles) {
				socketClient.uploadBaseFile(f);
			}
			*/
			//upload all source files of students
			for (File f : files) {
				socketClient.uploadFile(f);
			}
			System.out.println("update files");
			//finished uploading, tell server to check files
			socketClient.sendQuery();
			System.out.println("send query");
			//get URL with Moss results and do something with it
			URL results = socketClient.getResultURL();
			resultURL=results.toString();
			System.out.println("Results available at " + resultURL);
			
			Dup_Check dup_Check=new Dup_Check();
			dup_Check.setTag("1");
			dup_Check.setTime(new Date());
			dup_Check.setSrc(resultURL);
			LoadQuery loadQuery=new LoadQuery();
			loadQuery.savein(dup_Check);
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		return "SUCCESS";
	}

}
