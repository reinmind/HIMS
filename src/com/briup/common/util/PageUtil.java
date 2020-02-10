package com.briup.common.util;

public class PageUtil {
	private int currentPage;
	private int totalCount;
	private int totalPages;
	private int pageSzie;
	public PageUtil(int currentPage, int totalCount, int totalPages, int pageSzie) {
		super();
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.totalPages = totalPages;
		this.pageSzie = pageSzie;
	}
	
	public PageUtil() {
		super();
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getPageSzie() {
		return pageSzie;
	}
	public void setPageSzie(int pageSzie) {
		this.pageSzie = pageSzie;
	}
	
}
