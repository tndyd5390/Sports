package com.sports.dto;

import java.util.List;

public class Order_infoDTO {
	private String tran_no;
	private String recipient;
	private String tel;
	private String postCode;
	private String ord_price;
	private String ord_dn;
	private String address;
	private String addressDetail;
	private String ord_stat;
	private String ord_cancel;
	private String ord_message;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String tranType;
	private String tid;
	private String prod_no;
	private List<OrdProductDTO> ordProductList;
	private String invoice_no;
	private String deli_co_no;
	
	public String getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}
	public String getDeli_co_no() {
		return deli_co_no;
	}
	public void setDeli_co_no(String deli_co_no) {
		this.deli_co_no = deli_co_no;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public List<OrdProductDTO> getOrdProductList() {
		return ordProductList;
	}
	public void setOrdProductList(List<OrdProductDTO> ordProductList) {
		this.ordProductList = ordProductList;
	}
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getTran_no() {
		return tran_no;
	}
	public void setTran_no(String tran_no) {
		this.tran_no = tran_no;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(String ord_price) {
		this.ord_price = ord_price;
	}
	public String getOrd_dn() {
		return ord_dn;
	}
	public void setOrd_dn(String ord_dn) {
		this.ord_dn = ord_dn;
	}
	public String getOrd_stat() {
		return ord_stat;
	}
	public void setOrd_stat(String ord_stat) {
		this.ord_stat = ord_stat;
	}
	public String getOrd_cancel() {
		return ord_cancel;
	}
	public void setOrd_cancel(String ord_cancel) {
		this.ord_cancel = ord_cancel;
	}
	public String getOrd_message() {
		return ord_message;
	}
	public void setOrd_message(String ord_message) {
		this.ord_message = ord_message;
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
	public String getTranType() {
		return tranType;
	}
	public void setTranType(String tranType) {
		this.tranType = tranType;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
}
