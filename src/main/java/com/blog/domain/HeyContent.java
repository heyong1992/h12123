package com.blog.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "hey_content")
public class HeyContent extends DataEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	//标题
	@Column(name = "title")
	private String title;

	//类型id
	//@Column(name = "dict_id")
	@OneToOne
	@JoinColumn(name = "dict_id")
	private SysDict sysDict;

	//内容
	@Column(name = "content")
	private byte[] content;

	//创建时间
	@Column(name = "create_date")
	private Timestamp createDate;

	//发布人
	@Column(name = "user_id")
	private Integer userId;


	@Column(name = "tag")
	private String tag;//文章tag

	@Transient
	private String contentShow;





	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}


	public SysDict getSysDict() {
		return sysDict;
	}

	public void setSysDict(SysDict sysDict) {
		this.sysDict = sysDict;
	}

	@Lob @Basic(fetch = FetchType.LAZY)
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
		this.content = content;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getContentShow() {
		if(this.content==null){
			return "";
		}

		return new String(this.content);
	}


}
