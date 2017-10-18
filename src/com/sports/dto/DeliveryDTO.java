package com.sports.dto;

public class DeliveryDTO {
	private String adUrl;
	private String complete;
	private String completeYN;
	private String estimate;
	private byte[] firstDetail;
	private String invoiceNo;
	private String itemImage;
	private String itemName;
	private byte[] lastDetail;
	private byte[] lastStateDetail;
	private String level;
	private String orderNumber;
	private String productInfo;
	private String receiverAddr;
	private String receiverName;
	private String recipient;
	private String result;
	private String senderName;
	private Object[] trackingDetails;
	private String zipCode;
	private String status;
	private String msg;
	private String code;
	
	
	
	public Object[] getTrackingDetails() {
		return trackingDetails;
	}
	public void setTrackingDetails(Object[][] trackingDetails) {
		this.trackingDetails = trackingDetails;
	}
	public byte[] getFirstDetail() {
		return firstDetail;
	}
	public void setFirstDetail(byte[] firstDetail) {
		this.firstDetail = firstDetail;
	}
	public byte[] getLastDetail() {
		return lastDetail;
	}
	public void setLastDetail(byte[] lastDetail) {
		this.lastDetail = lastDetail;
	}
	public byte[] getLastStateDetail() {
		return lastStateDetail;
	}
	public void setLastStateDetail(byte[] lastStateDetail) {
		this.lastStateDetail = lastStateDetail;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAdUrl() {
		return adUrl;
	}
	public void setAdUrl(String adUrl) {
		this.adUrl = adUrl;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	public String getCompleteYN() {
		return completeYN;
	}
	public void setCompleteYN(String completeYN) {
		this.completeYN = completeYN;
	}
	public String getEstimate() {
		return estimate;
	}
	public void setEstimate(String estimate) {
		this.estimate = estimate;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getReceiverAddr() {
		return receiverAddr;
	}
	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}