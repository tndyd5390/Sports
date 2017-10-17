package com.sports.dto;

import java.util.List;

public class OrdProductDTO {
	private String ord_prod_no;
	private String tran_no;
	private String prod_no;
	private String prod_name;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private List<OrdProdOptionDTO> ord_prodOpt_list;
	
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public List<OrdProdOptionDTO> getOrd_prodOpt_list() {
		return ord_prodOpt_list;
	}
	public void setOrd_prodOpt_list(List<OrdProdOptionDTO> ord_prodOpt_list) {
		this.ord_prodOpt_list = ord_prodOpt_list;
	}
	public String getOrd_prod_no() {
		return ord_prod_no;
	}
	public void setOrd_prod_no(String ord_prod_no) {
		this.ord_prod_no = ord_prod_no;
	}
	public String getTran_no() {
		return tran_no;
	}
	public void setTran_no(String tran_no) {
		this.tran_no = tran_no;
	}
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
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
