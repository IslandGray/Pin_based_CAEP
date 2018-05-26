package com.wcp.project.account;

import com.wcp.DAO.LoadQuery;
import com.wcp.DAO.User;

public class EditAccount {
	private String inputEmail;
	private String oldPassword;
	private String newPassword;
	
	public String edit() {
		try {
			LoadQuery ld=new LoadQuery();
			User u=(User)(ld.queryRTN("User", "account", inputEmail, ""));
			if(!u.getPasswd().equals(oldPassword)) {
				return "FAILED";
			}else {
				u.setPasswd(newPassword);
				ld.savein(u);
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "FAILED";
		}
		return "SUCCESS";
	}

	public String getInputEmail() {
		return inputEmail;
	}

	public void setInputEmail(String inputEmail) {
		this.inputEmail = inputEmail;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
}
