package com.company.spring.member;

public class Register {
	
	private int midx;
	private String mid;
	private String mpw;
	private String checkPw;
	private String mname;
	private String mmail;
	
	public boolean PwEqualCheckPw() {
		return mpw.equals(checkPw);
	}
	
	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getCheckPw() {
		return checkPw;
	}
	public void setCheckPw(String checkPw) {
		this.checkPw = checkPw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMmail() {
		return mmail;
	}
	public void setMmail(String mmail) {
		this.mmail = mmail;
	}
	
	
}
