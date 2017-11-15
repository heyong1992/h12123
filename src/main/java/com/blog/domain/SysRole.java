package com.blog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

/**
 * 系统角色实体类;
 *
 * @author Administrator
 *
 */
@Entity
public class SysRole extends DataEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String role; // 角色标识程序中判断使用,如"admin",这个是唯一的:
	private String description; // 角色描述,UI界面显示使用
	private Boolean available = Boolean.FALSE; // 是否可用,如果不可用将不会添加给用户
	@Transient
	private String isCheck;
	// 角色 -- 权限关系：多对多关系;
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "SysRolePermission", joinColumns = { @JoinColumn(name = "roleId") }, inverseJoinColumns = {
			@JoinColumn(name = "permissionId") })
	private List<SysPermission> permissions;

	// 用户 - 角色关系定义;
	@ManyToMany
	@JoinTable(name = "SysUserRole", joinColumns = { @JoinColumn(name = "roleId") }, inverseJoinColumns = {
			@JoinColumn(name = "id") })
	private List<UserInfo> userInfos;// 一个角色对应多个用户

	public List<UserInfo> getUserInfos() {
		return userInfos;
	}

	public void setUserInfos(List<UserInfo> userInfos) {
		this.userInfos = userInfos;
	}


	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public List<SysPermission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<SysPermission> permissions) {
		this.permissions = permissions;
	}

	public String getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}

	@Override
	public String toString() {
		return "SysRole [id=" + this.getId() + ", role=" + role + ", description=" + description + ", available=" + available
				+ ", permissions=" + permissions + "]";
	}




}
