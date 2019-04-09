package com.company.spring.member;

import java.util.Date;


public class MemberVO {
	private String mid;
	private String mpw;
	private String mname;
	private String mmail;
	private int mgrade;
	private Date menter;
	private String checkPw;
	
	public String getCheckPw() {
		return checkPw;
	}

	public void setCheckPw(String checkPw) {
		this.checkPw = checkPw;
	}

	public boolean PwEqualCheckPw() {
		return mpw.equals(checkPw);
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
	public int getMgrade() {
		return mgrade;
	}
	public void setMgrade(int mgrade) {
		this.mgrade = mgrade;
	}
	public Date getMenter() {
		return menter;
	}
	public void setMenter(Date menter) {
		this.menter = menter;
	}

	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mmail=" + mmail + ", mgrade=" + mgrade
				+ ", menter=" + menter + ", checkPw=" + checkPw + "]";
	}
	
	
}
