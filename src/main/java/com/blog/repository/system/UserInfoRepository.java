package com.blog.repository.system;

import org.springframework.data.repository.CrudRepository;

import com.blog.domain.UserInfo;
import org.springframework.stereotype.Repository;

/**
 * UserInfo持久化类
 *
 * @author Administrator
 *
 */
@Repository
public interface UserInfoRepository extends CrudRepository<UserInfo, Long> {
    /** 通过username查找用户信息 **/
    public UserInfo findByUsername(String username);

}