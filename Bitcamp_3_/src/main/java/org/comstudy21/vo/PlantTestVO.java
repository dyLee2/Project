package org.comstudy21.vo;

public class PlantTestVO {
	private String p_name;
	private String p_lv;
	private String p_size;
	private String p_reason;
	private String p_ownPet;

	public PlantTestVO() {}
	
	public PlantTestVO(String p_name) {
		this.p_name = p_name;
	}
	
//	public PlantTestVO(String p_name, String p_toxic) {
//		this.p_name = p_name;
//		this.p_toxic = p_toxic;
//	}
	
	public PlantTestVO(String p_lv, String p_size, String p_reason, String p_ownPet) {
		this.p_lv = p_lv;
		this.p_size = p_size;
		this.p_reason = p_reason;
		this.p_ownPet = p_ownPet;
	};

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_lv() {
		return p_lv;
	}

	public void setP_lv(String p_lv) {
		this.p_lv = p_lv;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public String getP_reason() {
		return p_reason;
	}

	public void setP_reason(String p_reason) {
		this.p_reason = p_reason;
	}

	public String getP_ownPet() {
		return p_ownPet;
	}

	public void setP_ownPet(String p_ownPet) {
		this.p_ownPet = p_ownPet;
	}

	@Override
	public String toString() {
		return "p_lv=" + p_lv + ", p_size=" + p_size + ", p_reason=" + p_reason
				+ ", p_ownPet=" + p_ownPet;
	}
	
	
}
