package com.blog.repository;

import com.blog.domain.${className?cap_first};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ${className?cap_first}Repository extends JpaRepository<${className?cap_first}, Integer> {
	


}
