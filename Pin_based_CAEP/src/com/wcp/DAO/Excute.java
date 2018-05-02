package com.wcp.DAO;

public class Excute {
	private String account;
	private String number;
	private String info;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "Excute [account=" + account + ", number=" + number + ", info=" + info + "]";
	}
	
	
}
