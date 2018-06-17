package com.blog.repository;

import com.blog.domain.HeyTicket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HeyTicketRepository extends JpaRepository<HeyTicket, Long> {
	


}
