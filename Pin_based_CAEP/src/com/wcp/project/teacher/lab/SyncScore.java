package com.wcp.project.teacher.lab;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.wcp.DAO.*;

public class SyncScore {

	public String sync() {
		LoadQuery loadQuery=new LoadQuery();
		List<String> group=new ArrayList();
		try {
			ActionContext actionContext = ActionContext.getContext();    	  
	        Map<String, Object> session = actionContext.getSession();   
	        String query=(String)session.get("USER");
	        User teacher=(User)(loadQuery.queryRTN("User", "account", query,""));
	        List<Object> gList=loadQuery.query("Group", "account", teacher.getAccount());
	        for(Object i:gList) {
	        	group.add(((Group)i).getGroup());
	        }
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		try {
			for(String i:group) {
				List<Object> allUser=loadQuery.query("User","Role","student","Group",i);
				for(Object j:allUser) {
					User stu=(User)j;
					String acc=stu.getAccount();
					X0 x0=(X0)(loadQuery.queryRTN("X0", "account", acc, ""));
					float x0total=0;
					if(x0==null) {
						//x0total=0;
						x0=new X0();
						x0.setAccount(acc);
					}else {
						x0total=(float) (0.7*x0.getExcute()+0.3*x0.getReport()+1.0*x0.getAnother());
					}
					x0.setScore(x0total);
					loadQuery.savein(x0);
					
					X1 x1=(X1)(loadQuery.queryRTN("X1", "account", acc, ""));
					float x1total=0;
					if(x1!=null)
						x1total=(float) (0.7*x1.getExcute()+0.3*x1.getReport()+1.0*x1.getAnother());
					else {
						x1=new X1();
						x1.setAccount(acc);
					}
					x1.setScore(x1total);
					loadQuery.savein(x1);
					
					X2 x2=(X2)(loadQuery.queryRTN("X2", "account", acc, ""));
					float x2total=0;
					if(x2!=null)
						x2total=(float) (0.7*x2.getExcute()+0.3*x2.getReport()+1.0*x2.getAnother());
					else {
						x2=new X2();
						x2.setAccount(acc);
					}
					x2.setScore(x2total);
					loadQuery.savein(x2);
					
					X3 x3=(X3)(loadQuery.queryRTN("X3", "account", acc, ""));
					float x3total=0;
					if(x3!=null)
						x3total=(float) (0.7*x3.getExcute()+0.3*x3.getReport()+1.0*x3.getAnother());
					else {
						x3=new X3();
						x3.setAccount(acc);
					}
					x3.setScore(x3total);
					x3.setAccount(acc);
					loadQuery.savein(x3);
					
					Score score=(Score)(loadQuery.queryRTN("Score", "account", acc, ""));
					if(score!=null) {
						
					}else {
						score=new Score();
						score.setAccount(acc);
					}
					float another=score.getAnother();
					score.setLab0(x0total);
					score.setLab1(x1total);
					score.setLab2(x2total);
					score.setLab3(x3total);
					score.setLab4(0);
					score.setAnother(another);
					float total=(float)((x0total+x1total+x2total+x3total+another)*0.05);
					if(total==score.getTotal() && total!=0.0) {
						continue;
					}else {
						score.setTotal(total);
					}
					loadQuery.savein(score);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		return "SUCCESS";
	}
}
