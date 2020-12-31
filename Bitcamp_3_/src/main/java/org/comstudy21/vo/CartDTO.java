package org.comstudy21.vo;

import lombok.Data;

@Data
public class CartDTO {
	private String pKey;
	private String mId;
	private int cCount;
	private int cPrice;
	private int cartNum;
}
