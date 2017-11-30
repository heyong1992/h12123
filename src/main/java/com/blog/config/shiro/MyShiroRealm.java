package com.blog.config.shiro;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.blog.domain.SysPermission;
import com.blog.domain.SysRole;
import com.blog.domain.UserInfo;
import com.blog.service.system.UserInfoService;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 身份校验核心类  
 *
 * @author Administrator
 *
 */
public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserInfoService userInfoService;

    /**
     * 认证信息(身份验证) Authentication 是用来验证用户身份  
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("MyShiroRealm.doGetAuthenticationInfo()");
        // 获取用户的输入帐号  
        String username = (String) token.getPrincipal();
        System.out.println(token.getCredentials());
        // 通过username从数据库中查找 User对象，如果找到，没找到.  
        // 实际项目中，这里可以根据实际情况做缓存，如果不做，Shiro自己也是有时间间隔机制，2分钟内不会重复执行该方法  
        UserInfo userInfo = userInfoService.findByUsername(username);
        System.out.println("----->>userInfo=" + userInfo);
        if (userInfo == null) {
            return null;
        }
        System.out.println(getName());
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(userInfo, // 用户名
                userInfo.getPassword(), // 密码  
                ByteSource.Util.bytes(userInfo.getCredentialsSalt()), // salt=username+salt  
                getName() // realm name

        );

        return authenticationInfo;
    }


    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // TODO Auto-generated method stub
        //Principal principal = (Principal) getAvailablePrincipal(principals);
        System.out.println("权限配置-->MyShiroRealm.doGetAuthorizationInfo()");

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        UserInfo userInfo = (UserInfo) principals.getPrimaryPrincipal();

        for(SysRole role:userInfo.getRoleList()){
            authorizationInfo.addRole(role.getRole());
            System.out.println(role.getPermissions());
            for(SysPermission p:role.getPermissions()){
                System.out.println(p);
                if(StringUtils.isNotBlank(p.getPermission())){
                    authorizationInfo.addStringPermission(p.getPermission());
                }

            }
        }
        return authorizationInfo;
    }


    /**
     * 授权用户信息
     */
    public static class Principal implements Serializable {

        private static final long serialVersionUID = 1L;

        private Long id;
        private String loginName;
        private String name;
        private Map<String, Object> cacheMap;

        public Principal(UserInfo user) {
            this.id = user.getId();
            this.loginName = user.getUsername();
            this.name = user.getName();
        }

        public Long getId() {
            return id;
        }

        public String getLoginName() {
            return loginName;
        }

        public String getName() {
            return name;
        }

        public Map<String, Object> getCacheMap() {
            if (cacheMap==null){
                cacheMap = new HashMap<String, Object>();
            }
            return cacheMap;
        }

    }


} 