package com.blog.service.system;

import com.blog.domain.SysRole;
import com.blog.repository.system.SysRoleRepository;
import com.blog.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import com.blog.repository.system.SysPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    public SysRole findOne(Integer id){
        return sysRoleRepository.findOne(id);
    }

    public void delete(Integer id){
		sysRoleRepository.delete(id);
     }

    public List<String> findPermissionByRoleid(Integer roleid){
        String sql="select s.permission_id from sys_role_permission s where s.role_id="+roleid;
        return this.find1(sql);
    }

    public List<String> findRByoleUserid(Integer userid){
        String sql="select s.role_id from sys_user_role s where s.id="+userid;
        return this.find1(sql);
    }

    @Transactional
    public int assignAuth(Integer id1,Integer id2,String tableName){
        String sql="insert into %s values(%s,%s)";
        int result=executeUpdate(String.format(sql,tableName,id1,id2));
        return result;
    }
    @Transactional
    public int cancleAuth(Integer roleId,Integer permissionId){
        String sql="delete from sys_role_permission  where role_id=%s and permission_id=%s";
        int result=executeUpdate(String.format(sql,roleId,permissionId));
        return result;
    }

    @Transactional
    public int cancleAuthUser(Integer roleId,Integer userId){
        String sql="delete from sys_user_role  where role_id=%s and id=%s";
        int result=executeUpdate(String.format(sql,roleId,userId));
        return result;
    }




}
