package com.blog.repository.system;

import com.blog.domain.SysPermission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * UserInfo持久化类
 *
 * @author Administrator
 *
 */
@Repository
public interface SysPermissionRepository extends JpaRepository<SysPermission, Integer> {

    @Query(value="select  t.* from sys_permission t",nativeQuery = true)
    List<SysPermission> queryall();

}