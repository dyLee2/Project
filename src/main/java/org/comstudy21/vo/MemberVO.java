package org.comstudy21.vo;

public class MemberVO {

	private String mId;
    private String PW;
    private String mName;

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getPW() {
		return PW;
	}

	public void setPW(String pW) {
		PW = pW;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", PW=" + PW + ", mName=" + mName + "]";
	}
      
   
       
      
       
       
}
