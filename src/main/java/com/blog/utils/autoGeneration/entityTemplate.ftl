package com.blog.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
<#list columnList as pl>
	<#if pl.column_type == "Date">
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
	</#if>
	<#if pl.column_type == "Timestamp">
import java.sql.Timestamp;
	</#if>
</#list>

@Entity
@Table(name = "${tableName}")
public class ${className?cap_first} extends DataEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	<#list columnList as pl>
	//${pl.column_desc}
	@Column(name = "${pl.column_name_table}")
	private ${pl.column_type} ${pl.column_name};
	</#list>


	<#list columnList as pl>
	<#if pl.column_type == "Date">
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	</#if>
	public ${pl.column_type} get${pl.column_name?cap_first}() {
		return ${pl.column_name};
	}
	public void set${pl.column_name?cap_first}(${pl.column_type} ${pl.column_name}) {
		this.${pl.column_name} = ${pl.column_name};
	}
	</#list>

}
