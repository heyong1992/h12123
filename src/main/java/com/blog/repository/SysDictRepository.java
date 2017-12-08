package com.blog.repository;

import com.blog.domain.SysDict;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SysDictRepository extends JpaRepository<SysDict, Integer> {
	


}
