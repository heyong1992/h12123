package com.blog.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "sys_dict")
public class SysDict extends DataEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	//名称
	@Column(name = "name")
	private String name;
	//类型编号
	@Column(name = "type_num")
	private String typeNum;
	//创建时间
	@Column(name = "create_date")
	private Timestamp createDate;


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTypeNum() {
		return typeNum;
	}
	public void setTypeNum(String typeNum) {
		this.typeNum = typeNum;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

}
