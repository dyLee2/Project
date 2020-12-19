package org.comstudy21.vo;

import java.util.Date;

public class BoardVO {
	
	private int gNo;
	private String gTitle;
	private String gContents;
	private String gWriter;
	private Date gDate;
	private int fNo;
	private String mId;
	
	
	
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public String getgTitle() {
		return gTitle;
	}
	public void setgTitle(String gTitle) {
		this.gTitle = gTitle;
	}
	public String getgContents() {
		return gContents;
	}
	public void setgContents(String gContents) {
		this.gContents = gContents;
	}
	public Date getgDate() {
		return gDate;
	}
	public void setgDate(Date gDate) {
		this.gDate = gDate;
	}
	public String getgWriter() {
		return gWriter;
	}
	public void setgWriter(String gWriter) {
		this.gWriter = gWriter;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
}
