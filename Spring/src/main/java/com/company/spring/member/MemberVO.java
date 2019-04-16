package com.company.spring.member;

import java.util.Date;


public class MemberVO {
	private int midx;
	private String mid;
	private String mpw;
	private String mname;
	private String mmail;
	private Date menter;
	private String mvalue;
	private String checkPw;
	
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
	public Date getMenter() {
		return menter;
	}
	public void setMenter(Date menter) {
		this.menter = menter;
	}
	public String getMvalue() {
		return mvalue;
	}
	public void setMvalue(String mvalue) {
		this.mvalue = mvalue;
	}
	public String getCheckPw() {
		return checkPw;
	}
	public void setCheckPw(String checkPw) {
		this.checkPw = checkPw;
	}
	
	@Override
	public String toString() {
		return "MemberVO [midx=" + midx + ", mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mmail=" + mmail
				+ ", menter=" + menter + ", mvalue=" + mvalue + ", checkPw=" + checkPw + "]";
	}
		
}
