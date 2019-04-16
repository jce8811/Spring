package com.company.spring.utils;

public class CriteriaAdmin {
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	public CriteriaAdmin() {
		this.page = 1;
		this.perPageNum = 20;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 20;
			return;
		}
		this.perPageNum = perPageNum;
	}
	public int getRowStart() {
		rowStart = ((page - 1)* perPageNum) + 1;
		return rowStart;
	}
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
	
}

