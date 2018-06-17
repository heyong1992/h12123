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
	@Column(name = "dict_id")
	private Integer dictId;
	//创建时间
	@Column(name = "create_date")
	private Timestamp createDate;
	//发布人
	@Column(name = "user_id")
	private Integer userId;
	//
	@Basic(fetch = FetchType.LAZY)
	@Column(name = "content")
	private String content;
	//文章标签
	@Column(name = "tag")
	private String tag;


	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getDictId() {
		return dictId;
	}
	public void setDictId(Integer dictId) {
		this.dictId = dictId;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}

}
