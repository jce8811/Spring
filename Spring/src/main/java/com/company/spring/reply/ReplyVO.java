package com.company.spring.reply;

import java.util.Date;

public class ReplyVO {
	private int ridx;
	private int bidx;
	private String rcontent;
	private String rwriter;
	private Date rdate;
	private String mid;
	private String rvalue;
	
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getRvalue() {
		return rvalue;
	}
	public void setRvalue(String rvalue) {
		this.rvalue = rvalue;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [ridx=" + ridx + ", bidx=" + bidx + ", rcontent=" + rcontent + ", rwriter=" + rwriter
				+ ", rdate=" + rdate + ", mid=" + mid + ", rvalue=" + rvalue + "]";
	}
}
