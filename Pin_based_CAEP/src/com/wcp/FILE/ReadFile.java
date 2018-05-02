package com.wcp.FILE;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ReadFile {
	
	public String getOUTline(String filename) throws Exception {
		List<String> list = new ArrayList<String>();
		try {
			File file=new File(filename);
			if (file.isFile() && file.exists()) {
				InputStreamReader read = new InputStreamReader(
	                    new FileInputStream(file), "UTF-8");// 考虑到编码格式
	            BufferedReader bufferedReader = new BufferedReader(read);
	            String lineTxt = null;
	            while ((lineTxt = bufferedReader.readLine()) != null) {
	            	list.add(lineTxt);
	            }
	            bufferedReader.close();
                read.close();
			}else {
				System.out.println("找不到指定的文件");
				return null;
			}
		}catch(Exception e) {
			System.out.println("读取文件出错");
			e.printStackTrace();
			return null;
		}
		return list.get(0);
	}
	public List<String> getOUTfile(String filename) throws Exception {
		List<String> list = new ArrayList<String>();
		try {
			File file=new File(filename);
			if (file.isFile() && file.exists()) {
				InputStreamReader read = new InputStreamReader(
	                    new FileInputStream(file), "UTF-8");// 考虑到编码格式
	            BufferedReader bufferedReader = new BufferedReader(read);
	            String lineTxt = null;
	            while ((lineTxt = bufferedReader.readLine()) != null) {
	            	list.add(lineTxt);
	            }
	            bufferedReader.close();
                read.close();
			}else {
				System.out.println("找不到指定的文件");
				return null;
			}
		}catch(Exception e) {
			System.out.println("读取文件出错");
			e.printStackTrace();
			return null;
		}
		return list;
	}

}
