package com.blog.service.system;

import com.blog.domain.SysRole;
import com.blog.repository.system.SysRoleRepository;
import com.blog.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import com.blog.repository.system.SysPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class SysRoleService extends BaseService {
	
	@Autowired
	private SysRoleRepository sysRoleRepository;

	public static <T> List<T> copyIterator(Iterable<T> iter) {
    	List<T> copy = new ArrayList<T>();
        while (iter.iterator().hasNext())
        copy.add(iter.iterator().next());
        return copy;
    }
    public List<SysRole> findAll(SysRole sysRole){
            List<Object> param=new ArrayList<>();
            StringBuffer sql=new StringBuffer("select s.* from sys_role s");
            sql.append(" where 1=1 ");

            if(StringUtils.isNotBlank(sysRole.getDescription())){
            sql.append(" and s.description like  '%%%s%%'");
            param.add(sysRole.getDescription());
            }

            if(StringUtils.isNotBlank(sysRole.getRole())){
            sql.append(" and s.role like  '%%%s%%'");
            param.add(sysRole.getRole());
            }

        List list=this.find(String.format(sql.toString(), param.toArray()),SysRole.class);
        return list;
    }
    public void save(SysRole sysRole){
		sysRoleRepository.save(sysRole);
    }

    public SysRole findOne(Long id){
        return sysRoleRepository.findOne(id);
    }

    public void delete(Long id){
		sysRoleRepository.delete(id);
     }


}
