package com.blog.service.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blog.domain.UserInfo;
import com.blog.repository.system.UserInfoRepository;

@Service
public class UserInfoService{
    @Autowired
    private UserInfoRepository userInfoRepository;

    @Transactional(readOnly=true)
    public UserInfo findByUsername(String username) {
        return userInfoRepository.findByUsername(username);
    }

}
