package com.blog.service.system;

import com.blog.domain.SysPermission;
import com.blog.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import com.blog.repository.system.SysPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class SysPermissionService extends BaseService {
	
	@Autowired
	private SysPermissionRepository sysPermissionRepository;


    public List<SysPermission> findAll(SysPermission sysPermission){
            List<Object> param=new ArrayList<>();
            StringBuffer sql=new StringBuffer("select s.* from sys_permission s");
            sql.append(" where 1=1 ");
            if(sysPermission.getCreateDate()!=null){
            sql.append(" and s.create_date =  '%%%s%%'");
            param.add(sysPermission.getCreateDate());
            }

            if(StringUtils.isNotBlank(sysPermission.getName())){
            sql.append(" and s.name like  '%%%s%%'");
            param.add(sysPermission.getName());
            }

            if(sysPermission.getParentId()!=null){
            sql.append(" and s.parent_id like  '%%%s%%'");
            param.add(sysPermission.getParentId());
            }

            if(StringUtils.isNotBlank(sysPermission.getParentIds())){
            sql.append(" and s.parent_ids like  '%%%s%%'");
            param.add(sysPermission.getParentIds());
            }

            if(StringUtils.isNotBlank(sysPermission.getPermission())){
            sql.append(" and s.permission like  '%%%s%%'");
            param.add(sysPermission.getPermission());
            }

            if(StringUtils.isNotBlank(sysPermission.getResourceType())){
            sql.append(" and s.resource_type like  '%%%s%%'");
            param.add(sysPermission.getResourceType());
            }

            if(StringUtils.isNotBlank(sysPermission.getUrl())){
            sql.append(" and s.url like  '%%%s%%'");
            param.add(sysPermission.getUrl());
            }

        List list=this.find(String.format(sql.toString(), param.toArray()),SysPermission.class);
        return list;
    }
    public SysPermission save(SysPermission sysPermission){
		return sysPermissionRepository.save(sysPermission);
    }

    public SysPermission findOne(Long id){
        return sysPermissionRepository.findOne(id);
    }

    public void delete(Long id){
		sysPermissionRepository.delete(id);
     }

    public List<String> findRoleByPermissionid(Long permissionid){
        String sql="select * from sys_role_permission s where s.permission_id=%s";
        sql=String.format(sql,permissionid);
        return this.find1(sql);
    }


}
