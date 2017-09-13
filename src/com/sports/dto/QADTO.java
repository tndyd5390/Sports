package com.sports.dto;

public class QADTO {

	private String qa_no;
	private String answer;
	private String user_no;
	private String secret_yn;
	private String title;
	private String contents;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	public QADTO(){}
	
	public QADTO(String user_no, String secret_yn, String title, String contents, String reg_user_no){
		this.user_no = user_no;
		this.secret_yn = secret_yn;
		this.title = title;
		this.contents = contents;
		this.reg_user_no = reg_user_no;
	}
	
	public String getQa_no() {
		return qa_no;
	}
	public void setQa_no(String qa_no) {
		this.qa_no = qa_no;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getSecret_yn() {
		return secret_yn;
	}
	public void setSecret_yn(String secret_yn) {
		this.secret_yn = secret_yn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReg_user_no() {
		return reg_user_no;
	}
	public void setReg_user_no(String reg_user_no) {
		this.reg_user_no = reg_user_no;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getChg_user_no() {
		return chg_user_no;
	}
	public void setChg_user_no(String chg_user_no) {
		this.chg_user_no = chg_user_no;
	}
	public String getChg_dt() {
		return chg_dt;
	}
	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}
}