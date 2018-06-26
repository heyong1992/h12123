package com.blog.service;

import com.blog.domain.SysDict;
import com.blog.repository.SysDictRepository;
import org.apache.commons.lang3.StringUtils;
import com.blog.repository.system.SysPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class SysDictService extends BaseService{
	
	@Autowired
	private SysDictRepository sysDictRepository;

    public List<SysDict> findAll(SysDict sysDict){
            List<Object> param=new ArrayList<>();
            StringBuffer sql=new StringBuffer("select s.* from sys_dict s");
            sql.append(" where 1=1 ");
            if(StringUtils.isNotBlank(sysDict.getName())){
            sql.append(" and s.name like  '%%%s%%'");
            param.add(sysDict.getName());
            }

            if(StringUtils.isNotBlank(sysDict.getTypeNum())){
            sql.append(" and s.type_num like  '%%%s%%'");
            param.add(sysDict.getTypeNum());
            }


        List list=this.find(String.format(sql.toString(), param.toArray()),SysDict.class);
        return list;
    }
    public void save(SysDict sysDict){
		sysDictRepository.save(sysDict);
    }

    public SysDict findOne(Integer id){
        return sysDictRepository.findOne(id);
    }

    public void delete(Integer id){
		sysDictRepository.delete(id);
     }


}
