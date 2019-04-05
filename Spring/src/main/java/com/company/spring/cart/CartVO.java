package com.company.spring.cart;

public class CartVO {
	private int cidx;
	private String mid;
	private int pidx;
	private String pname;
	private int pprice;
	private int camount;
	private int cprice;
	
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
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
	public int getCamount() {
		return camount;
	}
	public void setCamount(int camount) {
		this.camount = camount;
	}
	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
	
	@Override
	public String toString() {
		return "CartVO [cidx=" + cidx + ", mid=" + mid + ", pidx=" + pidx + ", pname=" + pname + ", pprice=" + pprice
				+ ", camount=" + camount + ", cprice=" + cprice + "]";
	}
	
}
