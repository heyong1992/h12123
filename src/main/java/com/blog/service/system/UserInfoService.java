package com.blog.service.system;

import com.blog.domain.UserInfo;
import com.blog.repository.system.UserInfoRepository;
import com.blog.service.BaseService;
import com.blog.utils.encrypt.MD5Tools;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.provider.MD5;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserInfoService extends BaseService{

    @Autowired
    private UserInfoRepository userInfoRepository;


    public UserInfo findByUsername(String username){
        return userInfoRepository.findByUsername(username);
    }
    public List<UserInfo> findAll(UserInfo userInfo){
        List<Object> param=new ArrayList<>();
        StringBuffer sql=new StringBuffer("select s.* from user_info s");
        sql.append(" where 1=1 ");
        if(userInfo.getCreateDate()!=null){
            sql.append(" and s.createDate =  '%%%s%%'");
            param.add(userInfo.getCreateDate());
        }

        if(StringUtils.isNotBlank(userInfo.getName())){
            sql.append(" and s.name like  '%%%s%%'");
            param.add(userInfo.getName());
        }

        if(StringUtils.isNotBlank(userInfo.getPassword())){
            sql.append(" and s.password like  '%%%s%%'");
            param.add(userInfo.getPassword());
        }

        if(StringUtils.isNotBlank(userInfo.getSalt())){
            sql.append(" and s.salt like  '%%%s%%'");
            param.add(userInfo.getSalt());
        }

        if(StringUtils.isNotBlank(userInfo.getUsername())){
            sql.append(" and s.username like  '%%%s%%'");
            param.add(userInfo.getUsername());
        }

        List list=this.find(String.format(sql.toString(), param.toArray()),UserInfo.class);
        return list;
    }
    public void save(UserInfo userInfo){
        String salt= MD5Tools.MD5(userInfo.getUsername());
        userInfo.setSalt(salt);
        String password= new SimpleHash("md5", // 用户名
                userInfo.getPassword(), // 密码
                ByteSource.Util.bytes(userInfo.getCredentialsSalt()), // salt=username+salt
                2).toHex();
        userInfo.setPassword(password);
        userInfoRepository.save(userInfo);
    }

    public UserInfo findOne(Integer id){
        return userInfoRepository.findOne(id);
    }

    public void delete(Integer id){
        userInfoRepository.delete(id);
    }


}
