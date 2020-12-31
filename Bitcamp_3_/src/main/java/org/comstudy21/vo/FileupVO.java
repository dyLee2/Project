package org.comstudy21.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FileupVO {

	private int fNo;
	private int gNo;
	private String orgName;
	private String strName;
	private int fSize;
	private Date fDate;
	private String fDel;
	private String mId;
}
