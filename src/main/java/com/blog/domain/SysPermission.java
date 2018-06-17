package com.blog.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.*;

/**
 * 权限实体类;
 *
 */
@Entity
public class SysPermission extends DataEntity implements Serializable{
    private static final long serialVersionUID = 1L;


    private String name;// 名称.
    @Column(columnDefinition = "enum('menu','button')")
    private String resourceType;// 资源类型，[menu|button]
    private String url;// 资源路径.
    private String permission; // 权限字符串,menu例子：role:*，button例子：role:create,role:update,role:delete,role:view
    private Integer parentId; // 父编号
    private String parentIds; // 父编号列表
    private Boolean available = Boolean.FALSE;

    @Transient
    private String isCheck;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Timestamp createDate;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResourceType() {
        return resourceType;
    }

    public void setResourceType(String resourceType) {
        this.resourceType = resourceType;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public String getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(String isCheck) {
        this.isCheck = isCheck;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }
    //  public List<SysRole> getRoles() {
//      return roles;
//  }
//
//  public void setRoles(List<SysRole> roles) {
//      this.roles = roles;
//  }


    @Override
    public String toString() {
        return "SysPermission [id=" + this.getId() + ", name=" + name + ", resourceType=" + resourceType + ", url=" + url
                + ", permission=" + permission + ", parentId=" + parentId + ", parentIds=" + parentIds + ", available="
                + available + "]";
    }

}
