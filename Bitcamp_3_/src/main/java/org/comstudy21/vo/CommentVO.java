package org.comstudy21.vo;

import java.util.Date;

public class CommentVO {
	
	private int gNo;
	private int gcNo;
	private String gcContents;
	private String gcWriter;
	private Date gcDate;
	
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public int getGcNo() {
		return gcNo;
	}
	public void setGcNo(int gcNo) {
		this.gcNo = gcNo;
	}
	public String getGcContents() {
		return gcContents;
	}
	public void setGcContents(String gcContents) {
		this.gcContents = gcContents;
	}
	public String getGcWriter() {
		return gcWriter;
	}
	public void setGcWriter(String gcWriter) {
		this.gcWriter = gcWriter;
	}
	public Date getGcDate() {
		return gcDate;
	}
	public void setGcDate(Date gcDate) {
		this.gcDate = gcDate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [gNo=" + gNo + ", gcNo=" + gcNo + ", gcContents=" + gcContents + ", gcWriter=" + gcWriter
				+ ", gcDate=" + gcDate + "]";
	}
	
	
}
