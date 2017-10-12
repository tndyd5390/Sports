package com.sports.dto;

public class QADTO {

	private String qa_no; 
	private String q_no;
	private String answer_yn;
	private String secret_yn;
	private String new_yn;
	private String title;	
	private String contents; 
	private String file_path;	
	private String file_name;
	private String file_org_name;
	private String reg_user_no;	
	private String reg_dt; 
	private String chg_user_no; 
	private String chg_dt; 
	private String read_more;
	private String user_name;
	private String[] allCheckSeq;
	private String search; 
	
	public String getNew_yn() {
		return new_yn;
	}

	public void setNew_yn(String new_yn) {
		this.new_yn = new_yn;
	}
	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getQa_no() {
		return qa_no;
	}
	
	public void setQa_no(String qa_no) {
		this.qa_no = qa_no;
	}
	
	public String getQ_no() {
		return q_no;
	}
	
	public void setQ_no(String q_no) {
		this.q_no = q_no;
	}
	
	public String getAnswer_yn() {
		return answer_yn;
	}
	
	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
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
	
	public String getFile_path() {
		return file_path;
	}
	
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	public String getFile_name() {
		return file_name;
	}
	
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	public String getFile_org_name() {
		return file_org_name;
	}

	public void setFile_org_name(String file_org_name) {
		this.file_org_name = file_org_name;
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
	
	public String getRead_more() {
		return read_more;
	}
	
	public void setRead_more(String read_more) {
		this.read_more = read_more;
	}
	
	public String[] getAllCheckSeq() {
		return allCheckSeq;
	}

	public void setAllCheckSeq(String[] allCheckSeq) {
		this.allCheckSeq = allCheckSeq;
	}
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}