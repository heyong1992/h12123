package com.blog.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "hey_ticket")
public class HeyTicket extends DataEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	//身份证号
	@Column(name = "card_infos")
	private String cardInfos;
	//目的地
	@Column(name = "end_address")
	private String endAddress;
	//出发时间
	@Column(name = "go_date")
	private String goDate;
	//QQ号码
	@Column(name = "qq_number")
	private String qqNumber;
	//出发地
	@Column(name = "start_address")
	private String startAddress;
	//联系电话
	@Column(name = "tel_phone")
	private String telPhone;


	public String getCardInfos() {
		return cardInfos;
	}
	public void setCardInfos(String cardInfos) {
		this.cardInfos = cardInfos;
	}
	public String getEndAddress() {
		return endAddress;
	}
	public void setEndAddress(String endAddress) {
		this.endAddress = endAddress;
	}
	public String getGoDate() {
		return goDate;
	}
	public void setGoDate(String goDate) {
		this.goDate = goDate;
	}
	public String getQqNumber() {
		return qqNumber;
	}
	public void setQqNumber(String qqNumber) {
		this.qqNumber = qqNumber;
	}
	public String getStartAddress() {
		return startAddress;
	}
	public void setStartAddress(String startAddress) {
		this.startAddress = startAddress;
	}
	public String getTelPhone() {
		return telPhone;
	}
	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}

}
