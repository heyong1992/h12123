package com.blog.service;

import com.blog.domain.${className?cap_first};
import com.blog.repository.${className?cap_first}Repository;
import org.apache.commons.lang3.StringUtils;
import com.blog.repository.system.SysPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class ${className?cap_first}Service extends BaseService{
	
	@Autowired
	private ${className?cap_first}Repository ${className}Repository;

	public static <T> List<T> copyIterator(Iterable<T> iter) {
    	List<T> copy = new ArrayList<T>();
        while (iter.iterator().hasNext())
        copy.add(iter.iterator().next());
        return copy;
    }
    public List<${className?cap_first}> findAll(${className?cap_first} ${className}){
            List<Object> param=new ArrayList<>();
            StringBuffer sql=new StringBuffer("select s.* from ${tableName} s");
            sql.append(" where 1=1 ");
    <#list columnList as pl>
        <#if pl.column_type == "Timestamp">
            if(${className}.get${pl.column_name?cap_first}()!=null){
            sql.append(" and s.${pl.column_name} =  '%%%s%%'");
            param.add(${className}.get${pl.column_name?cap_first}());
            }
        <#elseif pl.column_type == "int">
            if(${className}.get${pl.column_name?cap_first}()!=null){
            sql.append(" and s.${pl.column_name} =  '%%%s%%'");
            param.add(${className}.get${pl.column_name?cap_first}());
            }
        <#else>
            if(StringUtils.isNotBlank(${className}.get${pl.column_name?cap_first}())){
            sql.append(" and s.${pl.column_name} like  '%%%s%%'");
            param.add(${className}.get${pl.column_name?cap_first}());
            }
        </#if>

    </#list>
        List list=this.find(String.format(sql.toString(), param.toArray()),${className?cap_first}.class);
        return list;
    }
    public void save(${className?cap_first} ${className}){
		${className}Repository.save(${className});
    }

    public ${className?cap_first} findOne(Long id){
        return ${className}Repository.findOne(id);
    }

    public void delete(Long id){
		${className}Repository.delete(id);
     }


}
