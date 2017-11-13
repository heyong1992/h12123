package com.blog.domain;

import javax.persistence.Entity;
import java.io.Serializable;

@Entity
public class UserTest extends DataEntity implements Serializable{

	private static final long serialVersionUID = 1L;
		//名称
		private String name;
		//描述
		private String desc;


		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDesc() {
			return desc;
		}
		public void setDesc(String desc) {
			this.desc = desc;
		}

}
