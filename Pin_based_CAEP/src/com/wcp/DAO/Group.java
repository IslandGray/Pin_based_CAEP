package com.wcp.DAO;

import java.io.Serializable;

public class Group implements Serializable{
	private String account;
	private String group;
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	@Override
	public String toString() {
		return "Group [account=" + account + ", group=" + group + "]";
	}
	
}
