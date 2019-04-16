package com.company.spring.utils;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakerAdmin {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private CriteriaAdmin cria;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public CriteriaAdmin getCria() {
		return cria;
	}
	public void setCria(CriteriaAdmin cria) {
		this.cria = cria;
	}
	
	private void calcData() {
		endPage = (int) (Math.ceil(cria.getPage() / (double)displayPageNum)*displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cria.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1? false : true;
		next = endPage * cria.getPerPageNum() >= totalCount? false : true;
	}
	
	// perPageNum = 10
	public String makeQueryAdmin(int page){
	 UriComponents uriComponents =
	   UriComponentsBuilder.newInstance()
	   .queryParam("page", page)
	   .queryParam("perPageNum", cria.getPerPageNum())
	   .build();
	   
	 return uriComponents.toUriString();
	 }
	
}