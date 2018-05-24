package com.wcp.project.account;

import javax.websocket.Session;

import com.wcp.DAO.LoadQuery;
import com.wcp.DAO.User;
import com.wcp.tools.UsualTools;

public class EditProfile {
	private String inputEmail;
	private String inputName;
	private String inputRole;
	private String inputSchool;
	private String inputStuID;
	private String inputPhone;
	
	public String edit() {
		try {
			User newU=new User();
			UsualTools uTools=new UsualTools();
			newU.setAccount(inputEmail);
			newU.setName(inputName);
			newU.setRole(uTools.exchangeRole(inputRole));
			newU.setSchool(uTools.exchangeSchool(inputSchool));
			newU.setStudentID(inputStuID);
			newU.setGroup(inputPhone);
			LoadQuery loadQuery=new LoadQuery();
			User old=(User)loadQuery.queryRTN("User", "account", inputEmail,"");
			newU.setID(old.getID());
			newU.setPasswd(old.getPasswd());
			loadQuery.savein(newU);
		}catch (Exception e) {
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

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public String getInputRole() {
		return inputRole;
	}

	public void setInputRole(String inputRole) {
		this.inputRole = inputRole;
	}

	public String getInputSchool() {
		return inputSchool;
	}

	public void setInputSchool(String inputSchool) {
		this.inputSchool = inputSchool;
	}

	public String getInputStuID() {
		return inputStuID;
	}

	public void setInputStuID(String inputStuID) {
		this.inputStuID = inputStuID;
	}

	public String getInputPhone() {
		return inputPhone;
	}

	public void setInputPhone(String inputPhone) {
		this.inputPhone = inputPhone;
	}
	
}
