package com.company.spring.product;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int pidx;
	private String pname;
	private int pprice;
	private String pinfo;
	private MultipartFile pimage;
	
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
	public MultipartFile getPimage() {
		return pimage;
	}
	public void setPimage(MultipartFile pimage) {
		this.pimage = pimage;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pidx=" + pidx + ", pname=" + pname + ", pprice=" + pprice + ", pinfo=" + pinfo + ", pimage="
				+ pimage + "]";
	}
	
	
	
}
