package com.company.spring.product;

public class ProductVO {
	private int pidx;
	private String pname;
	private int pprice;
	private String pinfo;
	private String pimage;
	private String pthumbimg;
	
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPinfo() {
		return pinfo;
	}
	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	
	public String getPthumbimg() {
		return pthumbimg;
	}
	public void setPthumbimg(String pthumbimg) {
		this.pthumbimg = pthumbimg;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pidx=" + pidx + ", pname=" + pname + ", pprice=" + pprice + ", pinfo=" + pinfo + ", pimage="
				+ pimage + ", pthumbimg=" + pthumbimg + "]";
	}
	
	
}
