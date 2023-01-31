package com.sy.user.service;

public class CommonVO {

	private int codeCategory;
	private int code;
	private String codeName;
	public int getCodeCategory() {
		return codeCategory;
	}
	public void setCodeCategory(int codeCategory) {
		this.codeCategory = codeCategory;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	@Override
	public String toString() {
		return "CommonVO [codeCategory=" + codeCategory + ", code=" + code + ", codeName=" + codeName + "]";
	}
	
	
}
