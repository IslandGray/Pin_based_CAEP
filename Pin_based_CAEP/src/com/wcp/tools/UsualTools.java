package com.wcp.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UsualTools {
	
	public List<String> getStringFrom(String str){
		List<String> list=new ArrayList<String>();  
        Pattern p = Pattern.compile("(\\[[^\\]]*\\])");  
        Matcher m = p.matcher(str); 
        while(m.find()){  
            list.add(m.group().substring(1, m.group().length()-1));  
        }
        return list;
	}
	
	public String excuteLinux(String cmd,String ADDR,String find) throws Exception {
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
}
