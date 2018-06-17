package com.blog.repository;

import com.blog.domain.HeyContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HeyContentRepository extends JpaRepository<HeyContent, Long> {
	


}
